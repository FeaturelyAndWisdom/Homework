<%@ Page Title="" Language="C#" MasterPageFile="~/ZTeacher/TeaMasterPage.master" AutoEventWireup="true" CodeFile="addStu.aspx.cs" Inherits="ZTeacher_addStu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">添加学生</font></p>
<hr/>
<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="2" align="center" bgcolor="#66FF99">添加学生</td>
  </tr>
  <tr>
    <td width="144">学生学号：</td>
    <td width="540"><asp:TextBox runat="server" ID="sid"></asp:TextBox></td>
  </tr>
  <tr>
    <td>毕设名称：</td>
    <td>
        <asp:DropDownList ID="lid" runat="server" DataSourceID="SqlDataSource" DataTextField="lname" DataValueField="lid">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" ></asp:SqlDataSource>
      </td>
  </tr>
  <tr>
    <td colspan="2" align="center" bgcolor="#66FF99"><asp:Button runat="server" OnClick="Unnamed_Click" Text="确定" /><asp:Button runat="server" Text="重置" /></td>
  </tr>
</table>
<p>&nbsp;</p>
</asp:Content>

