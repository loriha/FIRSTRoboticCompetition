using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace HolmenHighSchoolRoboticClub
{
    static class Constants
    {
        public const int Volunteer = 0;
        public const int Student = 1;
        public const int Admin = 2;
        public const int Sponsor = 3;

    }
    
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //enable users hyperlink if logged in user is admin
            if (User.Identity.Name.Length > 0)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

                //SqlConnection con = new SqlConnection("data source=.; database=DefaultConnection; integrated security=SSPI");
                try
                {
                    SqlCommand cmd = new SqlCommand("select role from users where email = @Email", con);
                    cmd.Parameters.AddWithValue("@Email", User.Identity.Name);
                    con.Open();
                    int role = (int)cmd.ExecuteScalar();
                    if(role == Constants.Sponsor)
                    {
                        DonateLink.Enabled = true;
                    }
                    else
                    {
                        DonateLink.Enabled = false;
                    }
                    if (role == Constants.Admin )
                    {
                        UsersLink.Enabled = true;
                    }
                    else
                    {
                        UsersLink.Enabled = false;
                    }
                    CalendarLink.Enabled = true;
                    EmailLink.Enabled = true;
                    SponsorLink.Enabled = true;
                    
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
            {
                 UsersLink.Enabled = false;
                 CalendarLink.Enabled = false;
                 EmailLink.Enabled = false;
                 DonateLink.Enabled = false;
                 SponsorLink.Enabled = false;
            }
                
          
        }
    }
}