using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZTeacher_addStu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String tid = ((Teacher)Session["tea"]).Tid;
        String sql = "select lid,lname from teales where state=1 and tid='" + tid+"'";
        SqlDataSource.SelectCommand = sql;
    }
    //添加学生
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String tid = ((Teacher)Session["tea"]).Tid;
        int id = int.Parse(lid.Text);
        String ssid = sid.Text;
        LesDao ldao = new LesDao();
        if (ldao.chooseLes(ssid, id)){
            Response.Write("<script>alert('选择学生成功');</script>");
        }else{
            Response.Write("<script>alert('选择学生失败，请核对学号');</script>");
        }
    }
}