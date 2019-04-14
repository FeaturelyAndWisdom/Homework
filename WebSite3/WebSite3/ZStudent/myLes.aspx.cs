using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZStudent_myLes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String sid = ((Student)Session["stu"]).Sid;

        SqlDataSource.SelectCommand = "select * from stules where sId='"+sid+"' and gstate=0";
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String lid = ((LinkButton)sender).CommandArgument;
        Response.Redirect("lesDetail.aspx?lid=" + lid);
    }
}