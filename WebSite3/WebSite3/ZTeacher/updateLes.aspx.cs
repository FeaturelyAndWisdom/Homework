using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZTeacher_updateLes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Lesson les = (Lesson)Session["oldles"];
            lid.Value = les.Lid + "";
            lesname.Text = les.Lname;
            String souce = les.Source;
            switch (souce)
            {
                case "科研": scient.Checked = true; break;
                case "生产": product.Checked = true; break;
                case "教研": teach.Checked = true; break;
                case "其他": other.Checked = true; break;
            }
            if (les.Doout.Equals("是"))
            {
                doout.Checked = true;
            }
            else
            {
                doin.Checked = true;
            }
            major.Text = les.Mid + "";
            type.Text = les.Type;
            hard.Text = les.Hard;
            sumwork.Text = les.Sumwork;
            context.Text = les.Context;
        }
}

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        int id = int.Parse(lid.Value);
        String lname = lesname.Text;
        String source = scient.Checked == true ? "科研" : product.Checked == true ? "生产" : "教研";
        String wheredo = doin.Checked == true ? "否" : "是";
        int mid = int.Parse(major.Text);
        String ty = type.Text;
        String hardcount = hard.Text;
        String workcount = sumwork.Text;
        String cont = context.Text;
        Teacher tea = (Teacher)Session["tea"];
        Lesson les = new Lesson(lname, source, wheredo, mid, ty, hardcount, workcount, cont, tea.Tid);
        les.Lid = id;
        LesDao ldao = new LesDao();
        if (ldao.update(les))
        {
            Response.Write("<script>alert('更新成功,请等待审核');</script>");
            Response.Redirect("nopass.aspx");
        }
        else
        {
            Response.Write("<script>alert('更新失败');</script>");
        }
    }
}
