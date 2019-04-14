using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class booklst : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String id = ((LinkButton)sender).CommandArgument;
        BookDao bdao = new BookDao();
        if (bdao.del(id))
        {
            Response.Write("<script>alert('删除成功');location='booklst.aspx';</script>");
        }
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        String id = ((LinkButton)sender).CommandArgument;
        Response.Redirect("bookDetail.aspx?id="+id);
    }
}