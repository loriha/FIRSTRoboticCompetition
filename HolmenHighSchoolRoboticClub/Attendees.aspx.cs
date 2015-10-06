using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace HolmenHighSchoolRoboticClub
{
    public partial class Attendees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            //populating from the database
            DataTable myDataTable = (DataTable) Session["AttendeeDataTable"];
            if (myDataTable != null)
            {
                // using a DataRow object to access each row in the DataTable
                foreach (DataRow myDataRow in myDataTable.Rows)
                {
                    AttendeesListBox.Items.Add((string)myDataRow["Name"]);

                }
            }
            //populating from screen data
            if(Session["Attendees"] != null)
            {
                List<string> attendees = new List<string>();
                attendees = (List<string>)Session["Attendees"];
                foreach (string li in attendees)
                {
                    AttendeesListBox.Items.Add(li);
                }
            }
       }

        protected void ApplyButton_Click1(object sender, EventArgs e)
        {

            List<string> attendees = new List<string>();
            foreach (ListItem li in AttendeesListBox.Items)
            {
                attendees.Add(AttendeesListBox.SelectedItem.ToString());
            }

            if (attendees.Count > 0)
            {
                Session["Attendees"] = attendees;
            }
            Server.Transfer("~/Calendar.aspx");
        }

        protected void CancelButton_Click1(object sender, EventArgs e)
        {
            Server.Transfer("~/Calendar.aspx");
        }

        protected void AddAttendeeButton_Click(object sender, EventArgs e)
        {
            
            foreach (ListItem li in UsersListBox.Items)
            {
                if (li.Selected)
                {
                    AttendeesListBox.SelectedIndex = -1;
                    AttendeesListBox.Items.Add(UsersListBox.SelectedItem);
                }
            }
        }

        protected void RemoveButton_Click1(object sender, EventArgs e)
        {
             int index = AttendeesListBox.SelectedIndex;
             AttendeesListBox.Items.RemoveAt(index);
        }
    }
}