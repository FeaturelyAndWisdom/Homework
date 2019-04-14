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
            BookUser s = (BookUser)Session["user"];
            uid.Text = s.Uid+"";
            realname.Text = s.Realname;
            uname.Text = s.Uname;
            if ("男".Equals(s.Sex))
            {
                man.Checked = true;
            }
            else
            {
                woman.Checked = true;
            }
            birth.Value = s.Birthday;
            email.Text = s.Email;
            tel.Text = s.Tel;
            address.Text = s.Address;
        }

    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {

        int id = int.Parse(uid.Text);
        String name = uname.Text;
        String real = realname.Text;
        String sex = man.Checked == true ? "男" : "女";
        String mail = email.Text;
        String te = tel.Text;
        String birthday = birth.Value;
        String addres = address.Text;
        String oldhom = DropDownList1.Text+DropDownList2.Text+DropDownList3.Text;
        BookUser s = new BookUser(id,name,real,sex,birthday,addres,mail,te,oldhom);
        UserDao udao = new UserDao();
        if (udao.update(s))
        {
            s = udao.findById(id);
            Session["user"] = s;
            Response.Write("<script>alert('更新成功');location='welcome.aspx'</script>");
        }
        else
        {
            Response.Write("<script>alert('更新失败，请重新检查');location='welcome.aspx'</script>");
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        ListItem item = new ListItem("请选择");
        DropDownList3.Items.Add(item);
    }
}