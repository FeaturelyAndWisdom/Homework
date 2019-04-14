using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_changeInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Student s = (Student)Session["stu"];
            sid.Value = s.Sid;
            stuname.Text = s.Sname;
            if ("男".Equals(s.Sex))
            {
                man.Checked = true;
            }
            else
            {
                woman.Checked = true;
            }
            birth.Value = s.Birthday;
            foreach(ListItem item in DropDownList1.Items)
            {
                if (item.Text.Equals(s.Academy)) item.Selected = true;
            }
            foreach (ListItem item in DropDownList2.Items)
            {
                if (item.Text.Equals(s.Major)) item.Selected = true;
            }
            foreach (ListItem item in DropDownList3.Items)
            {
                if (item.Text.Equals(s.Clazz)) item.Selected = true;
            }
            
            email.Text = s.Email;
            tel.Text = s.Tel;
            address.Text = s.Address;
        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        ListItem itme = new ListItem("请选择");
        DropDownList3.Items.Add(itme);
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {

        String id = sid.Value;
        String sname = stuname.Text;
        String sex = man.Checked == true ? "男" : "女";
        String acad = DropDownList1.Text;
        String major = DropDownList2.Text;
        String clazz = DropDownList3.Text;
        String mail = email.Text;
        String te = tel.Text;
        String addres = address.Text;
        String birthday = birth.Value;
        Student s = new Student(id,sname,sex,birthday,acad,major,clazz,mail,te,addres);
        StuDao sdao = new StuDao();
        if (sdao.update(s))
        {
            sdao = new StuDao();
            s = sdao.findById(id);
            Session["stu"] = s;
            Response.Write("<script>alert('更新成功');location='welcome.aspx'</script>");
        }
        else
        {
            Response.Write("<script>alert('更新失败，请重新检查');location='welcome.aspx'</script>");
        }
    }
}