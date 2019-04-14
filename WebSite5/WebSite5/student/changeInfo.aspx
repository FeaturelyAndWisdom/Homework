<%@ Page Title="" Language="C#" MasterPageFile="~/student/StuMaster.master" AutoEventWireup="true" CodeFile="changeInfo.aspx.cs" Inherits="student_changeInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
        <tr>
            <td>用户名：</td>
            <td><asp:TextBox runat="server" ID="stuname"></asp:TextBox><asp:HiddenField runat="server" ID="sid" /></td>
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
            <td>学院：</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="aname" DataValueField="aname">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>" SelectCommand="SELECT * FROM [academy] WHERE ([parName] = @parName2)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="parName2" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>专业：</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="aname" DataValueField="aname">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>" SelectCommand="SELECT * FROM [academy] WHERE ([parName] = @parName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="计算机学院" Name="parName" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>班级：</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="aname" DataValueField="aname">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>" SelectCommand="SELECT * FROM [academy] WHERE ([parName] = @parName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" DefaultValue="网络工程" Name="parName" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td><asp:TextBox runat="server" ID="email"></asp:TextBox></td>
        </tr>
        <tr>
            <td>电话：</td>
            <td><asp:TextBox runat="server" ID="tel"></asp:TextBox></td>
        </tr>
        <tr>
            <td>地址：</td>
            <td><asp:TextBox runat="server" ID="address"></asp:TextBox></td>
        </tr>
        <tr><td colspan="2" align="center"><asp:Button runat="server" Text="提交" OnClick="Unnamed1_Click" /><input type="reset" value="重置" /></td></tr>
    </table>
</asp:Content>

