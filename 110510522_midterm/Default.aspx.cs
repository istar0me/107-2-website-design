using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            // 已登入
            Login_Username.Text = Session["Username"].ToString();
            Commodity_Link.Visible = true;
            Member_Link.Visible = true;
            LoginSignin_Link.Visible = false;
            Logout_Btn.Visible = true;
        }
        else
        {
            // 未登入
            Commodity_Link.Visible = false;
            Member_Link.Visible = false;
            LoginSignin_Link.Visible = true;
            Logout_Btn.Visible = false;
        }
    }

    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string username = Login_Username.Text;
            string password = Login_Password.Text;
            SqlDataSource1.SelectParameters["Username"].DefaultValue = username;
            SqlDataSource1.SelectParameters["Password"].DefaultValue = password;
            SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (reader.HasRows)
            {
                reader.Read();
                Session["Username"] = reader["Username"].ToString();
                Session["Password"] = reader["Password"].ToString();
                Session["isLogin"] = 1;
            }
            SqlDataSource1.Dispose();

            if (Login_RememberUsernameChkbox.Checked)
            {
                Session["Username"] = Login_Username.Text;
            }

            if (Session["Username"] != null) Response.Redirect("~/Commodity.aspx");
        }
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


    protected void SignupBtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid) {
            string username = Signup_Username.Text;
            string password = Signup_Password.Text;
            SqlDataSource2.InsertParameters["Username"].DefaultValue = username;
            SqlDataSource2.InsertParameters["Password"].DefaultValue = password;
            SqlDataSource2.Insert();
        }
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void Logout_Btn_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect(Request.RawUrl);
    }
}