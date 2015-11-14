using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Windows.Forms;

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
                EventDayTextBox.Text = (string)Session["EventDate"];
                if(Session["SelectedEvent"] != null)
                {
                    EventsGridView.SelectedIndex = (int)Session["SelectedEvent"];

                }

                //populating attendees from screen data
                if (Session["Attendees"] != null)
                {
                    attendees.Clear();
                    attendees = (List<string>)Session["Attendees"];
                }

                //code for admin only edit calendar
                /*if (Session["UserRole"] != null && (int)Session["UserRole"] == Constants.Admin)
                {
                    ResetButton.Enabled = true;
                    DeleteButton.Enabled = true;
                    SaveButton.Enabled = true;
                }
                else
                {
                    ResetButton.Enabled = false;
                    DeleteButton.Enabled = false;
                    SaveButton.Enabled = false;
                }*/
            
            }
          


                   
        }


        protected void EventDayCalendar_SelectionChanged(object sender, EventArgs e)
        {

            EventDayTextBox.Text = EventDayCalendar.SelectedDate.ToShortDateString();
        }



        protected void AttendeesButton_Click(object sender, EventArgs e)
        {
            //Save the state of the controls on the calendar screen
            Session["Title"] = TitleTextBox.Text;
            Session["Description"] = DescriptionTextBox.Text;
            Session["StartTime"] = StartTime.SelectedItem.ToString();
            Session["EndTime"] = EndTime.SelectedItem.ToString();
            Session["EventDate"] = EventDayTextBox.Text;
            Session["SelectedEvent"] = EventsGridView.SelectedIndex;

            if (Session["Attendees"] != null)//don't populate from database
            {
                attendees = (List<string>)Session["Attendees"];
            }
            else if ( EventsGridView.SelectedValue != null)
            {
                getAttendeesFromDB();
              

            }
            Server.Transfer("~/Attendees.aspx");
        }

        private void getAttendeesFromDB()
        {
              try
                {
                    //populate the attendees listbox on the attendee page with the list from the db.
                    int eventID = System.Convert.ToInt32(EventsGridView.SelectedRow.Cells[1].Text);

                    // step 1: formulate a string containing the details of the
                    // database connection
                    string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                    // step 2: create a SqlConnection object to connect to the
                    // database, passing the connection string to the constructor
                    SqlConnection mySqlConnection = new SqlConnection(connectionString);

                    // step 3: formulate a SELECT statement to retrieve the
                    // Id, Name, EventID rows from the Attendees table
                    string selectString = "SELECT Id, Name, EventID FROM Attendees WHERE EventID = @eventID";
                                                
                    // step 4: create a SqlCommand object to hold the SELECT statement
                    SqlCommand mySqlCommand = mySqlConnection.CreateCommand();

                    // step 5: set the CommandText property of the SqlCommand object to
                    // the SELECT string
                    mySqlCommand.CommandText = selectString;
                    mySqlCommand.Parameters.AddWithValue("@eventID", eventID);
                    
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

                   //populating from the database
                   // using a DataRow object to access each row in the DataTable
                   foreach (DataRow myDataRow in myDataTable.Rows)
                   {
                       attendees.Add((string)myDataRow["Name"]);
                   }
                   Session["Attendees"] = attendees;

                }
                catch (Exception error)
                {
                    Response.Write(error.Message);
                }
        }
        
        
        
        protected void SaveButton_Click(object sender, EventArgs e)
        {

            if (EventsGridView.SelectedIndex != -1)
                ModifySelection();//modifies the selected item in gridview
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

                try
                {
                    //insert an event record into the database along with the attendees for the event
                    Int32 newProdID = 0;
                    SqlCommand cmd = new SqlCommand("insert into Event (Title,Description,StartTime,EndTime,EventDate,Creator,Status) Values(@Title, @Description, @StartTime, @EndTime, @EventDate, @Creator, @Status)" + "SELECT CAST(scope_identity() AS int)", con);

                    cmd.Parameters.AddWithValue("@Title", TitleTextBox.Text);
                    cmd.Parameters.AddWithValue("@Description", DescriptionTextBox.Text);
                    cmd.Parameters.AddWithValue("@StartTime", StartTime.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@EndTime", EndTime.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@EventDate", EventDayTextBox.Text);
                    cmd.Parameters.AddWithValue("@Status", "Active");
                    cmd.Parameters.AddWithValue("@Creator", (int)Session["UserID"]);
                    con.Open();
                    newProdID = (Int32)cmd.ExecuteScalar();//get the new id for the event
                    InsertAttendees(con, newProdID);

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
        }

        private void ModifySelection()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            try
            {
                //update an event record into the database along with the attendees for the event

                int eventID = System.Convert.ToInt32(EventsGridView.SelectedRow.Cells[1].Text);


                SqlCommand cmd = new SqlCommand("UPDATE Event SET Title = '" + TitleTextBox.Text + "',Description = '" + DescriptionTextBox.Text + "', StartTime = '" + StartTime.SelectedItem.ToString() + "', EndTime = '" + EndTime.SelectedItem.ToString() + "', EventDate = '" + EventDayTextBox.Text + "', Status = @Status WHERE Id = @eventID", con);
                cmd.Parameters.AddWithValue("@eventID", eventID);
                cmd.Parameters.AddWithValue("@Status", EventsGridView.SelectedRow.Cells[7].Text);

                con.Open();
                cmd.ExecuteScalar();
                InsertAttendees(con, eventID);
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
        
       private void InsertAttendees(SqlConnection con, int evtID)
        {
            try
            {

                if (Session["Attendees"] != null)//don't populate from database
                {
                    attendees = (List<string>)Session["Attendees"];


                }
           
                
                
                SqlCommand cmd = new SqlCommand("insert into Attendees(Name,EventID) Values(@Name,@EventID)", con);

                cmd.CommandText = "DELETE FROM Attendees WHERE EventId = @evtID";
                cmd.Parameters.AddWithValue("@evtID", evtID);
                
                cmd.ExecuteNonQuery();
                foreach (string name in attendees)
                {
                    SqlCommand cmd2 = new SqlCommand("insert into Attendees(Name,EventID) Values(@Name,@EventID)", con);
                    cmd2.Parameters.AddWithValue("@Name", name);
                    cmd2.Parameters.AddWithValue("@EventID", evtID);
                    cmd2.ExecuteNonQuery();
                }
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
          
        }
        
        
        
        
        
        //update the calendar controls with the selected item in the events grid
        protected void EventsGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            TitleTextBox.Text = EventsGridView.SelectedRow.Cells[2].Text;
            DescriptionTextBox.Text = EventsGridView.SelectedRow.Cells[3].Text;
            StartTime.SelectedIndex = toIndex(EventsGridView.SelectedRow.Cells[4].Text);
            EndTime.SelectedIndex = toIndex(EventsGridView.SelectedRow.Cells[5].Text);
            EventDayTextBox.Text = EventsGridView.SelectedRow.Cells[6].Text;
            getAttendeesFromDB();

        }

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            TitleTextBox.Text = "";
            DescriptionTextBox.Text = "";
            StartTime.SelectedIndex = 0;
            EndTime.SelectedIndex = 0; ;
            EventDayTextBox.Text = "";
            EventsGridView.SelectedIndex = -1;
            attendees.Clear();

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (EventsGridView.SelectedValue != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                try
                {
                    int eventID = System.Convert.ToInt32(EventsGridView.SelectedRow.Cells[1].Text);
                    if(Session["UserRole"] != null)
                    {
                        if ((int)Session["UserRole"] == Constants.Admin)
                        {
                            SqlCommand cmd = new SqlCommand("DELETE FROM Event WHERE Id = @evtID",con);
                            con.Open();
                            cmd.Parameters.AddWithValue("@evtID", eventID);
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = "DELETE FROM Attendees WHERE EventId = @eventID";
                            cmd.Parameters.AddWithValue("@eventID", eventID);
                            cmd.ExecuteNonQuery();
                        }
                        else
                            MessageBox.Show("You must be Admin to delete an event", "Important Message");
                     }
                }
                catch (Exception error)
                {
                    Response.Write(error.Message);
                }
                finally
                {
                    con.Close();
                }
                EventsGridView.DataBind();
                ResetButton_Click(sender, e);
            }
        }
        //Event times are stored as strings in the database. Convert the strings to combo box index.
        private int toIndex(string time)
        {
            int index = 0;
            switch(time)
            {
                case "6:00 AM":
                    index = 0;
                    break;
                case "6:30 AM":
                    index = 1;
                    break;
                case "7:00 AM":
                    index = 2;
                    break;
                case "7:30 AM":
                    index = 3;
                    break;
                case "8:00 AM":
                    index = 4;
                    break;
                case "8:30 AM":
                    index = 5;
                    break;
                case "9:00 AM":
                    index = 6;
                    break;
                case "9:30 AM":
                    index = 7;
                    break;
                case "10:00 AM":
                    index = 8;
                    break;
                case "10:30 AM":
                    index = 9;
                    break;
                case "11:00 AM":
                    index = 10;
                    break;
                case "11:30 AM":
                    index = 11;
                    break;
                case "12:00 PM":
                    index = 12;
                    break;
                case "12:30 PM":
                    index = 13;
                    break;
                case "1:00 PM":
                    index = 14;
                    break;
                case "1:30 PM":
                    index = 15;
                    break;
                case "2:00 PM":
                    index = 16;
                    break;
                case "2:30 PM":
                    index = 17;
                    break;
                case "3:00 PM":
                    index = 18;
                    break;
                case "3:30 PM":
                    index = 19;
                    break;
                case "4:00 PM":
                    index = 20;
                    break;
                case "4:30 PM":
                    index = 21;
                    break;
                case "5:00 PM":
                    index = 22;
                    break;
                case "5:30 PM":
                    index = 23;
                    break;
                case "6:00 PM":
                    index = 24;
                    break;
                case "6:30 PM":
                    index = 25;
                    break;
                case "7:00 PM":
                    index = 26;
                    break;
                case "7:30 PM":
                    index = 27;
                    break;
                case "8:00 PM":
                    index = 28;
                    break;
                case "8:30 PM":
                    index = 29;
                    break;
                case "9:00 PM":
                    index = 30;
                    break;
                case "9:30 PM":
                    index = 31;
                    break;
                case "10:00 PM":
                    index = 32;
                    break;
                case "10:30 PM":
                    index = 33;
                    break;
                case "11:00 PM":
                    index = 34;
                    break;
                default:
                    index = 0;
                    break;
            }
            return index;
        }
        //Called when a user hits the cancel button on the calendar screen to cancel an event
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            
            
            if (EventsGridView.SelectedValue != null)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

                try
                {
                    int eventID = System.Convert.ToInt32(EventsGridView.SelectedRow.Cells[1].Text);

                    SqlCommand cmd = new SqlCommand("SELECT Creator FROM Event WHERE Id = @eventID",con);
                    cmd.Parameters.AddWithValue("@eventID",eventID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        int userID = (int)reader["Creator"];
                        
                        if(Session["UserID"] != null)
                        {
                            if ((int)Session["UserID"] == userID )
                            {
                                 cmd.CommandText = "UPDATE Event SET Status = @Status WHERE Id = @evtID";
                                 cmd.Parameters.AddWithValue("@evtID", eventID);
                                 cmd.Parameters.AddWithValue("@Status", "Cancelled");
                                 reader.Close();
                                 cmd.ExecuteScalar();
                                 EventsGridView.DataBind();
                            }
                            else
                                MessageBox.Show("You must be the creator of the event to cancel it", "Important Message");
                        }
                        else
                           MessageBox.Show("You must be the creator of the event to cancel it", "Important Message");

                    }

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
            else
                MessageBox.Show("You must select an event to cancel an event.", "Important Message");
        }

      
    }
   
}