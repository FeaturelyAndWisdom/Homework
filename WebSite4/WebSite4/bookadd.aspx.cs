using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bookadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String boname = bname.Text;
        String typeName = DropDownList1.Text;
        String auth = author.Text;
        String pbnam = pbname.Text;
        double pric = double.Parse(price.Text);
        String pbdat = pbdate.Value;
        String state = nopass.Checked == true ? "未上架" : pass.Checked == true ? "已上架" : "缺货";
        int nums = int.Parse(num.Text);
        String context = con.Text;
        BookInfo b = new BookInfo(boname,typeName,auth,pbnam,context,pric,pbdat,state,nums);
        BookDao bdao = new BookDao();
        if (bdao.save(b))
        {
            Response.Write("<script>alert('添加图书成功');location='booklst.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('添加图书失败，请检查录入信息');</script>");
        }
    }
}