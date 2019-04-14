<%@ Page Title="" Language="C#" MasterPageFile="~/student/StuMaster.master" AutoEventWireup="true" CodeFile="myInfo.aspx.cs" Inherits="student_myInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 155px;
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" style="width:50%;height:50%" border="1">
        <tr>
            <td colspan="2" align="center">我的信息</td>
        </tr>
        <tr>
            <td class="auto-style1">学号：</td>
            <td><asp:Label runat="server" ID="sid"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">姓名：</td>
            <td><asp:Label runat="server" ID="sname"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">性别：</td>
            <td><asp:Label runat="server" ID="sex"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">生日：</td>
            <td><asp:Label runat="server" ID="birth"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">学院：</td>
            <td><asp:Label runat="server" ID="academy"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">专业：</td>
            <td><asp:Label runat="server" ID="major"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">班级：</td>
            <td><asp:Label runat="server" ID="clazz"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">籍贯：</td>
            <td><asp:Label runat="server" ID="address"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">邮箱：</td>
            <td><asp:Label runat="server" ID="email"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">电话：</td>
            <td><asp:Label runat="server" ID="tel"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

