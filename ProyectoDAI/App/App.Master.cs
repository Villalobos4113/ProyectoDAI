using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.App
{
    public partial class App : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || Session["user_first_name"] == null || Session["user_last_name"] == null)
            {
                Response.Redirect("~/Auth/Login.aspx");
            }
        }

        protected void Logout_ServerClick(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Auth/Login.aspx");
        }
    }
}