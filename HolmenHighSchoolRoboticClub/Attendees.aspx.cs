using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace HolmenHighSchoolRoboticClub
{
    public partial class Attendees : System.Web.UI.Page
    {
        List<string> attendees = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack == false)
            {
                //populating from screen data
                if (Session["Attendees"] != null)
                {
                    AttendeesListBox.Items.Clear();
                    attendees = (List<string>)Session["Attendees"];
                    foreach (string li in attendees)
                    {
                        AttendeesListBox.Items.Add(li);
                    }
                }
               

                //code for admin only edit calendar
               /* if (Session["UserRole"] != null && (int)Session["UserRole"] == Constants.Admin)
                {
                    AddAttendeeButton.Enabled = true;
                    RemoveButton.Enabled = true;
                    SaveButton.Enabled = true;
                }
                else
                {
                    AddAttendeeButton.Enabled = false;
                    RemoveButton.Enabled = false;
                    SaveButton.Enabled = false;
                }*/
            }
           
       }
       
        protected void ApplyButton_Click1(object sender, EventArgs e)
        {

            foreach (ListItem li in AttendeesListBox.Items)
            {
               
                attendees.Add(li.ToString());
            }

            Session["Attendees"] = attendees;

            Server.Transfer("~/Calendar.aspx");
        }

         
        protected void CancelButton_Click1(object sender, EventArgs e)
        {
            //attendees.Clear();
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
            try
            { 
                int index = AttendeesListBox.SelectedIndex;
                if (index != -1)
                {
                    attendees.Remove(AttendeesListBox.SelectedItem.ToString());
                    AttendeesListBox.Items.RemoveAt(index);
                }
                
            }
            catch(Exception error)
            {
                Response.Write(error.Message);
            }
        }
    }
}