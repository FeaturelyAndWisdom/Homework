using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZTeacher_nopass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Teacher t = (Teacher)Session["tea"];
        String sql = "SELECT [lid], [source], [lname], [doout], [type], [hard], [sumwork], [tname], [mname] FROM [teales] WHERE state=0 and tid='"+t.Tid+"'";
        SqlDataSource.SelectCommand = sql;
    }
    //删除
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String lid = ((LinkButton)sender).CommandArgument;
        LesDao ldao = new LesDao();
        if (ldao.delByLid(int.Parse(lid)))
        {
            Response.Write("<script>alert('删除成功');</script");
            Response.Redirect("nopass.aspx");
        }
        else
        {
            Response.Write("<script>alert('删除失败');</script");
        }
    }
    //更新
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        String lid = ((LinkButton)sender).CommandArgument;
        LesDao ldao = new LesDao();
        Lesson les = ldao.findById(int.Parse(lid));
        Session["oldles"] = les;
        Response.Redirect("updateLes.aspx");

    }
}