using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace HolmenHighSchoolRoboticClub
{
    static class Constants
    {
        public const string Volunteer = "0";
        public const string Student = "1";
        public const string Admin = "2";
        public const string Sponsor = "3";

    }
    
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Context.User.Identity.SetUserName("");
            
            if ((Session["UsersRole"] != null) && (Session["UserRole"].ToString() == Constants.Admin))
               UsersLink.Enabled = true;
           else
               UsersLink.Enabled = false;
          
        }
    }
}