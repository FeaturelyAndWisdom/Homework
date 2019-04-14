using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void academy_SelectedIndexChanged(object sender, EventArgs e)
    {
        major.Items.Clear();
        grade.Items.Clear();
        ListItem item5 = new ListItem("请选择");
        major.Items.Add(item5);
        grade.Items.Add(item5);
        foreach(ListItem it in academy.Items)
        {
            if (it.Text == "计算机学院" && it.Selected==true)
            {
                ListItem item1 = new ListItem("软件工程");
                ListItem item2 = new ListItem("网络工程");
                ListItem item3 = new ListItem("计算机科学");
                ListItem item4 = new ListItem("通信工程");
                major.Items.Add(item1);
                major.Items.Add(item2);
                major.Items.Add(item3);
                major.Items.Add(item4);
            }
            if (it.Text == "外国语学院" && it.Selected==true)
            {
                ListItem item1 = new ListItem("英语");
                ListItem item2 = new ListItem("俄语");
                ListItem item3 = new ListItem("韩语");
                ListItem item4 = new ListItem("日语");
                major.Items.Add(item1);
                major.Items.Add(item2);
                major.Items.Add(item3);
                major.Items.Add(item4);
            }

        }
    }


    protected void major_SelectedIndexChanged(object sender, EventArgs e)
    {
        grade.Items.Clear();
        foreach(ListItem it in major.Items)
        {
            if (it.Selected)
            {
                string name = it.Text;
                ListItem item1 = new ListItem(name + "1501");
                ListItem item2 = new ListItem(name + "1502");
                ListItem item3 = new ListItem(name + "1503");
                ListItem item4 = new ListItem(name + "1504");
                grade.Items.Add(item1);
                grade.Items.Add(item2);
                grade.Items.Add(item3);
                grade.Items.Add(item4);
            }
        }
    }

    protected void stuId_TextChanged(object sender, EventArgs e)
    {

    }


    protected void upload_Click(object sender, EventArgs e)
    {
        if (photo.HasFile)
        {
            try
            {
                photo.PostedFile.SaveAs(MapPath("~\\upload\\"+photo.FileName));                   
                fileName.Value = photo.FileName;
                fileShow.Text = "上传成功";
            }
            catch(Exception ex)
            {
                fileShow.Text = "上传失败";
            }
        }
    }


    protected void submit_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default2.aspx");
    }


    protected void reset_Click(object sender, EventArgs e)
    {
        name.Text = "";
        stuId.Text = "";
        man.Checked = true;
        academy.SelectedIndex=0;
        major.Items.Clear();
        grade.Items.Clear();
        ListItem item5 = new ListItem("请选择");
        major.Items.Add(item5);
        grade.Items.Add(item5);
        cet.Text = "";
        email.Text = "";
    }
}
