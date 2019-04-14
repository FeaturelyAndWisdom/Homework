using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bookDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id = Request.QueryString["id"];
        BookDao bdao = new BookDao();
        BookInfo b = bdao.findById(id);
        bid.Text = b.BookId+"";
        bname1.Text = b.BookName;
        bname2.Text = b.BookName;
        btname.Text = b.BooktypeName;
        author.Text = b.Author;
        pbname.Text = b.PbName;
        pbdate.Text = b.Pbdate;
        price.Text = b.Price+"";
        state.Text = b.State;
        num.Text = b.Num+"";
        salecount.Text = b.Count+"";
        context.Text = b.Context;
    }
}