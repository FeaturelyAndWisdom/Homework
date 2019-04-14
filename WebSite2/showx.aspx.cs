using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class showx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        /*
        name.Text = Request.Form["name"];
        stuId.Text = Request.Form["stuId"];
        sex.Text = Request.Form["sex"]=="man"?"男":"女";
        academy.Text = Request.Form["academy"];
        major.Text = Request.Form["major"];
        grade.Text = Request.Form["grade"];
        cet.Text = Request.Form["cet"];
        email.Text = Request.Form["email"];
        string path = Request.Form["fileName"];
        img.ImageUrl = "~\\upload\\" + path;
        */
        /*
        name.Text = Session["name"]+"";
        stuId.Text = Session["stuId"] + "";
        sex.Text = ""+Session["sex"] == "man" ? "男" : "女";
        academy.Text = Session["academy"] + "";
        major.Text = Session["major"] + "";
        grade.Text = Session["grade"] + "";
        cet.Text = Session["cet"] + "";
        email.Text = Session["email"] + "";
        string path = Session["fileName"] + "";
        img.ImageUrl = "~\\upload\\" + path;
        */
        name.Text = Request.QueryString["name"];
        stuId.Text = Request.QueryString["stuId"];
        sex.Text = Request.QueryString["sex"] == "man" ? "男" : "女";
        academy.Text = Request.QueryString["academy"];
        major.Text = Request.QueryString["major"];
        grade.Text = Request.QueryString["grade"];
        cet.Text = Request.QueryString["cet"];
        email.Text = Request.QueryString["email"];
        string path = Request.QueryString["fileName"];
        img.ImageUrl = "~\\upload\\" + path;
    }
}