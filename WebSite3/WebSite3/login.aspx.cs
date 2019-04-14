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

    protected void Login_Click(object sender, EventArgs e)
    {
        UserDao udao = new UserDao();
        String uname = username.Text;
        String pwd = password.Text;
        User us = new User(uname, pwd);
        us = udao.check(us);
        if (us != null)
        {
            String str = null;
            switch (us.RoleId) { 
                    case "0":
                    Session["user"] = us;
                    str = "~/ZAdmin/adminwelcome.aspx";
                break;
                    case "1":
                    Student stu = udao.findStuBySid(us);
                    Session["stu"] = stu;
                    str = "~/ZStudent/stuwelcome.aspx";
                break;
                    case "2":
                    Teacher tea = udao.findTeaBySid(us);
                    Session["tea"] = tea;
                    str = "~/ZTeacher/teawelcome.aspx";
                break;
            }
            Response.Redirect(str);
        }
        else
        {
            Server.Transfer("login.aspx?error=1");
        }
    }
}