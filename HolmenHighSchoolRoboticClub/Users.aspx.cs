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
using System.Net;
using System.Net.Mail;

namespace HolmenHighSchoolRoboticClub
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView2_RowCommand(Object sender, CommandEventArgs e)
        {

        }

        protected void LinkButton1_Command(Object sender, CommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            string arguments = e.CommandArgument.ToString();
            string[] args = arguments.Split(';'); //ID=0;NAME=1;ROLE=2;EMAIL=3;

            int index = Convert.ToInt32(args[0]);
            string name = args[1];
            string role = args[2];
            string email = args[3];

            SqlCommand cmd = new SqlCommand("UPDATE [Users] SET APPROVED=1 WHERE ID = " + index, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
            finally
            {
                con.Close();
            }

            //send email to user approved
            //sendEmail("cwintin@gmail.com", email, "Approved Message", "Approved Message " + "Role: " + role);
            
            //refresh user page
            Server.Transfer("~/Users.aspx");
        }

        protected void LinkButton2_Command(Object sender, CommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            string arguments = e.CommandArgument.ToString();
            string[] args = arguments.Split(';'); //ID=0;NAME=1;ROLE=2;EMAIL=3;

            int index = Convert.ToInt32(args[0]);
            string name = args[1];
            string role = args[2];
            string email = args[3];

            SqlCommand cmd = new SqlCommand("UPDATE [Users] SET APPROVED=2 WHERE ID = " + index, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
            finally
            {
                con.Close();
            }

            //send email to user denied
            //sendEmail("cwintin@gmail.com", email, "Denied Message", "Denied Message " + "Role: " + role);
            
            //refresh user page
            Server.Transfer("~/Users.aspx");
        }

        protected void LinkButton3_Command(Object sender, CommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            string arguments = e.CommandArgument.ToString();
            string[] args = arguments.Split(';'); //ID=0;NAME=1;ROLE=2;EMAIL=3;

            int index = Convert.ToInt32(args[0]);
            string name = args[1];
            string role = args[2];
            string email = args[3];

            SqlCommand cmd = new SqlCommand("UPDATE [Users] SET APPROVED=1 WHERE ID = " + index, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
            finally
            {
                con.Close();
            }

            //send email to user approved
            //sendEmail("cwintin@gmail.com", email, "Approved Message", "Approved Message " + "Role: " + role);

            //refresh user page
            Server.Transfer("~/Users.aspx");
        }

        void sendEmail(string strFrom, string strTo, string strSubject, string strBody)
        {
            /// Description, Send an email using (SMTP).

            MailMessage objMailMessage = new MailMessage();
            System.Net.NetworkCredential objSMTPUserInfo =
                new System.Net.NetworkCredential();
            SmtpClient objSmtpClient = new SmtpClient();

            try
            {
                objMailMessage.From = new MailAddress(strFrom);
                objMailMessage.To.Add(new MailAddress(strTo));
                objMailMessage.Subject = strSubject;
                objMailMessage.Body = strBody;

                objSmtpClient = new SmtpClient("172.0.0.1"); /// Server IP
                objSMTPUserInfo = new System.Net.NetworkCredential
                ("User name", "Password", "Domain");
                objSmtpClient.Credentials = objSMTPUserInfo;
                objSmtpClient.UseDefaultCredentials = false;
                objSmtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

                objSmtpClient.Send(objMailMessage);
            }
            catch (Exception ex)
            { throw ex; }

            finally
            {
                objMailMessage = null;
                objSMTPUserInfo = null;
                objSmtpClient = null;
            }
        }


       
    }

}