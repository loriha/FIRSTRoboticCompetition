using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace HolmenHighSchoolRoboticClub
{
    public partial class Calendar : System.Web.UI.Page
    {
        List<string> attendees = new List<string>();

        private void Page_Load(object sender, System.EventArgs e)
        {


            if (!IsPostBack)
            {
                //populate the controls from session state
                TitleTextBox.Text = (string)Session["Title"];
                DescriptionTextBox.Text = (string)Session["Description"];
                if (Session["StartTime"] != null)
                {
                    StartTime.Items.FindByText((string)Session["StartTime"]).Selected = true;
                }
                if (Session["EndTime"] != null)
                {
                    EndTime.Items.FindByText((string)Session["EndTime"]).Selected = true;
                }
                StartDayTextBox.Text = (string)Session["StartDate"];
                EndDayTextBox.Text = (string)Session["EndDate"];
            }
            
            
            //save the attendees the user selected on the attendee screen in a list
            if (PreviousPage != null)
            {
                ListBox SourceListBox =
                    (ListBox)PreviousPage.Master.FindControl("MainContent").FindControl("AttendeesListBox");
                if (SourceListBox != null)
                {
                    for (int i = 0; i < SourceListBox.Items.Count; i++)
                    {
                        attendees.Add(SourceListBox.Items[i].ToString());

                    }
                }
                Session["Attendees"] = attendees;
            }
        }
  
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            StartDayTextBox.Text = StartDayCalendar.SelectedDate.ToShortDateString();
        }

        protected void EndDayCalendar_SelectionChanged(object sender, EventArgs e)
        {
            EndDayTextBox.Text = EndDayCalendar.SelectedDate.ToShortDateString();
        }

        protected void AttendeesButton_Click(object sender, EventArgs e)
        {
            //Save the state of the controls on the calendar screen
            Session["Title"] = TitleTextBox.Text;
            Session["Description"] = DescriptionTextBox.Text;
            Session["StartTime"] = StartTime.SelectedItem.ToString();
            Session["EndTime"] = EndTime.SelectedItem.ToString();
            Session["StartDate"] = StartDayTextBox.Text;
            Session["EndDate"] = EndDayTextBox.Text;


            if (EventsGridView.SelectedValue != null)
            {

                //populate the attendees listbox on the attendee page with the list from the db.
                int eventID = System.Convert.ToInt32(EventsGridView.SelectedRow.Cells[1].Text);
                // step 1: formulate a string containing the details of the
                // database connection
                string connectionString = "data source=.; database=HolmenRoboticsClub; integrated security=SSPI";

                // step 2: create a SqlConnection object to connect to the
                // database, passing the connection string to the constructor
                SqlConnection mySqlConnection = new SqlConnection(connectionString);

                // step 3: formulate a SELECT statement to retrieve the
                // Id, Name, EventID rows from the Attendees table
                string selectString = "SELECT Id, Name, EventID FROM Attendees WHERE EventID == eventID ";

                // step 4: create a SqlCommand object to hold the SELECT statement
                SqlCommand mySqlCommand = mySqlConnection.CreateCommand();

                // step 5: set the CommandText property of the SqlCommand object to
                // the SELECT string
                mySqlCommand.CommandText = selectString;

                // step 6: create a SqlDataAdapter object
                SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter();

                // step 7: set the SelectCommand property of the SqlAdapter object
                // to the SqlCommand object
                mySqlDataAdapter.SelectCommand = mySqlCommand;

                // step 8: create a DataSet object to store the results of
                // the SELECT statement
                DataSet myDataSet = new DataSet();

                // step 9: open the database connection using the
                // Open() method of the SqlConnection object
                mySqlConnection.Open();

                // step 10: use the Fill() method of the SqlDataAdapter object to
                // retrieve the rows from the table, storing the rows locally
                // in a DataTable of the DataSet object
                string dataTableName = "Attendees";
                mySqlDataAdapter.Fill(myDataSet, dataTableName);

                // step 11: get the DataTable object from the DataSet object
                DataTable myDataTable = myDataSet.Tables[dataTableName];

                // step 12: close the database connection using the Close() method
                // of the SqlConnection object created in Step 2
                mySqlConnection.Close();

                //step 13: save the DataTable to session
                Session["AttendeeDataTable"] = myDataTable;

            }
            Server.Transfer("~/Attendees.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("data source=.; database=HolmenRoboticsClub; integrated security=SSPI");
            try
            {
                //insert an event record into the database along with the attendees for the event
                Int32 newProdID = 0; 
                SqlCommand cmd = new SqlCommand("insert into Event (Title,Description,StartTime,EndTime,StartDate,EndDate) Values(@Title, @Description, @StartTime, @EndTime, @StartDate,@EndDate)" + "SELECT CAST(scope_identity() AS int)", con);

                cmd.Parameters.AddWithValue("@Title", TitleTextBox.Text);
                cmd.Parameters.AddWithValue("@Description", DescriptionTextBox.Text);
                cmd.Parameters.AddWithValue("@StartTime", StartTime.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@EndTime", EndTime.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@StartDate", StartDayTextBox.Text);
                cmd.Parameters.AddWithValue("@EndDate", EndDayTextBox.Text);
                con.Open();
                newProdID = (Int32)cmd.ExecuteScalar();//get the new id for the event
                attendees = (List<string>)Session["Attendees"];//get the attendees from session state variable
                foreach(string name in attendees)
                {
                    SqlCommand cmd2 = new SqlCommand("insert into Attendees(Name,EventID) Values(@Name,@EventID)",con);
                    cmd2.Parameters.AddWithValue("@Name", name);
                    cmd2.Parameters.AddWithValue("@EventID", newProdID);
                    cmd2.ExecuteNonQuery();
                }

                EventsGridView.DataBind();
              
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void EventsGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }

    }
}