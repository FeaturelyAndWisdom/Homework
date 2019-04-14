<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="bookTypelst.aspx.cs" Inherits="bookTypelst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">图书类别管理</font></p>
<hr />
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="typename" DataSourceID="SqlDataSource">
            <Columns>
                <asp:BoundField DataField="typename" HeaderText="类别名称" ReadOnly="True" SortExpression="typename" />
                <asp:BoundField DataField="partypename" HeaderText="所属类别" SortExpression="partypename" />
                <asp:BoundField DataField="context" HeaderText="描述" SortExpression="context" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" OnClientClick="return confirm('确定删除该类别吗？')" CommandArgument='<%# Eval("typename") %>' OnClick="Unnamed_Click" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" SelectCommand="SELECT * FROM [bookType] WHERE ([isdel] = @isdel)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

