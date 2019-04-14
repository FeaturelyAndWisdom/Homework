using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bookTypelst : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String id = ((LinkButton)sender).CommandArgument;
        BookTypeDao btdao = new BookTypeDao();
        if (btdao.del(id))
        {
            Response.Write("<script>alert('删除成功');location='bookTypelst.aspx';</script>");
        }
    }
}