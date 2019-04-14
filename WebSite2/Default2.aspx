<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        name.Text = Request.Form["name"];
        stuId.Text = Request.Form["stuId"];
        sex.Text = Request.Form["sex"];
        academy.Text = Request.Form["academy"];
        major.Text = Request.Form["major"];
        grade.Text = Request.Form["grade"];
        cet.Text = Request.Form["cet"];
        email.Text = Request.Form["email"];
        string path = Request.Form["fileName"];
        name.Text = MapPath("~\\upload\\"+path);
        img.ImageUrl = "~\\upload\\"+path;
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<table width="700" border="0" align="center">
  <tr>
    <td colspan="2" align="center">学生信息录入</td>
  </tr>
  <tr>
    <td width="172" align="center">姓名：</td>
    <td width="512" align="left"><asp:Label ID="name" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td align="center">学号：</td>
    <td align="left"><asp:Label ID="stuId" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td align="center">性别：</td>
    <td align="left"><asp:Label ID="sex" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td align="center">学院：</td>
    <td align="left"><asp:Label ID="academy" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td align="center">专业：</td>
    <td align="left"><asp:Label ID="major" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td align="center">班级：</td>
    <td align="left"><asp:Label ID="grade" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td align="center">CET4成绩：</td>
    <td align="left"><asp:Label ID="cet" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td align="center">邮箱：</td>
    <td align="left"><asp:Label ID="email" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td align="center">上传照片：</td>
    <td align="left"><asp:ImageMap ID="img" runat="server" Height="152px" Width="124px"></asp:ImageMap></td>
    
  </tr>
  <tr></tr>
</table>
</body>
</html>


