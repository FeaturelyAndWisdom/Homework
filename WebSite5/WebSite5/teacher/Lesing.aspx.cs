using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_myLes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        LesDao ldao = new LesDao();
        String lid = ((LinkButton)sender).CommandArgument;
        if (ldao.overLes(lid))
        {
            Response.Redirect("dengjichengji.aspx?lid=" + lid);
        }
        else
        {
            Response.Write("结课出错，请联系管理员");
        }
        
       
    }
}