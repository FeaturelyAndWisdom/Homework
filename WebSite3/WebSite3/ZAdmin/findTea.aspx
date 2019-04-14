<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="findTea.aspx.cs" Inherits="ZAdmin_findTea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">教师查询</font></p>
<hr/>
<div align="center">
	请输入教师姓名：<asp:TextBox runat="server" ID="teakey"></asp:TextBox> &nbsp;&nbsp;<asp:Button runat="server" Text="查询" />
</div>
<p>&nbsp;</p>
</asp:Content>

