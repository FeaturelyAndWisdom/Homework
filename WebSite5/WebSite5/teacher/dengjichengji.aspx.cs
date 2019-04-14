using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_dengjichengji : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string lid = Request.QueryString["lid"];
        string tid = ((Teacher)Session["tea"]).Tid;
        string sid = ((LinkButton)sender).CommandArgument;
        Response.Redirect("luru.aspx?lid="+lid+"&sid="+sid + "&tid=" + tid);
    }
}