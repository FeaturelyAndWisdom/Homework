using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_stuDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StuDao sdao = new StuDao();
        String id = Request.QueryString["sid"]+"";
        Student s = sdao.findById(id);
        sid.Text = s.Sid;
        sname.Text = s.Sname;
        sex.Text = s.Sex;
        academy.Text = s.Academy;
        major.Text = s.Major;
        clazz.Text = s.Clazz;
        address.Text = s.Address;
        tel.Text = s.Tel;
        email.Text = s.Email;
        birth.Text = s.Birthday;
    }
}