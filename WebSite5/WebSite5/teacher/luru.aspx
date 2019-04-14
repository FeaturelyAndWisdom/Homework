<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/TeaMaster.master" AutoEventWireup="true" CodeFile="luru.aspx.cs" Inherits="teacher_luru" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <table align="center" style="width:50%;height:50%" border="1">
        <tr>
            <td colspan="2" align="center">录入成绩</td>
        </tr>
        <tr>
            <td class="auto-style1">学号：</td>
            <td><asp:TextBox runat="server" ID="sid" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">姓名：</td>
            <td><asp:TextBox runat="server" ID="sname" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">性别：</td>
            <td><asp:TextBox runat="server" ID="sex" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">学院：</td>
            <td><asp:TextBox runat="server" ID="academy" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">专业：</td>
            <td><asp:TextBox runat="server" ID="major" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style1">班级：</td>
            <td><asp:TextBox runat="server" ID="clazz" Enabled="false"></asp:TextBox></td>
        </tr>
            <tr>
            <td class="auto-style1"><font color="red">成绩：</font></td>
            <td><asp:TextBox runat="server" ID="grade"></asp:TextBox></td>
        </tr>
            <tr>
                <td colspan="2">
                    <asp:Button runat="server" Text="录入" OnClick="Unnamed_Click" />&nbsp;&nbsp; <asp:Button runat="server" Text="重置" OnClick="Unnamed_Click1" />
                </td>
            </tr>
    </table>
    </div>
</asp:Content>

