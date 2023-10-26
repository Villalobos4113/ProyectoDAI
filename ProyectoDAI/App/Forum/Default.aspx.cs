using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.App.Forum
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMessages();
            }
        }

        protected void PostButton_Click(object sender, EventArgs e)
        {
            bool verif = false;

            string query = "INSERT INTO ForumMessage (id, message, created_at, user_id) VALUES (?, ?, ?, ?)";
            string queryId = "SELECT MAX(id) FROM ForumMessage";

            string message = txbMessage.Text;
            string createdAt = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
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
            command.Parameters.AddWithValue("message", message);
            command.Parameters.AddWithValue("created_at", createdAt);
            command.Parameters.AddWithValue("user_id", Session["user_id"]);

            try
            {
                command.ExecuteNonQuery();
                verif = true;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }

            if (verif)
            {
                Response.Redirect("/App/Forum");
            }
        }

        private void BindMessages()
        {
            // Fetch the last 20 messages from the database
            string query = "SELECT ForumMessage.message, ForumMessage.created_at, [User].first_name, [User].last_name FROM ForumMessage INNER JOIN [User] ON ForumMessage.user_id = [User].id ORDER BY ForumMessage.created_at DESC";

            OdbcConnection con = new ConnectionDB().con;
            OdbcCommand command = new OdbcCommand(query, con);

            OdbcDataReader reader = command.ExecuteReader();

            // Bind the messages to the repeater
            MessageRepeater.DataSource = reader;
            MessageRepeater.DataBind();

            reader.Close();
        }
    }
}