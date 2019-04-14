using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_luru : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StuDao sdao = new StuDao();
        String id = Request.QueryString["sid"] + "";
        Student s = sdao.findById(id);
        sid.Text = s.Sid;
        sname.Text = s.Sname;
        sex.Text = s.Sex;
        academy.Text = s.Academy;
        major.Text = s.Major;
        clazz.Text = s.Clazz;
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String sid = Request.QueryString["sid"];
        String tid = Request.QueryString["tid"];
        String lid = Request.QueryString["lid"];
        String grad = grade.Text;
        LesDao ldao = new LesDao();
        if (ldao.grade(sid, tid, lid, grad))
        {
            Response.Write("<script>alert('录入成功');</script>");
            Response.Redirect("dengjichengji.aspx?lid="+lid);
        }
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        grade.Text = "";
    }
}