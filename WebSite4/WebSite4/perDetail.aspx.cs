using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZTeacher_perDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BookUser u = (BookUser)Session["user"];
        id.Text = u.Uid+"";
        uname.Text = u.Uname;
        realname.Text = u.Realname;
        sex.Text = u.Sex;
        birth.Text = u.Birthday;
        address.Text = u.Address;
        email.Text = u.Email;
        tel.Text = u.Tel;
        oldhom.Text = u.Oldhome;
    }
}