using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZAdmin_nopass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Unnamed_Click(object sender, EventArgs e)
    {
        LesDao ldao = new LesDao();
        int lid = int.Parse(((LinkButton)sender).CommandArgument);
        if (ldao.passLes(lid))
        {
            Response.Write("<script>alert('通过成功，请在已通过课设中查看详情');</script>");
            Response.Redirect("nopass.aspx");
        }
        else
        {
            Response.Write("<script>alert('通过失败，请在联系网管检查问题');</script>");
        }
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        String lid = ((LinkButton)sender).CommandArgument;
        Response.Redirect("lesDetail.aspx?lid=" + lid);
    }
}