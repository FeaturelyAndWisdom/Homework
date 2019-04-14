<%@ Page Title="" Language="C#" MasterPageFile="Main.master" AutoEventWireup="true" CodeFile="perDetail.aspx.cs" Inherits="ZTeacher_perDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">管理员信息</font></p>
<hr />
<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="4" align="center" bgcolor="#66FFCC">管理员信息</td>
  </tr>
  <tr>
    <td width="166">员工编号：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="id"></asp:Label></td>
  </tr>
  <tr>
    <td>用户名：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="uname"></asp:Label></td>
  </tr>
  <tr>
    <td>真实姓名：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="realname"></asp:Label></td>
  </tr>
  <tr>
    <td>性别：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="sex"></asp:Label></td>
  </tr>
  <tr>
    <td>生日：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="birth"></asp:Label></td>
  </tr>
  <tr>
    <td>地址：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="address"></asp:Label></td>
  </tr>
    <tr>
    <td>籍贯：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="oldhom"></asp:Label></td>
  </tr>
    <tr>
    <td>邮件：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="email"></asp:Label></td>
  </tr>
    <tr>
    <td>联系方式：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="tel"></asp:Label></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</asp:Content>

