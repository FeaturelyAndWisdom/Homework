<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addTea.aspx.cs" Inherits="ZAdmin_addTea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">教师注册</font></p>
<hr/>

<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="2" align="center" bgcolor="#FFFF99">教师注册</td>
  </tr>
  <tr>
    <td width="153" align="center">职工号：</td>
    <td width="531"><asp:TextBox runat="server" ID="tid"></asp:TextBox></td>
  </tr>
  <tr>
    <td align="center">姓名：</td>
    <td><asp:TextBox runat="server" ID="name"></asp:TextBox></td>
  </tr>
  <tr>
    <td align="center">性别：</td>
    <td><asp:RadioButton runat="server" GroupName="sex" Checked="true" ID="man" Text="男" />&nbsp;<asp:RadioButton runat="server" GroupName="sex" ID="woman" Text="女" /></td>
  </tr>
  <tr>
    <td align="center">生日：</td>
    <td><input type="date" runat="server" id="birthday" /></td>
  </tr>
  <tr>
    <td align="center">学院：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">邮箱：</td>
    <td><asp:TextBox runat="server" ID="email" ></asp:TextBox></td>
  </tr>
  <tr>
    <td align="center">电话：</td>
    <td><asp:TextBox runat="server" ID="tel" ></asp:TextBox></td>
  </tr>
  <tr>
    <td align="center">入校时间：</td>
    <td><input type="date" runat="server" id="indate" /></td>
  </tr>
  <tr>
    <td align="center">学历：</td>
    <td></td>
  </tr>
  <tr>
    <td align="center">籍贯</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center" bgcolor="#FFFF99"><asp:Button runat="server" Text="注册" />&nbsp;&nbsp;<asp:Button runat="server" Text="重置" /></td>
  </tr>
</table>
<p>&nbsp;</p>
</asp:Content>

