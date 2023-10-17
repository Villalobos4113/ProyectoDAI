using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace ProyectoDAI.Auth
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already logged in; if yes, redirect to the App, otherwise set up the gender dropdown list
            if (Session["user_id"] != null && Session["user_first_name"] != null && Session["user_last_name"] != null)
            {
                Response.Redirect("~/App/");
            }
            else
            {
                // Populate the gender dropdown list
                Set_ddlGender();
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            int id;
            string first_name = txtFirstName.Text;
            string last_name = txtLastName.Text;
            string email = txtNewEmail.Text;
            string password = ComputeSha256Hash(txtNewPassword.Text);
            string confirmPassword = ComputeSha256Hash(txtConfirmPassword.Text);
            string date_birth = txtDateOfBirth.Text;
            string gender_id = ddlGender.SelectedValue;

            if (password == confirmPassword)
            {
                // SQL query for user insertion and ID retrieval
                String queryInsert = "INSERT INTO [User] VALUES (?,?,?,?,?,?,?)";
                String queryId = "SELECT MAX(id) FROM [User]";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(queryId, con);
                OdbcDataReader reader = command.ExecuteReader();

                reader.Read();

                try
                {
                    // Retrieve the next available user ID
                    id = reader.GetInt32(0) + 1;
                }
                catch
                {
                    id = 1;
                }

                command = new OdbcCommand(queryInsert, con);

                // Add user data parameters to the insert command
                command.Parameters.AddWithValue("id", id);
                command.Parameters.AddWithValue("first_name", first_name);
                command.Parameters.AddWithValue("last_name", last_name);
                command.Parameters.AddWithValue("email", email);
                command.Parameters.AddWithValue("password", password);
                command.Parameters.AddWithValue("date_birth", date_birth);
                command.Parameters.AddWithValue("gender_id", gender_id);

                try
                {
                    // Execute the user insertion
                    command.ExecuteNonQuery();

                    // Set session timeout and store user information in session variables
                    Session.Timeout = 10;
                    Session.Add("user_id", id);
                    Session.Add("user_first_name", first_name);
                    Session.Add("user_last_name", last_name);

                    // Redirect to the App after successful registration
                    Response.Redirect("~/App/");
                }
                catch
                {
                    lblError.Text = "Error al crear la cuenta.";
                    lblError.Visible = true;
                }

            }
            else
            {
                lblError.Text = "Las contraseñas no coinciden. Asegúrese de que ambas contraseñas coincidan.";
                lblError.Visible = true;
            }
        }

        private void Set_ddlGender()
        {
            if (ddlGender.Items.Count == 0)
            {
                // SQL query to retrieve gender data
                string query = "SELECT * FROM Gender";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);
                OdbcDataReader reader = command.ExecuteReader();

                // Populate the gender dropdown list from the database
                ddlGender.DataSource = reader;
                ddlGender.DataTextField = "gender";
                ddlGender.DataValueField = "id";
                ddlGender.DataBind();

                con.Close();

                // Add a default "Sexo" item at the beginning of the dropdown list
                ddlGender.Items.Insert(0, new ListItem("Sexo", ""));
            }
        }

        private string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();

                // Convert the hash bytes to a hexadecimal string
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }
    }
}
