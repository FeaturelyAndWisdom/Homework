using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZTeacher_studetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Student s = (Student)Session["stu"];
        sid.Text = s.Sid;
        sname.Text = s.Sname;
        sex.Text = s.Sex;
        birth.Text = s.Birthday + "";
        academy.Text = s.Academy;
        major.Text = s.Major;
        clazz.Text = s.Clazz;
        address.Text = s.Address;
        tel.Text = s.Tel;
        email.Text = s.Email;
    }
}