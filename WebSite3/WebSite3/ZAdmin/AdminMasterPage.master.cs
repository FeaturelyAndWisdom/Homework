using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User user = (User)Session["user"];
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Session.Remove("user");
        Response.Redirect("~/login.aspx");
    }
}
