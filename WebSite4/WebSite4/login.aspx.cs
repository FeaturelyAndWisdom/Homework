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
        UserDao udao = new UserDao();
        BookUser user = udao.login(name, pwd);
        if (user != null)
        {
            Session["user"] = user;
            Response.Redirect("welcome.aspx");
        }
    }
    
}