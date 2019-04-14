<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addAcad.aspx.cs" Inherits="ZAdmin_addAcad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">院系添加</font></p>
<hr/>

<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="2" align="center" bgcolor="#FFFF99">添加院系</td>
  </tr>
  <tr>
    <td width="153" align="center">院系名称：</td>
    <td width="531"><asp:TextBox runat="server" ID="aname"></asp:TextBox></td>
  </tr>
  <tr>
    <td align="center">院长职工号：</td>
    <td><asp:TextBox runat="server" ID="tid"></asp:TextBox></td>
  </tr>
   <tr>
    <td align="center">院长姓名：</td>
    <td><asp:TextBox runat="server" ID="tname"></asp:TextBox></td>
  </tr>
  <tr>
    <td colspan="2" align="center" bgcolor="#FFFF99"><asp:Button runat="server" Text="注册" />&nbsp;&nbsp;<asp:Button runat="server" Text="重置" /></td>
  </tr>
</table>
<p>&nbsp;</p>
</asp:Content>

