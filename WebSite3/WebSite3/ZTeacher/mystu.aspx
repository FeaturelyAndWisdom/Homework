<%@ Page Title="" Language="C#" MasterPageFile="~/ZTeacher/TeaMasterPage.master" AutoEventWireup="true" CodeFile="mystu.aspx.cs" Inherits="ZTeacher_mystu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">我的学生</font></p>
<hr/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sid" DataSourceID="SqlDataSource" Height="188px" Width="1397px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="lname" HeaderText="毕设名称" SortExpression="lname" />
        <asp:BoundField DataField="sid" HeaderText="学号" ReadOnly="True" SortExpression="sid" />
        <asp:BoundField DataField="sname" HeaderText="学生姓名" SortExpression="sname" />
        <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
        <asp:BoundField DataField="academy" HeaderText="学院" SortExpression="academy" />
        <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
        <asp:BoundField DataField="clazz" HeaderText="班级" SortExpression="clazz" />
        <asp:BoundField DataField="email" HeaderText="邮箱" SortExpression="email" />
        <asp:BoundField DataField="tel" HeaderText="电话" SortExpression="tel" />
        <asp:TemplateField HeaderText="操作">
            <ItemTemplate>
                    <asp:LinkButton runat="server" Text="删除" CommandArgument='<%# Eval("sid") %>' OnClick="Unnamed_Click" OnClientClick="return confirm('确定删除该学生吗？')"></asp:LinkButton>
                    <asp:LinkButton runat="server" Text="查看详情" CommandArgument='<%# Eval("sid") %>' OnClick="Unnamed_Click1" ></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>"></asp:SqlDataSource>
</asp:Content>

