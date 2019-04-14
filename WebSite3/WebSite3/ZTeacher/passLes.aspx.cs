using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZTeacher_passLes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Teacher t = (Teacher)Session["tea"];
        String sql = "select * from teales where state=1 and tid='"+t.Tid+"'";
        SqlDataSource.SelectCommand = sql;
    }
}