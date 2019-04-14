<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="changePwd.aspx.cs" Inherits="ZAdmin_changePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">修改密码</font></p>
<hr />
<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="2" align="center" bgcolor="#66FFCC">修改密码</td>
  </tr>
  <tr>
    <td width="166">原密码：</td>
    <td width="518"><asp:TextBox runat="server" TextMode="Password" ID="oldpwd"></asp:TextBox></td>
  </tr>
  <tr>
    <td>新密码：</td>
    <td><asp:TextBox runat="server" TextMode="Password" ID="newpwd"></asp:TextBox></td>
  </tr>
  <tr>
    <td>确认密码：</td>
    <td><asp:TextBox runat="server" TextMode="Password" ID="newpwd2"></asp:TextBox></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><asp:Button runat="server" OnClick="Unnamed_Click" Text="提交"/>&nbsp;&nbsp;<asp:Button runat="server" Text="重置" /></td>
  </tr>
</table>
<p>&nbsp;</p>
</asp:Content>

