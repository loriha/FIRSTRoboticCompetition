﻿using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using HolmenHighSchoolRoboticClub.Models;
using System.Data.SqlClient;

namespace HolmenHighSchoolRoboticClub.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {

                SqlConnection con = new SqlConnection("data source=.; database=DefaultConnection;  integrated security=false; Password=; User ID=;");
                //SqlConnection con = new SqlConnection("server=.\\sqlexpress;" + "integrated security=SSPI;" + "database=aspnet-HolmenHighSchoolRoboticClub-20150920020616;" + "connection timeout=30;");
                try 
                {

                    Session["UserName"] = NameTextBox.Text;
                    Session["UserRole"] = Roles.Text;
                    SqlCommand cmd = new SqlCommand("insert into Users (Name,Role,Email) Values(@Name, @Role, @Email)", con);

                    cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
                    cmd.Parameters.AddWithValue("@Role", Roles.SelectedIndex.ToString());
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    
                 } 
                catch(Exception error)
                {
                    Response.Write(error.Message);
                }
                finally
                {
                    con.Close();
                }
                
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
               

            
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}