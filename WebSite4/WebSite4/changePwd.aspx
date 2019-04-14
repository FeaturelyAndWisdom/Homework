<%@ Page Title="" Language="C#" MasterPageFile="Main.master" AutoEventWireup="true" CodeFile="changePwd.aspx.cs" Inherits="teacher_changePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 144px;
        }
        .auto-style2 {
            width: 21%;
            height: 122px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">更改密码</font></p>
<hr />
    <div>
        <table align="center" class="auto-style2">
            <tr>
                <td class="auto-style1">原密码：</td>
                <td><asp:TextBox runat="server" ID="oldpwd" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1">新密码：</td>
                <td><asp:TextBox runat="server" ID="newpwd" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1">确认密码：</td>
                <td><asp:TextBox runat="server" ID="newpwd2" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button runat="server" Text="提交" OnClick="Unnamed_Click"/><asp:Button runat="server" Text="重置" OnClick="Unnamed_Click1" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

