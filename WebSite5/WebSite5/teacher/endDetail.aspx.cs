using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_endDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string lid = Request.QueryString["lid"];
            SqlDataSource.SelectCommand = "SELECT [sid], [sname], [sex], [birthday], [academy], [major], [clazz], [tel], [grade] FROM [stugra] where lid="+lid;
        }
    }
}