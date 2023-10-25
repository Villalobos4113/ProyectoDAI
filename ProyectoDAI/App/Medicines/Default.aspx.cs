using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.App.Medicines
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txbQuantity.Attributes["min"] = "1";
                txbNewQuantity.Attributes["min"] = "0";

                Set_ddlMedicines_and_tblMedicines();
            }
        }

        protected void Set_ddlMedicines_and_tblMedicines()
        {
            // SQL query to retrieve medicine data
            string query = "SELECT UserMedicine.medicine_id, UserMedicine.quantity, Medicine.name FROM UserMedicine INNER JOIN Medicine ON UserMedicine.medicine_id = Medicine.id WHERE UserMedicine.user_id = ?";
            string queryMedicines = "SELECT * FROM Medicine WHERE id NOT IN (SELECT medicine_id FROM UserMedicine WHERE user_id = ?)";

            OdbcConnection con = new ConnectionDB().con;
            OdbcCommand command = new OdbcCommand(query, con);

            command.Parameters.AddWithValue("id", Session["user_id"]);

            OdbcDataReader reader = command.ExecuteReader();

            // Create a DataTable to store the data
            DataTable dt = new DataTable();
            dt.Columns.Add("medicine_id");
            dt.Columns.Add("quantity");
            dt.Columns.Add("name");

            // Create table header
            TableHeaderRow headerRow = new TableHeaderRow();
            TableHeaderCell headerCell1 = new TableHeaderCell();
            headerCell1.Text = "Medicine Name";
            headerRow.Cells.Add(headerCell1);
            TableHeaderCell headerCell2 = new TableHeaderCell();
            headerCell2.Text = "Quantity";
            headerRow.Cells.Add(headerCell2);
            tblMedicines.Rows.AddAt(0, headerRow);

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    // Populate the dropdown list
                    ListItem newItem = new ListItem(reader["name"].ToString(), reader["medicine_id"].ToString());
                    ddlMedicines.Items.Add(newItem);

                    // Populate the table
                    TableRow newRow = new TableRow();
                    TableCell newCell1 = new TableCell();
                    newCell1.Text = reader["name"].ToString();
                    newRow.Cells.Add(newCell1);
                    TableCell newCell2 = new TableCell();
                    newCell2.Text = reader["quantity"].ToString();
                    newRow.Cells.Add(newCell2);
                    tblMedicines.Rows.Add(newRow);

                    // Add data to the DataTable
                    dt.Rows.Add(reader["medicine_id"], reader["quantity"], reader["name"]);
                }
            }

            command = new OdbcCommand(queryMedicines, con);

            command.Parameters.AddWithValue("id", Session["user_id"]);

            reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    // Populate the dropdown list
                    ListItem newItem = new ListItem(reader["name"].ToString(), reader["id"].ToString());
                    ddlNewMedicine.Items.Add(newItem);
                }
            }

            con.Close();

            // Save the DataTable to the ViewState
            ViewState["DataTable"] = dt;

            // Add a default "Selecciona una medicina" item at the beginning of the dropdown list
            ddlMedicines.Items.Insert(0, new ListItem("Selecciona una medicina", ""));
            ddlNewMedicine.Items.Insert(0, new ListItem("Selecciona una medicina", ""));
        }

        protected void SaveDataNewQuantity_Click(object sender, EventArgs e)
        {
            bool verif = false;

            string query = "UPDATE UserMedicine SET quantity = quantity + ? WHERE user_id = ? AND medicine_id = ?";

            string medicine_id = ddlMedicines.SelectedValue;
            string quantity = txbQuantity.Text;

            if (medicine_id != "" && quantity != "")
            {
                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                command.Parameters.AddWithValue("quantity", quantity);
                command.Parameters.AddWithValue("user_id", Session["user_id"]);
                command.Parameters.AddWithValue("medicine_id", medicine_id);

                try
                {
                    command.ExecuteNonQuery();
                    verif = true;
                }
                catch (Exception ex)
                {
                    lblError1.Text = ex.Message;
                }
                

                con.Close();
            }
            else
            {
                lblError1.Text = "Por favor, selecciona una medicina y escribe una cantidad.";
            }


            if (verif)
            {
                Response.Redirect("/App/Medicines");
            }    
        }

        protected void SaveDataNewMedicine_Click(object sender, EventArgs e)
        {
            bool verif = false;

            string query = "INSERT INTO UserMedicine VALUES (?, ?, ?)";

            string medicine_id = ddlNewMedicine.SelectedValue;
            string medicine_name = txbNewMedicine.Text;
            string quantity = txbNewQuantity.Text;

            if ((medicine_id != "" || medicine_name != "") && quantity != "")
            {
                if (medicine_id != "")
                {
                    OdbcConnection con = new ConnectionDB().con;
                    OdbcCommand command = new OdbcCommand(query, con);

                    command.Parameters.AddWithValue("quantity", quantity);
                    command.Parameters.AddWithValue("user_id", Session["user_id"]);
                    command.Parameters.AddWithValue("medicine_id", medicine_id);

                    try
                    {
                        command.ExecuteNonQuery();
                        verif = true;
                    }
                    catch (Exception ex)
                    {
                        lblError2.Text = ex.Message;
                    }

                    con.Close();
                }
                else
                {
                    string queryMedicine = "INSERT INTO Medicine VALUES (?, ?)";
                    string queryIdMedicine = "Select MAX(id) as id FROM Medicine";

                    int id;

                    OdbcConnection con = new ConnectionDB().con;
                    OdbcCommand command = new OdbcCommand(queryIdMedicine, con);
                    OdbcDataReader reader = command.ExecuteReader();

                    reader.Read();

                    try
                    {
                        id = reader.GetInt32(0) + 1;
                    }
                    catch
                    {
                        id = 1;
                    }

                    command = new OdbcCommand(queryMedicine, con);

                    command.Parameters.AddWithValue("id", id);
                    command.Parameters.AddWithValue("name", medicine_name);

                    try
                    {
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        lblError2.Text = ex.Message;
                    }

                    command = new OdbcCommand(query, con);

                    command.Parameters.AddWithValue("quantity", quantity);
                    command.Parameters.AddWithValue("user_id", Session["user_id"]);
                    command.Parameters.AddWithValue("medicine_id", id);

                    try
                    {
                        command.ExecuteNonQuery();
                        verif = true;
                    }
                    catch (Exception ex)
                    {
                        lblError2.Text = ex.Message;
                    }
                }
            }
            else
            {
                lblError2.Text = "Por favor, selecciona una medicina o escribe el nombre de una nueva medicina y escribe una cantidad.";
            }


            if (verif)
            {
                Response.Redirect("/App/Medicines");
            }
        }
    }
}