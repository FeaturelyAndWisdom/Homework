<%@ Page Title="" Language="C#" MasterPageFile="~/ZTeacher/TeaMasterPage.master" AutoEventWireup="true" CodeFile="findStu.aspx.cs" Inherits="ZTeacher_findStu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">学生查询</font></p>
<hr/>
<div align="center">
	请输入学生姓名：<asp:TextBox runat="server" ID="stukey"></asp:TextBox> &nbsp;&nbsp;<asp:Button runat="server" Text="查询" />
</div>
<p>&nbsp;</p>
</asp:Content>

