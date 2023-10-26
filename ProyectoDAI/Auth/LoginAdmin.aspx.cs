using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.Auth
{
	public partial class LoginAdmin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            // ==============================================
            // ==================WARNING=====================
            // ==============================================

            // Delete before deploying
            // Session.Add("admin_id", 1);
            // Session.Add("admin_username", "Villalobos4113");

            // ==============================================
            // ==================WARNING=====================
            // ==============================================

            // Check if the user is already logged in; if yes, redirect to the App
            if (Session["admin_id"] != null && Session["admin_username"] != null)
            {
                Response.Redirect("~/Admin/");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = "SELECT id, username FROM [Admin] WHERE username = ? AND password = ?";

            string username = txtUsername.Text;
            string password = ComputeSha256Hash(txtPassword.Text);

            OdbcConnection con = new ConnectionDB().con;
            OdbcCommand command = new OdbcCommand(query, con);

            command.Parameters.AddWithValue("username", username);
            command.Parameters.AddWithValue("password", password);

            OdbcDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();

                Session.Timeout = 5;
                Session.Add("admin_id", reader.GetInt32(0));
                Session.Add("admin_username", reader.GetString(1));

                Response.Redirect("~/Admin/");
            }
            else
            {
                lblError.Text = "Usuario o contraseña incorrectos";
            }

            reader.Close();

            con.Close();
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