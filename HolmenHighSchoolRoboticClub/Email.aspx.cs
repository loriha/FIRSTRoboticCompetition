using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Diagnostics;


namespace HolmenHighSchoolRoboticClub
{
    public partial class Email : System.Web.UI.Page
    {
        
        
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EmailBtn_Click(object sender, EventArgs e)
        {
            string emailList = string.Empty;
            emailList += "mailto://";
            foreach (ListItem listitem in EmailCheckBoxList.Items)  
            {  
                 if (listitem.Selected)  
                     emailList += listitem.Value + ";";  
            }  
               
            Process.Start(emailList);
        }
    
    }
}