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
        Teacher t = (Teacher)Session["tea"];
        tid.Text = t.Tid;
        tname.Text = t.Tname;
        sex.Text = t.Sex;
        birth.Text = t.Birthday + "";
        email.Text = t.Email;
        tel.Text = t.Tel;
        academy.Text = t.Academy;
        studeep.Text = t.StuDeep;
        address.Text = t.Address;
    }
}