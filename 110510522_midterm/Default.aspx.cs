using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login_ClearBtn_Click(object sender, EventArgs e)
    {
        Login_Username.Text = "";
        Login_UserNameRequiredFieldValidator.Text = "";
    }

    protected void Signup_ClearBtn_Click(object sender, EventArgs e)
    {
        Signup_Username.Text = "";
        Signup_Password.Text = "";
        Signup_PasswordCmp.Text = "";
    }
}