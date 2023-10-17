using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.Odbc;

namespace ProyectoDAI.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String query = "SELECT id, first_name, last_name FROM [User] WHERE email = ? AND password = ?";

            string email = txtEmail.Text;
            string password = ComputeSha256Hash(txtPassword.Text);

            OdbcConnection con = new ConnectionDB().con;
            OdbcCommand command = new OdbcCommand(query, con);

            command.Parameters.AddWithValue("email", email);
            command.Parameters.AddWithValue("password", password);

            OdbcDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();

                Session.Timeout = 10;

                Session.Add("user_id", reader.GetInt32(0));
                Session.Add("user_first_name", reader.GetString(1));
                Session.Add("user_last_name", reader.GetString(2));
                
                Response.Redirect("~/App/");
            }
            else
            {
                lblError.Text = "Email o Contraseña incorrectas.";
                lblError.Visible = true;

                Session.Clear();
                Session.Abandon();
            }
        }

        private string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();

                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }
    }
}