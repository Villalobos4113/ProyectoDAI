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
            Set_ddlGender();
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
                String queryInsert = "INSERT INTO [User] VALUES (?,?,?,?,?,?,?)";
                String queryId = "SELECT MAX(id) FROM [User]";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(queryId, con);
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

                command = new OdbcCommand(queryInsert, con);

                command.Parameters.AddWithValue("id", id);
                command.Parameters.AddWithValue("first_name", first_name);
                command.Parameters.AddWithValue("last_name", last_name);
                command.Parameters.AddWithValue("email", email);
                command.Parameters.AddWithValue("password", password);
                command.Parameters.AddWithValue("date_birth", date_birth);
                command.Parameters.AddWithValue("gender_id", gender_id);

                try
                {
                    command.ExecuteNonQuery();

                    Session.Timeout = 10;

                    Session.Add("user_id", id);
                    Session.Add("user_first_name", first_name);
                    Session.Add("user_last_name", last_name);

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
                string query = "SELECT * FROM Gender";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);
                OdbcDataReader reader = command.ExecuteReader();

                ddlGender.DataSource = reader;
                ddlGender.DataTextField = "gender";
                ddlGender.DataValueField = "id";
                ddlGender.DataBind();

                con.Close();

                ddlGender.Items.Insert(0, new ListItem("Sexo", ""));
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