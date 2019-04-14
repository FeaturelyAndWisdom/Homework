<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/TeaMaster.master" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="teacher_welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">欢迎<asp:Label runat="server" ID="tname"></asp:Label>来到教师管理系统</div>
</asp:Content>

