<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showx.aspx.cs" Inherits="showx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <table width="700" border="0" align="center">
  <tr>
    <td colspan="2" align="center">学生信息</td>
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
    <td align="center">照片：</td>
    <td align="left"><asp:ImageMap ID="img" runat="server" Height="80px" Width="100px"></asp:ImageMap></td>
  </tr>
  <tr></tr>
</table>
</body>
</html>
