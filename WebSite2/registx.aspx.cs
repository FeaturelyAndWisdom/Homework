using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registx : System.Web.UI.Page
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
        foreach (ListItem it in academy.Items)
        {
            if (it.Text == "计算机学院" && it.Selected == true)
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
            if (it.Text == "外国语学院" && it.Selected == true)
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
        foreach (ListItem it in major.Items)
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

        if (System.IO.Directory.Exists(MapPath("~/upload")) == false)
        {
            System.IO.Directory.CreateDirectory(MapPath("~/upload"));
        }
        string ext = photo.FileName.Substring(photo.FileName.LastIndexOf('.'));
        if (photo.HasFile && (ext.Equals(".jpg") || (ext.Equals(".png"))))
        {
            try
            {
                photo.PostedFile.SaveAs(MapPath("~\\upload\\" + photo.FileName));
                fileName.Value = photo.FileName;
                fileShow.Text = "上传成功";
                
            }
            catch (Exception ex)
            {
                fileShow.Text = "上传失败";
            }
        }
        else
        {
            fileShow.Text = "上传失败";
        }
        

    }


    protected void submit_Click(object sender, EventArgs e)
    {
        //Server.Transfer("showx.aspx");
        /*
         if(validator1.IsValid && validator2.IsValid && validator6.IsValid && validator7.IsValid && validator5.IsValid)
        {
            Session["name"] = name.Text;
            Session["stuId"] = stuId.Text;
            Session["sex"] = man.Checked == true ? "男" : "女";
            Session["academy"] = academy.Text;
            Session["major"] = major.Text;
            Session["grade"] = grade.Text;
            Session["cet"] = cet.Text;
            Session["email"] = email.Text;
            Session["fileName"] = fileName.Value;
            Response.Redirect("showx.aspx");
        }
        */
        if (validator1.IsValid && validator2.IsValid && validator6.IsValid && validator7.IsValid && validator5.IsValid)
        {
            string sex = man.Checked == true ? "男" : "女";
            string url = "name=" + name.Text + "&stuId=" + stuId.Text + "&sex=" + sex + "&academy=" + academy.Text + "&major=" + major.Text + "&grade=" + grade.Text + "&cet=" + cet.Text + "&email=" + email.Text + "&fileName=" + fileName.Value;
            Response.Redirect("showx.aspx?"+url);
        }
    }


    protected void reset_Click(object sender, EventArgs e)
    {
        name.Text = "";
        stuId.Text = "";
        man.Checked=true;
        academy.SelectedIndex = 0;
        major.Items.Clear();
        grade.Items.Clear();
        ListItem item5 = new ListItem("请选择");
        major.Items.Add(item5);
        grade.Items.Add(item5);
        cet.Text = "";
        email.Text = "";
    }

}