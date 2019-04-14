<%@ Page Title="" Language="C#" MasterPageFile="~/student/StuMaster.master" AutoEventWireup="true" CodeFile="findLes.aspx.cs" Inherits="student_findLes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        请输入查找的课程名：<asp:TextBox runat="server" ID="leskey" ></asp:TextBox> &nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" Text="查询" />
    </div>
</asp:Content>

