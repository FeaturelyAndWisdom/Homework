using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sortFind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            ListItem item = new ListItem("All");
            DropDownList1.Items.Add(item);
        }
        

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String str = DropDownList1.Text;
        String strkey = key.Text;
        if (str.Equals("All"))
        {
            String sql = "select * from bookInfo where bookName like '%"+strkey+"%' or author='%"+strkey+"%'";
            SqlDataSource1.SelectCommand = sql;
        }
        else
        {
            String sql = "select * from bookInfo where bookTypeId='"+str+"' and bookName like '%" + strkey + "%' or author='%" + strkey + "%'";
            SqlDataSource1.SelectCommand = sql;
        }
    }

    protected void Unnamed_Click2(object sender, EventArgs e)
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
        Response.Redirect("bookDetail.aspx?id=" + id);
    }

    protected void Unnamed_Click3(object sender, EventArgs e)
    {
        foreach(ListItem item in DropDownList1.Items)
        {
            if (item.Text.Equals("All"))
            {
                item.Selected = true;
                break;
            }
        }
        key.Text = "";
    }
}