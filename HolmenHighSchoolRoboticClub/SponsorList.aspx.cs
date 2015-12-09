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
    public partial class SponsorList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTextBox.Text = DateTime.Now.ToString("d");
            }
        }

        protected void SearchDonationsTextBox_Click(object sender, EventArgs e)
        {
            string donationTotal ;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand cmd = new SqlCommand();
            DateTime enteredDate = DateTime.Parse(DateTextBox.Text);
            cmd.CommandText = "SELECT SUM(Currency) FROM Sponsor WHERE Sponsor.Date <= @date";
            cmd.Parameters.AddWithValue("@date", enteredDate);

            con.Open();
            cmd.Connection = con;
            donationTotal =cmd.ExecuteScalar().ToString();

            con.Close();
            TotalDonationsTextBox.Text = donationTotal;
        }
    }
}