using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZAdmin_lesDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["lid"]);
        LesDao ldao = new LesDao();
        Lesson l = ldao.findById(id);
        lid.Text = id+"";
        lname.Text = l.Lname;
        source.Text = l.Source;
        doout.Text = l.Doout;
        academy.Text = l.Mname;
        type.Text = l.Type;
        hard.Text = l.Hard;
        sumwork.Text = l.Sumwork;
        context.Text = l.Context;
        tid.Text = l.Tid;
        tname.Text = l.Tname;
    }
}