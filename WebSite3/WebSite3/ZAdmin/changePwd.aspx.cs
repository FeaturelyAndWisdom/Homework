using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZAdmin_changePwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        UserDao udao = new UserDao();
        User us = (User)Session["user"];
        if (!udao.checkPwd(new User(us.Account, oldpwd.Text)))
        {
            Response.Write("<script>alert('原密码有误，请重新输入');</script>");
            return;
        }
        if (!newpwd.Text.Equals(newpwd2.Text))
        {
            Response.Write("<script>alert('密码不一致,请重新输入');</script>");
            return;
        }
        User us1 = new User(us.Account, newpwd.Text);
        if (udao.changePwd(us1))
        {
            Response.Write("<script>alert('修改成功，请稍后重新登录');</script>");
        }
    }
}