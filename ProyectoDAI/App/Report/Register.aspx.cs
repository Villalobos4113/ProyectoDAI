﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.App.Report
{
    public partial class Register : System.Web.UI.Page
    {
        public class MedicationData
        {
            public string Medication { get; set; }
            public string Quantity { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Set_ddlTime();
            Set_ddlMedication();
        }

        protected void SaveData_Click(object sender, EventArgs e)
        {
            bool verif = false;

            string queryInsertReport = "INSERT INTO Report VALUES (?,?,?,?,?,?,?)";
            string queryInsertReportMeds = "INSERT INTO ReportMedicines VALUES (?,?,?,?)";

            string queryReportId = "SELECT MAX(id) FROM Report";
            string queryReportMedsId = "SELECT MAX(id) FROM ReportMedicines";

            int id;
            string created_at = DateTime.Now.ToString("MM/dd/yyyy");
            string glucose = glucoseLevel.Text;
            string ketones = ketonesLevel.Text;
            string notes = TextBox1.Text;
            string part_of_day_id = ddlTime.SelectedValue;

            string reportMedicinesJson = HiddenField1.Value;string selectedTime = ddlTime.SelectedValue;
            var reportMedicinesData = JsonConvert.DeserializeObject<List<MedicationData>>(reportMedicinesJson);

            OdbcConnection con = new ConnectionDB().con;
            OdbcCommand command = new OdbcCommand(queryReportId, con);
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

            command = new OdbcCommand(queryInsertReport, con);

            // Add report data parameters to the insert command
            command.Parameters.AddWithValue("id", id);
            command.Parameters.AddWithValue("created_at", created_at);
            command.Parameters.AddWithValue("glucose", glucose);
            command.Parameters.AddWithValue("ketones", ketones);
            command.Parameters.AddWithValue("notes", notes);
            command.Parameters.AddWithValue("user_id", Session["user_id"]);
            command.Parameters.AddWithValue("part_of_day_id", part_of_day_id);

            try
            {
                // Execute the user insertion
                command.ExecuteNonQuery();

                verif = true;
            }
            catch
            {
                lblError.Text = "Error al crear el informe.";
                lblError.Visible = true;
            }

            if (verif)
            {
                Response.Redirect("/App/Report/Register");
            }
        }

        protected void Set_ddlTime()
        {
            if (ddlTime.Items.Count == 0)
            {
                // SQL query to retrieve part_of_day data
                string query = "SELECT * FROM PartsOfDay";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);
                OdbcDataReader reader = command.ExecuteReader();

                // Populate the time dropdown list from the database
                ddlTime.DataSource = reader;
                ddlTime.DataTextField = "part_of_day";
                ddlTime.DataValueField = "id";
                ddlTime.DataBind();

                con.Close();

                // Add a default "Selecciona una hora" item at the beginning of the dropdown list
                ddlTime.Items.Insert(0, new ListItem("Selecciona una hora", ""));
            }
        }

        protected void Set_ddlMedication()
        {
            if (ddlMedication.Items.Count == 0)
            {
                // SQL query to retrieve medicine data
                string query = "SELECT UserMedicine.medicine_id, UserMedicine.quantity, Medicine.name FROM UserMedicine INNER JOIN Medicine ON UserMedicine.medicine_id = Medicine.id WHERE UserMedicine.user_id = ?";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                command.Parameters.AddWithValue("id", Session["user_id"]);

                OdbcDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    // Populate the medicine dropdown list from the database
                    ddlMedication.DataSource = reader;
                    ddlMedication.DataTextField = "name";
                    ddlMedication.DataValueField = "medicine_id";
                    ddlMedication.DataBind();
                }

                con.Close();

                // Add a default "Selecciona una medicina" item at the beginning of the dropdown list
                ddlMedication.Items.Insert(0, new ListItem("Selecciona una medicina", ""));
            }
        }
    }
}