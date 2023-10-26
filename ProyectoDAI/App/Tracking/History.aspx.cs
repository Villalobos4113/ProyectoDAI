using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.App.Tracking
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String query = "SELECT Tracking.created_at, Tracking.calories, Tracking.notes, CAST(Tracking.start_hour AS VARCHAR(8)) AS start_hour, CAST(Tracking.end_hour AS VARCHAR(8)) AS end_hour, Exercises.exercise, Intensity.intensity FROM Tracking INNER JOIN Exercises ON Tracking.exercise_id = Exercises.id INNER JOIN Intensity ON Tracking.intensity_id = Intensity.id WHERE Tracking.user_id = ?";
                
                OdbcConnection con = new ConnectionDB().con;
                OdbcCommand command = new OdbcCommand(query, con);

                command.Parameters.AddWithValue("?", Session["user_id"]);

                OdbcDataReader reader = command.ExecuteReader();

                Dictionary<string, List<Dictionary<string, string>>> trackings = new Dictionary<string, List<Dictionary<string, string>>>();

                while (reader.Read())
                {
                    string date = Convert.ToDateTime(reader["created_at"]).ToString("yyyy-MM-dd");

                    if (!trackings.ContainsKey(date))
                    {
                        trackings[date] = new List<Dictionary<string, string>>();
                    }

                    trackings[date].Add(new Dictionary<string, string>
                    {
                        { "start_hour", reader["start_hour"].ToString() },
                        { "end_hour", reader["end_hour"].ToString() },
                        { "calories", reader["calories"].ToString() },
                        { "notes", reader["notes"].ToString() },
                        { "exercise", reader["exercise"].ToString() },
                        { "intensity", reader["intensity"].ToString() }
                    });
                }

                con.Close();

                foreach (var date in trackings.Keys)
                {
                    int rowCountForDate = trackings[date].Count;
                    bool isFirstRowForDate = true;

                    foreach (var tracking in trackings[date])
                    {
                        TableRow row = new TableRow();

                        if (isFirstRowForDate)
                        {
                            TableCell dateCell = new TableCell();
                            dateCell.Text = date;
                            dateCell.RowSpan = rowCountForDate;
                            row.Cells.Add(dateCell);
                            isFirstRowForDate = false;
                        }

                        TableCell startHourCell = new TableCell();
                        startHourCell.Text = tracking["start_hour"];
                        row.Cells.Add(startHourCell);

                        TableCell endHourCell = new TableCell();
                        endHourCell.Text = tracking["end_hour"];
                        row.Cells.Add(endHourCell);

                        TableCell exerciseCell = new TableCell();
                        exerciseCell.Text = tracking["exercise"];
                        row.Cells.Add(exerciseCell);

                        TableCell intensityCell = new TableCell();
                        intensityCell.Text = tracking["intensity"];
                        row.Cells.Add(intensityCell);

                        TableCell caloriesCell = new TableCell();
                        caloriesCell.Text = tracking["calories"];
                        row.Cells.Add(caloriesCell);

                        TableCell notesCell = new TableCell();
                        notesCell.Text = tracking["notes"];
                        row.Cells.Add(notesCell);

                        tblHistory.Rows.Add(row);
                    }
                }
            }
        }
    }
}