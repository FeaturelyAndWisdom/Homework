<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/TeaMaster.master" AutoEventWireup="true" CodeFile="mystus.aspx.cs" Inherits="student_mystus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sid" DataSourceID="SqlDataSource" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="sid" HeaderText="学生编号" ReadOnly="True" SortExpression="sid" />
                <asp:BoundField DataField="sname" HeaderText="学生姓名" SortExpression="sname" />
                <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                <asp:BoundField DataField="birthday" HeaderText="生日" SortExpression="birthday" />
                <asp:BoundField DataField="academy" HeaderText="学院" SortExpression="academy" />
                <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                <asp:BoundField DataField="clazz" HeaderText="班级" SortExpression="clazz" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" OnClick="Unnamed_Click" CommandArgument='<%# Eval("sid") %>' >查看详情</asp:LinkButton>
                    </ItemTemplate>
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
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>" SelectCommand="SELECT [sid], [sname], [sex], [birthday], [academy], [major], [clazz], [email], [tel], [address] FROM [student]"></asp:SqlDataSource>

    </div>
</asp:Content>

