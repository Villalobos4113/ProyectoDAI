using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace ProyectoDAI.Admin.Report
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlTables_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedTable = ddlTables.SelectedValue;

            if (selectedTable != "Select a table")
            {
                string query;

                if (selectedTable == "Gender")
                {
                    query = "SELECT id as 'ID', gender as 'Género' FROM Gender";
                }
                else if (selectedTable == "PartsOfDay")
                {
                    query = "SELECT id as 'ID', part_of_day as 'Parte del día' FROM PartsOfDay";
                }
                else if (selectedTable == "Exercises")
                {
                    query = "SELECT id as 'ID', exercise as 'Ejercicio' FROM Exercises";
                }
                else if (selectedTable == "Intensity")
                {
                    query = "SELECT id as 'ID', intensity as 'Intensidad' FROM Intensity";
                }
                else if (selectedTable == "Medicine")
                {
                    query = "SELECT id as 'ID', name as 'Medicina' FROM Medicine";
                }
                else if (selectedTable == "User")
                {
                    query = "SELECT [User].id as 'ID', [User].first_name as 'Nombre', [User].last_name as 'Apellido', [User].email as 'Email', [User].date_birth as 'Fecha de Nacimiento', Gender.gender as 'Género' FROM [User] INNER JOIN Gender ON [User].gender_id = Gender.id";
                }
                else if(selectedTable == "Doctor")
                {
                    query = "SELECT id as 'ID', first_name as 'Nombre', last_name as 'Apellido', address as 'Dirección', email as 'Email', phone as 'Teléfono' from Doctor";
                }
                else if (selectedTable == "Report")
                {
                    query = "SELECT Report.id as 'ID', Report.created_at as 'Fecha', Report.glucose as 'Glucosa', Report.ketones as 'Cetonas', Report.notes as 'Notas', [User].email as 'Usuario', PartsOfDay.part_of_day as 'Parte del día' FROM Report INNER JOIN [User] ON Report.user_id = [User].id INNER JOIN PartsOfDay ON Report.part_of_day_id = PartsOfDay.id";
                }
                else if (selectedTable == "ReportMedicines")
                {
                    query = "SELECT ReportMedicines.id as 'ID', Medicine.name as 'Medicina', ReportMedicines.quantity as 'Cantidad', ReportMedicines.report_id as 'ID Reporte' FROM ReportMedicines INNER JOIN Medicine ON ReportMedicines.medicine_id = Medicine.id";
                }
                else if (selectedTable == "Tracking")
                {
                    query = "SELECT Tracking.id as 'ID', Tracking.created_at as 'Fecha', Exercises.exercise as 'Ejercicio', Intensity.intensity as 'Intensidad', Tracking.calories as 'Calorías', Tracking.notes as 'Notas', [User].email as 'Usuario', CAST(Tracking.start_hour AS VARCHAR(8)) as 'Hora de Inicio', CAST(Tracking.end_hour AS VARCHAR(8)) as 'Hora de Fin' FROM Tracking INNER JOIN [User] ON Tracking.user_id = [User].id INNER JOIN Exercises ON Tracking.exercise_id = Exercises.id INNER JOIN Intensity ON Tracking.intensity_id = Intensity.id";
                }
                else if (selectedTable == "UserMedicine")
                {
                    query = "SELECT Medicine.name as 'Medicina', UserMedicine.quantity as 'Cantidad', [User].email as 'Usuario' FROM UserMedicine INNER JOIN Medicine ON UserMedicine.medicine_id = Medicine.id INNER JOIN [User] ON UserMedicine.user_id = [User].id";
                }
                else if (selectedTable == "ForumMessage")
                {
                    query = "SELECT ForumMessage.id as 'ID', ForumMessage.message as 'Mensaje', ForumMessage.created_at as 'Fecha', [User].email as 'Usuario' FROM ForumMessage INNER JOIN [User] ON ForumMessage.user_id = [User].id";
                }
                else
                {
                    query = "SELECT * FROM " + selectedTable;
                }


                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                OdbcDataReader reader = command.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);

                gvData.DataSource = dt;
                gvData.DataBind();

                con.Close();
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {

        }
    }
}