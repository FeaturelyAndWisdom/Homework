<%@ Page Title="" Language="C#" MasterPageFile="~/ZTeacher/TeaMasterPage.master" AutoEventWireup="true" CodeFile="perDetail.aspx.cs" Inherits="ZTeacher_perDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">教师信息</font></p>
<hr />
<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="4" align="center" bgcolor="#66FFCC">教师信息</td>
  </tr>
  <tr>
    <td width="166">职工号：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="tid"></asp:Label></td>
  </tr>
  <tr>
    <td>姓名：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="tname"></asp:Label></td>
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
    <td>邮箱：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="email"></asp:Label></td>
  </tr>
  <tr>
    <td>所在院系：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="academy"></asp:Label></td>
  </tr>
    <tr>
    <td>学历：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="studeep"></asp:Label></td>
  </tr>
    <tr>
    <td>地址：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="address"></asp:Label></td>
  </tr>
    <tr>
    <td>电话：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="tel"></asp:Label></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</asp:Content>

