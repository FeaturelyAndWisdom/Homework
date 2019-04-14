using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_changePwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //改密码
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        if (!newpwd.Text.Equals(newpwd2.Text))
        {
            Response.Write("<script>alert('密码不一致，请重新输入');</script>");
            return;
        }
        String oldp = oldpwd.Text;
        String sid = ((Student)Session["stu"]).Sid;
        StuDao sdao = new StuDao();
        if(!sdao.checkPwd(new Student(sid, oldp)))
        {
            Response.Write("<script>alert('原密码有误，请重新输入');</script>");
            return;
        }
        if(sdao.changePwd(new Student(sid, newpwd.Text)))
        {
            Response.Write("<script>alert('修改成功，请稍后重新登录');</script>");
            return;
        }

    }
    //重置
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        oldpwd.Text = "";
        newpwd.Text = "";
        newpwd2.Text = "";
    }
}