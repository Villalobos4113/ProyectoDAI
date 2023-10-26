using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.App.Tracking
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String queryExercises = "SELECT * FROM Exercises";
                String queryIntensities = "SELECT * FROM Intensity";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(queryExercises, con);

                OdbcDataReader reader = command.ExecuteReader();

                ddlExerciseType.DataSource = reader;
                ddlExerciseType.DataTextField = "exercise";
                ddlExerciseType.DataValueField = "id";
                ddlExerciseType.DataBind();

                ddlExerciseType.Items.Insert(0, new ListItem("Select an exercise", "0"));
                
                command = new OdbcCommand(queryIntensities, con);

                reader = command.ExecuteReader();

                ddlIntensity.DataSource = reader;
                ddlIntensity.DataTextField = "intensity";
                ddlIntensity.DataValueField = "id";
                ddlIntensity.DataBind();

                ddlIntensity.Items.Insert(0, new ListItem("Select an intensity", "0"));

                con.Close();
            }
        }

        protected void SaveData_Click(object sender, EventArgs e)
        {
            String queryInsert = "INSERT INTO Tracking VALUES (?,?,?,?,?,?,?,?,?)";
            String queryId = "SELECT MAX(id) FROM Tracking";

            String start_hour = txbStartTime.Text;
            String end_hour = txbEndTime.Text;
            String exercise_id = ddlExerciseType.SelectedValue;
            String intensity_id = ddlIntensity.SelectedValue;
            String calories = txbCalories.Text;
            String notes = txtExerciseNotes.Text;
            String created_at = DateTime.Now.ToString("yyyy-MM-dd");
            int id;

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
            command.Parameters.AddWithValue("created_at", created_at);
            command.Parameters.AddWithValue("exercise_id", exercise_id);
            command.Parameters.AddWithValue("intensity_id", intensity_id);
            command.Parameters.AddWithValue("calories", calories);
            command.Parameters.AddWithValue("notes", notes);
            command.Parameters.AddWithValue("user_id", Session["user_id"]);
            command.Parameters.AddWithValue("start_hour", start_hour);
            command.Parameters.AddWithValue("end_hour", end_hour);

            try
            {
                command.ExecuteNonQuery();

                Response.Redirect("~/App/Tracking/History");
            }
            catch
            {
                lblError.Text = "An error has ocurred. Please try again.";
            }
        }
    }
}