using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_TeaMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginout(object sender, EventArgs e)
    {
        Session.Remove("tea");
        Response.Redirect("~/login.aspx");
    }
}
