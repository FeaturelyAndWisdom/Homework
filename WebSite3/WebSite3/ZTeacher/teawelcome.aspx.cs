using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teawelcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Teacher tea = (Teacher)Session["tea"];
        teaname.Text = tea.Tname;
        year.Text = DateTime.Now.Year + "";
        mouth.Text = DateTime.Now.Month + "";
        day.Text = DateTime.Now.Day + "";
        DayOfWeek dayOfWeek = DateTime.Now.DayOfWeek;
        dday.Text = dayOfWeek.ToString();
    }
}