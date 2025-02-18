﻿using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using HolmenHighSchoolRoboticClub.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace HolmenHighSchoolRoboticClub.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // This doesn't count login failures towards account lockout
                // To enable password failures to trigger lockout, change to shouldLockout: true
                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

                if (result == SignInStatus.Success)
                {

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

                    try
                    {

                        SqlCommand cmd = new SqlCommand("SELECT Role, ID, Name FROM Users WHERE Email = @EmailID", con);
                        con.Open();
                        cmd.Parameters.AddWithValue("@EmailID", Email.Text);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            int UserRole = (int)reader["Role"];
                            String UserName = (String)reader["Name"];
                            int ID = (int)reader["ID"];
                            Session["UserEmail"] = Email.Text;
                            Session["UserRole"] = UserRole;
                            Session["UserName"] = UserName;
                            Session["UserID"] = ID;
                        }
                    }
                    catch(Exception error)
                    {
                        Response.Write(error.Message);
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                
                
                
                switch (result)
                {
                    case SignInStatus.Success:
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Invalid login attempt";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
    }
}