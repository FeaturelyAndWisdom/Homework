<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="findCla.aspx.cs" Inherits="ZAdmin_findCla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">班级查询</font></p>
<hr/>
<div align="center">
	请输入班级名称：<asp:TextBox runat="server" ID="clakey"></asp:TextBox> &nbsp;&nbsp;<asp:Button runat="server" Text="查询" />
</div>
<p>&nbsp;</p>
</asp:Content>

