using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.App.Report
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String query = "SELECT Report.created_at, Report.glucose, Report.ketones, MAX(CAST(Report.notes AS VARCHAR(MAX))) as notes, PartsOfDay.part_of_day, STRING_AGG(Medicine.name + ' (' + CAST(ReportMedicines.quantity AS VARCHAR(10)) + ')', ', ') AS medicines FROM Report INNER JOIN PartsOfDay ON Report.part_of_day_id = PartsOfDay.id LEFT JOIN ReportMedicines ON Report.id = ReportMedicines.report_id LEFT JOIN Medicine ON ReportMedicines.medicine_id = Medicine.id WHERE Report.user_id = ? GROUP BY Report.created_at, Report.glucose, Report.ketones, PartsOfDay.part_of_day";

                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                command.Parameters.AddWithValue("id", Session["user_id"]);

                OdbcDataReader reader = command.ExecuteReader();

                // Create a dictionary to hold the report data
                Dictionary<string, Dictionary<string, Dictionary<string, string>>> reports = new Dictionary<string, Dictionary<string, Dictionary<string, string>>>();

                while (reader.Read())
                {
                    // Get the date and part of day from the current row
                    string date = Convert.ToDateTime(reader["created_at"]).ToString("yyyy-MM-dd");
                    string partOfDay = reader["part_of_day"].ToString();

                    // If this date is not already in the reports dictionary, add it
                    if (!reports.ContainsKey(date))
                    {
                        reports[date] = new Dictionary<string, Dictionary<string, string>>();
                    }

                    // Add the report data for this part of day to the reports dictionary
                    reports[date][partOfDay] = new Dictionary<string, string>
                    {
                        { "glucose", reader["glucose"].ToString() },
                        { "ketones", reader["ketones"].ToString() },
                        { "notes", reader["notes"].ToString() },
                        { "medicines", reader["medicines"].ToString() }
                    };
                }

                con.Close();

                // Loop through each date in the reports dictionary
                foreach (var date in reports.Keys)
                {
                    // Get the number of rows for this date
                    int rowCountForDate = reports[date].Keys.Count;
                    // This flag will be used to add the date cell only for the first row of each date
                    bool isFirstRowForDate = true;

                    // Loop through each part of day for this date
                    foreach (var partOfDay in reports[date].Keys)
                    {
                        TableRow row = new TableRow();

                        // If this is the first row for this date, add the date cell
                        if (isFirstRowForDate)
                        {
                            TableCell dateCell = new TableCell();
                            dateCell.Text = date;
                            // Set the RowSpan property of the date cell to the number of rows for this date
                            dateCell.RowSpan = rowCountForDate;
                            row.Cells.Add(dateCell);
                            isFirstRowForDate = false;
                        }

                        // Add the rest of the cells to the row
                        TableCell cell2 = new TableCell();
                        cell2.Text = partOfDay;
                        row.Cells.Add(cell2);
                        TableCell cell3 = new TableCell();
                        cell3.Text = reports[date][partOfDay]["glucose"];
                        row.Cells.Add(cell3);
                        TableCell cell4 = new TableCell();
                        cell4.Text = reports[date][partOfDay]["ketones"];
                        row.Cells.Add(cell4);
                        TableCell cell5 = new TableCell();
                        cell5.Text = reports[date][partOfDay]["notes"];
                        row.Cells.Add(cell5);
                        TableCell cell6 = new TableCell();
                        cell6.Text = reports[date][partOfDay]["medicines"];
                        row.Cells.Add(cell6);

                        // Add the row to the table
                        tblHistory.Rows.Add(row);
                    }
                }
            }
        }
    }
}