using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZTeacher_addLesson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        String lname = lesname.Text;
        String source = scient.Checked==true?"科研":product.Checked==true?"生产":"教研";
        String wheredo = doin.Checked == true ? "是" : "否";
        int mid = int.Parse(major.Text);
        String ty = type.Text;
        String hardcount = hard.Text;
        String workcount = sumwork.Text;
        String cont = context.Text;
        Teacher tea = (Teacher)Session["tea"];
        Lesson les = new Lesson(lname,source,wheredo,mid,ty,hardcount,workcount,cont,tea.Tid);
        LesDao ldao = new LesDao();
        if (ldao.save(les))
        {
            Response.Write("<script>alert('添加成功,请等待审核');</script>");
        }
        else
        {
            Response.Write("<script>alert('添加失败');</script>");
        }
        
    }
}