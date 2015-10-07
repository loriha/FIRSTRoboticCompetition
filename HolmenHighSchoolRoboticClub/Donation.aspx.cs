using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HolmenHighSchoolRoboticClub
{
    public partial class Donation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                NameTextBox.Text = Session["UserName"].ToString();
            }
        }
        protected void OnSubmit(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("data source=.; database=DefaultConnection; integrated security=SSPI");
            try
            {

                SqlCommand cmd = new SqlCommand("insert into Sponsor (Name, Currency, DonationType, Profile) Values(@Name, @Currency, @DonationType, @Profile)", con);

                cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
                cmd.Parameters.AddWithValue("@Currency", txtAmount.Text);
                cmd.Parameters.AddWithValue("@DonationType", DonationType.SelectedIndex.ToString());
                cmd.Parameters.AddWithValue("@Profile", ProfileText.Text);
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
            finally
            {
                NameTextBox.Text = "";
                txtAmount.Text = "";
                ProfileText.Text = "";
                con.Close();
            }
        }
    }
}