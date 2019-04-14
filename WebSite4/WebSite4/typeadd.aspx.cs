using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class typeadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String name = tname.Text;
        String parname = DropDownList1.Text;
        String con = context.Text;
        BookTypeDao btdao = new BookTypeDao();
        if(btdao.save(new bookType(name, parname, con)))
        {
            Response.Write("<script>alert('添加成功');location='bookTypelst.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败');</script>");
        }
    }
}