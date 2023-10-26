using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the user's first name from Session and display welcome message

            LiteralWelcomeMessage.Text = $"<h1 class=\"text-white\">Bienvenid@ Administrador, {Session["admin_username"]}</h1>";
        }
    }
}