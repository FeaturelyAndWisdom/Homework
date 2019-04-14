<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="typeadd.aspx.cs" Inherits="typeadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">图书类别添加</font></p>
<hr />
    <table align="center">
        <tr>
            <td>类别名称：</td>
            <td><asp:TextBox runat="server" ID="tname"></asp:TextBox></td>
        </tr>
        <tr>
            <td>所属类别：</td>
            <td>
                
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource" DataTextField="typename" DataValueField="typename">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" SelectCommand="SELECT [typename] FROM [bookType] WHERE ([isdel] = @isdel)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </td>
        </tr>
        <tr>
            <td>简要描述：</td>
            <td>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="context" Height="90px" Width="233px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center"><asp:Button runat="server" Text="提交" OnClick="Unnamed_Click" /><input type="reset" value="重置" /></td>
        </tr>
    </table>
</asp:Content>

