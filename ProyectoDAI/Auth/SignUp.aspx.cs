using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoDAI.Auth
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtNewEmail.Text;
            string password = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (password == confirmPassword)
            {
                Response.Redirect("~/App/");
            }
            else
            {
                lblPasswordMismatchError.Text = "Passwords do not match. Please make sure both passwords match.";
                lblPasswordMismatchError.Visible = true;
            }
            
        }
    }
}