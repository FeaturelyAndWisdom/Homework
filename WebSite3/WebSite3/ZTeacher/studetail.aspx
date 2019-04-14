<%@ Page Title="" Language="C#" MasterPageFile="~/ZTeacher/TeaMasterPage.master" AutoEventWireup="true" CodeFile="studetail.aspx.cs" Inherits="ZTeacher_studetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">学生详细信息</font></p>
<hr />
<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="4" align="center" bgcolor="#66FFCC">学籍信息</td>
  </tr>
  <tr>
    <td width="166">学号：</td>
    <td class="auto-style1"><asp:Label ID="sid" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>姓名：</td>
    <td class="auto-style1"><asp:Label ID="sname" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>性别：</td>
    <td class="auto-style1"><asp:Label ID="sex" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>生日：</td>
    <td class="auto-style1"><asp:Label ID="birth" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>所在院系：</td>
    <td class="auto-style1"><asp:Label ID="academy" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>专业：</td>
    <td class="auto-style1"><asp:Label ID="major" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>班级：</td>
    <td class="auto-style1"><asp:Label ID="clazz" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>邮箱：</td>
    <td class="auto-style1"><asp:Label ID="email" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>电话：</td>
    <td class="auto-style1"><asp:Label ID="tel" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>地址：</td>
    <td class="auto-style1"><asp:Label ID="address" runat="server"></asp:Label></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</asp:Content>

