using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ProyectoDAI.Admin.Catalog
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlTables_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedTable = ddlTables.SelectedValue;

            if (selectedTable != "Selecciona un catálogo")
            {
                string query = "SELECT * FROM " + selectedTable;

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                OdbcDataReader reader = command.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);

                gvItems.DataSource = dt;
                gvItems.DataBind();

                gvItems.Visible = true;

                con.Close();

                txbNewItem.Visible = true;
                btnInsert.Visible = true;
            }
            else
            {
                txbNewItem.Visible = false;
                btnInsert.Visible = false;
                gvItems.Visible = false;
                fvItem.Visible = false;
            }
        }

        protected void gvItems_SelectedIndexChanged(object sender, EventArgs e)
        {

            // Get the selected table
            string selectedTable = ddlTables.SelectedValue;

            if (selectedTable != "Selecciona un catálogo")
            {
                // Get the selected item's ID
                string itemId = gvItems.SelectedDataKey.Value.ToString();

                string query = "SELECT * FROM " + selectedTable + " WHERE Id = ?";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                // Add the item ID as a parameter to prevent SQL injection
                command.Parameters.AddWithValue("?", itemId);

                OdbcDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    // Rename the columns
                    dt.Columns[0].ColumnName = "id";
                    dt.Columns[1].ColumnName = "value";

                    // Bind the selected item to the FormView
                    fvItem.DataSource = dt;
                    fvItem.DataBind();

                    fvItem.Visible = true;
                }

                con.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Get the selected table
            string selectedTable = ddlTables.SelectedValue;
            string itemId = gvItems.SelectedDataKey.Value.ToString();
            TextBox txtValue = (TextBox)fvItem.FindControl("txbNewValue");
            string updatedValue = txtValue.Text;
            
            if (selectedTable != "Selecciona un catálogo" && updatedValue != "")
            {
                string columnName;

                if (selectedTable == "Gender")
                {
                    columnName = "gender";
                }
                else if (selectedTable == "PartsOfDay")
                {
                    columnName = "part_of_day";
                }
                else if (selectedTable == "Exercise")
                {
                    columnName = "exercise";
                }
                else if (selectedTable == "Intensity")
                {
                    columnName = "intensity";
                }
                else if (selectedTable == "Medicine")
                {
                    columnName = "name";
                }
                else
                {
                    columnName = "value";
                }

                string query = "UPDATE " + selectedTable + " SET " + columnName + " = ? WHERE id = ?";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                command.Parameters.AddWithValue("value", updatedValue);
                command.Parameters.AddWithValue("id", itemId);

                command.ExecuteNonQuery();

                con.Close();

                Response.Redirect("~/Admin/Catalog/");
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            // Get the selected table
            string selectedTable = ddlTables.SelectedValue;
            string newItem = txbNewItem.Text;

            if (selectedTable != "Selecciona un catálogo" && newItem != "")
            {
                string queryId = "SELECT MAX(Id) FROM " + selectedTable;
                string query = "INSERT INTO " + selectedTable + " VALUES (?, ?)";

                int id;

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(queryId, con);

                OdbcDataReader reader = command.ExecuteReader();

                reader.Read();

                try
                {
                    id = reader.GetInt32(0) + 1;
                }
                catch (Exception)
                {
                    id = 1;
                }

                command = new OdbcCommand(query, con);

                command.Parameters.AddWithValue("id", id);
                command.Parameters.AddWithValue("item", newItem);

                command.ExecuteNonQuery();

                con.Close();

                Response.Redirect("~/Admin/Catalog/");
            }
        }
    }
}