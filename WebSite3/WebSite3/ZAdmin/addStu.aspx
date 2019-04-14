<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addStu.aspx.cs" Inherits="ZAdmin_addStu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">学生注册</font></p>
<hr/>

<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="2" align="center" bgcolor="#FFFF99">学生注册</td>
  </tr>
  <tr>
    <td width="153">学号：</td>
    <td width="531"><asp:TextBox runat="server" ID="sid"></asp:TextBox></td>
  </tr>
  <tr>
    <td>姓名：</td>
    <td><asp:TextBox runat="server" ID="name"></asp:TextBox></td>
  </tr>
  <tr>
    <td>性别：</td>
    <td><asp:RadioButton runat="server" GroupName="sex" ID="man" Checked="true" Text="男" />&nbsp;<asp:RadioButton runat="server" GroupName="sex" ID="woman" Text="女" /></td>
  </tr>
  <tr>
    <td>生日：</td>
    <td><input type="date" runat="server" id="birthday" /></td>
  </tr>
  <tr>
    <td>学院：</td>
    <td></td>
  </tr>
  <tr>
    <td>专业：</td>
    <td></td>
  </tr>
  <tr>
    <td>班级：</td>
    <td></td>
  </tr>
  <tr>
    <td>邮箱：</td>
    <td><asp:TextBox runat="server" ID="email" ></asp:TextBox></td>
  </tr>
  <tr>
    <td>电话：</td>
    <td><asp:TextBox runat="server" ID="tel" ></asp:TextBox></td>
  </tr>
  <tr>
    <td>入学时间：</td>
    <td><input type="date" runat="server" id="indate" /></td>
  </tr>
  <tr>
    <td>学年：</td>
    <td><asp:TextBox runat="server" ID="stuyear" ></asp:TextBox></td>
  </tr>
  <tr>
    <td>籍贯：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center" bgcolor="#FFFF99"><asp:Button runat="server" Text="注册" />&nbsp;&nbsp;<asp:Button runat="server" Text="重置" /></td>
  </tr>
</table>
<p>&nbsp;</p>
</asp:Content>

