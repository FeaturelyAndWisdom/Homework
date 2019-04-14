using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_myGrade : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sid = ((Student)Session["stu"]).Sid;
        SqlDataSource.SelectCommand += " and sid="+sid;
    }
}