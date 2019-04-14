<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addCla.aspx.cs" Inherits="ZAdmin_addCla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">班级添加</font></p>
<hr/>

<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="2" align="center" bgcolor="#FFFF99">添加班级</td>
  </tr>
  <tr>
    <td width="153" align="center">班级名称：</td>
    <td width="531"><asp:TextBox runat="server" ID="cname"></asp:TextBox></td>
  </tr>
  <tr>
    <td align="center">所属院系：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">所属专业：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center" bgcolor="#FFFF99"><asp:Button runat="server" Text="注册" />&nbsp;&nbsp;<asp:Button runat="server" Text="重置" /></td>
  </tr>
</table>
<p>&nbsp;</p>
</asp:Content>

