<%@ Page Title="" Language="C#" MasterPageFile="~/ZTeacher/TeaMasterPage.master" AutoEventWireup="true" CodeFile="findLesson.aspx.cs" Inherits="ZTeacher_findLesson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">课程查询</font></p>
<hr/>
<div align="center">
	请输入课程名称：<asp:TextBox runat="server" ID="leskey"></asp:TextBox> &nbsp;&nbsp;<asp:Button runat="server" Text="查询" />
</div>
<p>&nbsp;</p>
</asp:Content>

