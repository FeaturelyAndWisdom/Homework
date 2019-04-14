using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StuMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Student stu = (Student)Session["stu"];
        name.Text = stu.Sname;
        sid.Text = stu.Sid;
    }

    protected void loginOut_Click(object sender, EventArgs e)
    {
        Session.Remove("stu");
        Response.Redirect("~/login.aspx");
    }
}
