using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If Session not started or abandoned redirect to Login page

            
        }

        protected void Logout_ServerClick(object sender, EventArgs e)
        {
            // Clear all Session and abandon it

            Session.Clear();
            Session.Abandon();

            // Redirect to Login page

            Response.Redirect("~/Auth/Login.aspx");
        }
    }
}