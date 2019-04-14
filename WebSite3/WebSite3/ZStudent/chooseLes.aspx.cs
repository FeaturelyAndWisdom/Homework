using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZStudent_chooseLes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String sid = ((Student)Session["stu"]).Sid;
        String sql = "select * from teales where state=1 and lid not in (select lid from stules where sid='" + sid + "')";
        SqlDataSource.SelectCommand = sql;
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        int lid = int.Parse(((LinkButton)sender).CommandArgument);
        LesDao ldao = new LesDao();
        Student stu = (Student)Session["stu"];
        if (ldao.chooseLes(stu.Sid, lid))
        {
            Response.Write("<script>alert('选课成功，请等待老师联系');</script>");
            Response.Redirect("myLes.aspx");
        }
    }
}