using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            Commodity_Link.Visible = true;
            LoginSignin_Link.Visible = false;
            Member_Link.Visible = true;
            Logout_Btn.Visible = true;
        }
    }

    protected void Logout_Btn_Click(object sender, EventArgs e)
    {
        Session["Username"] = null;
        Response.Redirect(Request.RawUrl);
    }
}