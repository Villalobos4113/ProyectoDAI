using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.App
{
	public partial class Settings : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                set_info();
            }
		}

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string password = ComputeSha256Hash(txtCurrentPassword.Text);
            string newPassword = ComputeSha256Hash(txtNewPassword.Text);
            string confirmPassword = ComputeSha256Hash(txtConfirmNewPassword.Text);

            if (password != "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" && newPassword != "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" && confirmPassword != "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
            {
                if (newPassword == confirmPassword)
                {
                    string queryCheck = "SELECT id FROM [User] WHERE id = ? AND password = ?";
                    string queryUpdate = "UPDATE [User] SET password = ? WHERE id = ?";

                    OdbcConnection con = new ConnectionDB().con;
                    OdbcCommand command = new OdbcCommand(queryCheck, con);
                    command.Parameters.AddWithValue("id", Session["user_id"]);
                    command.Parameters.AddWithValue("password", password);
                    OdbcDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Close();

                        command = new OdbcCommand(queryUpdate, con);
                        command.Parameters.AddWithValue("password", newPassword);
                        command.Parameters.AddWithValue("id", Session["user_id"]);
                        command.ExecuteNonQuery();

                        lblMessage2.Text = "Contraseña cambiada exitosamente.";
                    }
                    else
                    {
                        lblMessage2.Text = "La contraseña actual es incorrecta.";
                    }
                }
                else
                {
                    lblMessage2.Text = "Las nuevas contraseñas no coinciden.";
                }
            }
            else
            {
                lblMessage2.Text = "Por favor, rellene todos los campos.";
            }
        }

        protected void btnUpdateInfo_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;

            if (firstName != "" && lastName != "" && email != "")
            {
                string query = "UPDATE [User] SET first_name = ?, last_name = ?, email = ? WHERE id = ?";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                command.Parameters.AddWithValue("first_name", firstName);
                command.Parameters.AddWithValue("last_name", lastName);
                command.Parameters.AddWithValue("email", email);
                command.Parameters.AddWithValue("id", Session["user_id"]);

                command.ExecuteNonQuery();

                lblMessage1.Text = "Información actualizada exitosamente.";
            }
            else
            {
                lblMessage1.Text = "Por favor, rellene todos los campos.";
            }
        }

        protected void set_info()
        {
            string query = "SELECT first_name, last_name, email FROM [User] WHERE id = ?";

            OdbcConnection con = new ConnectionDB().con;
            OdbcCommand command = new OdbcCommand(query, con);

            command.Parameters.AddWithValue("id", Session["user_id"]);

            OdbcDataReader reader = command.ExecuteReader();

            reader.Read();

            txtFirstName.Text = reader.GetString(0);
            txtLastName.Text = reader.GetString(1);
            txtEmail.Text = reader.GetString(2);

            reader.Close();

            con.Close();
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