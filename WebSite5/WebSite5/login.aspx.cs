using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //登录
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        String name = logname.Text;
        String pwd = logpwd.Text;
        if (stu.Checked == true)
        {
            StuDao sdao = new StuDao();
            Student s = sdao.logBySid(new Student(name,pwd));
            if (s != null)
            {
                Session["stu"] = s;
                Response.Redirect("student/welcome.aspx");
            }
            else
            {
                Response.Write("<script>alert('登录失败，请检查用户名密码')</script>");
            }
        }
        else
        {
            TeaDao tdao = new TeaDao();
            Teacher t = tdao.logByTid(new Teacher(name,pwd));
            if (t != null)
            {
                Session["tea"] = t;
                Response.Redirect("teacher/welcome.aspx");
            }
            else
            {
                Response.Write("<script>alert('登录失败，请检查用户名密码')</script>");
            }
        }
    }
    
}