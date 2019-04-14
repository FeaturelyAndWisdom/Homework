using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZTeacher_mystu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Teacher t = (Teacher)Session["tea"];
        String tid = t.Tid;
        String sql = "select sid,sname,sex,academy,major,clazz,tel,email,lname from stules where state=1 and tid='" + tid + "'";
        SqlDataSource.SelectCommand = sql;
    }
    //删除
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String sid = ((LinkButton)sender).CommandArgument;
        LesDao ldao = new LesDao();
        if (ldao.delBySid(sid))
        {
            Response.Write("<script>alert('删除成功，该学生已从该毕设中移除');</script>");
            Response.Redirect("mystu.aspx");
        }
    }
    //详情
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        String sid = ((LinkButton)sender).CommandArgument;
        Response.Redirect("studetail.aspx?sid=" + sid);
    }
}