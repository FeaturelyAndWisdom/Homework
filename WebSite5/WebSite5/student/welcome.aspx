<%@ Page Title="" Language="C#" MasterPageFile="~/student/StuMaster.master" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="student_welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">欢迎<asp:Label runat="server" ID="sname"></asp:Label>来到学生管理系统</div>
</asp:Content>

