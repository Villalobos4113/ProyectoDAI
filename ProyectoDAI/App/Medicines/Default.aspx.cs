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

            OdbcConnection con = new ConnectionDB().con;
            OdbcCommand command = new OdbcCommand(query, con);

            command.Parameters.AddWithValue("id", Session["user_id"]);

            OdbcDataReader reader = command.ExecuteReader();

            // Create table header
            TableHeaderRow headerRow = new TableHeaderRow();
            TableHeaderCell headerCell1 = new TableHeaderCell();
            headerCell1.Text = "Nombre";
            headerRow.Cells.Add(headerCell1);
            TableHeaderCell headerCell2 = new TableHeaderCell();
            headerCell2.Text = "Cantidad";
            headerRow.Cells.Add(headerCell2);
            tblMedicines.Rows.Add(headerRow);

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
                }
            }

            con.Close();

            // Add a default "Selecciona una medicina" item at the beginning of the dropdown list
            ddlMedicines.Items.Insert(0, new ListItem("Selecciona una medicina", ""));
        }

        protected void SaveDataNewQuantity_Click(object sender, EventArgs e)
        {

        }

        protected void SaveDataNewMedicine_Click(object sender, EventArgs e)
        {

        }
    }
}