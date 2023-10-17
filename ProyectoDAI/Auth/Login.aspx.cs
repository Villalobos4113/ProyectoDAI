using System;
using System.Security.Cryptography;
using System.Text;
using System.Data.Odbc;

namespace ProyectoDAI.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already logged in; if yes, redirect to the App
            if (Session["user_id"] != null && Session["user_first_name"] != null && Session["user_last_name"] != null)
            {
                Response.Redirect("~/App/");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // SQL query to check user credentials
            String query = "SELECT id, first_name, last_name FROM [User] WHERE email = ? AND password = ?";

            // Retrieve user input from the form
            string email = txtEmail.Text;
            string password = ComputeSha256Hash(txtPassword.Text);

            // Establish a database connection using ODBC
            OdbcConnection con = new ConnectionDB().con;
            OdbcCommand command = new OdbcCommand(query, con);

            // Add parameters to the SQL query
            command.Parameters.AddWithValue("email", email);
            command.Parameters.AddWithValue("password", password);

            // Execute the query
            OdbcDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();

                // Set a session timeout and store user information in session variables
                Session.Timeout = 10;
                Session.Add("user_id", reader.GetInt32(0));
                Session.Add("user_first_name", reader.GetString(1));
                Session.Add("user_last_name", reader.GetString(2));

                // Redirect to the App after successful login
                Response.Redirect("~/App/");
            }
            else
            {
                // Display an error message for incorrect email or password
                lblError.Text = "Email o Contraseña incorrectas.";
                lblError.Visible = true;

                // Clear and abandon the session in case of login failure
                Session.Clear();
                Session.Abandon();
            }
        }

        // Helper method to compute SHA-256 hash
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
