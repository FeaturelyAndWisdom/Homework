<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <h1>图书管理系统</h1>
            <table>
                <tr>
                    <td>用户名:</td>
                    <td><asp:TextBox runat="server" ID="logname"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><asp:TextBox runat="server" TextMode="Password" ID="logpwd"></asp:TextBox></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button runat="server" Text="登录" OnClick="Unnamed1_Click" />&nbsp;&nbsp;
                        <input type="reset" value="重置" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
