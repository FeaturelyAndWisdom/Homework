<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="sortFind.aspx.cs" Inherits="sortFind" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>&nbsp;</p>
    <p><font size="+2">分类查询</font></p>
<hr />
    <div align="center">
        请输入查询信息：
     
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource" DataTextField="typename" DataValueField="typename">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" SelectCommand="SELECT * FROM [bookType] WHERE ([partypename] NOT LIKE '%' + @partypename + '%')">
            <SelectParameters>
                <asp:Parameter DefaultValue="无" Name="partypename" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox runat="server" ID="key" ></asp:TextBox>
        <asp:Button runat="server" Text="查询" OnClick="Unnamed_Click" />
        <asp:Button runat="server" Text="重置查询条件" OnClick="Unnamed_Click3" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bookId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="bookId" HeaderText="图书编号" InsertVisible="False" ReadOnly="True" SortExpression="bookId" />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" SortExpression="bookName" />
                <asp:BoundField DataField="booktypeId" HeaderText="所属类别" SortExpression="booktypeId" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="pbName" HeaderText="出版社" SortExpression="pbName" />
                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                <asp:BoundField DataField="bookStates" HeaderText="图书状态" SortExpression="bookStates" />
                <asp:BoundField DataField="num" HeaderText="库存量" SortExpression="num" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="删除" OnClientClick="return confirm('确定删除该图书吗？')" OnClick="Unnamed_Click2" CommandArgument='<%# Eval("bookId") %>'></asp:LinkButton>
                        <asp:LinkButton runat="server" Text="查看详情" OnClick="Unnamed_Click1" CommandArgument='<%# Eval("bookId") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" ></asp:SqlDataSource>
    </div>
</asp:Content>

