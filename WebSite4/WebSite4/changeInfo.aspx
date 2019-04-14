<%@ Page Title="" Language="C#" MasterPageFile="Main.master" AutoEventWireup="true" CodeFile="changeInfo.aspx.cs" Inherits="student_changeInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">更改个人信息</font></p>
<hr />
    <table align="center">
        <tr>
            <td>员工编号：</td>
            <td><asp:TextBox runat="server" Enabled="false" ID="uid" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td><asp:TextBox runat="server" ID="uname"></asp:TextBox></td>
        </tr>
        <tr>
            <td>真实姓名：</td>
            <td><asp:TextBox runat="server" ID="realname"></asp:TextBox></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><asp:RadioButton runat="server" Text="男" ID="man" GroupName="sex" /><asp:RadioButton runat="server" ID="woman" Text="女" GroupName="sex" /></td>
        </tr>
        <tr>
            <td>生日：</td>
            <td><input type="date" runat="server" id="birth" /></td>
        </tr>
        <tr>
            <td>籍贯：</td>
            <td>
                <asp:DropDownList ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="addname" DataValueField="addname">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" SelectCommand="SELECT * FROM [address] WHERE ([parName] = @parName)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="parName" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList2" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="addname" DataValueField="addname">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" SelectCommand="SELECT * FROM [address] WHERE ([parName] = @parName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="陕西省" Name="parName" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="addname" DataValueField="addname">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" SelectCommand="SELECT * FROM [address] WHERE ([parName] = @parName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" DefaultValue="西安市" Name="parName" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>住址：</td>
            <td><asp:TextBox runat="server" ID="address" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td><asp:TextBox runat="server" ID="email"></asp:TextBox></td>
        </tr>
        <tr>
            <td>电话：</td>
            <td><asp:TextBox runat="server" ID="tel"></asp:TextBox></td>
        </tr>
        <tr><td colspan="2" align="center"><asp:Button runat="server" Text="提交" OnClick="Unnamed1_Click" /><input type="reset" value="重置" /></td></tr>
    </table>
</asp:Content>

