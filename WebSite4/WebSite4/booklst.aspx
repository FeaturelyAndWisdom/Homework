<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="booklst.aspx.cs" Inherits="booklst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">更改密码</font></p>
<hr />
    <div align="center">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bookId" DataSourceID="SqlDataSource">
            <Columns>
                <asp:BoundField DataField="bookId" HeaderText="图书编号" ReadOnly="True" SortExpression="bookId" />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" SortExpression="bookName" />
                <asp:BoundField DataField="booktypeId" HeaderText="图书类别" SortExpression="booktypeId" />
                <asp:BoundField DataField="author" HeaderText="作者姓名" SortExpression="author" />
                <asp:BoundField DataField="pbdate" HeaderText="出版日期" SortExpression="pbdate" />
                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                <asp:BoundField DataField="bookStates" HeaderText="图书状态" SortExpression="bookStates" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="删除" OnClientClick="return confirm('确定删除该图书吗？')" OnClick="Unnamed_Click" CommandArgument='<%# Eval("bookId") %>'></asp:LinkButton>
                        <asp:LinkButton runat="server" Text="查看详情" OnClick="Unnamed_Click1" CommandArgument='<%# Eval("bookId") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" SelectCommand="SELECT [bookId], [bookName], [booktypeId], [author], [pbdate], [bookStates], [price] FROM [bookInfo]"></asp:SqlDataSource>
         
    </div>
</asp:Content>

