using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TeaMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Teacher tea = (Teacher)Session["tea"];
        name.Text = tea.Tname;
        tid.Text = tea.Tid;
    }

    protected void loginOut_Click(object sender, EventArgs e)
    {
        Session.Remove("tea");
        Response.Redirect("~/login.aspx");
    }
}
