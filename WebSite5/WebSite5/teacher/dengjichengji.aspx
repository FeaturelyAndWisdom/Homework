<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/TeaMaster.master" AutoEventWireup="true" CodeFile="dengjichengji.aspx.cs" Inherits="teacher_dengjichengji" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sid" DataSourceID="SqlDataSource">
            <Columns>
                <asp:BoundField DataField="sid" HeaderText="学生编号" ReadOnly="True" SortExpression="sid" />
                <asp:BoundField DataField="sname" HeaderText="学生姓名" SortExpression="sname" />
                <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                <asp:BoundField DataField="academy" HeaderText="学院" SortExpression="academy" />
                <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                <asp:BoundField DataField="clazz" HeaderText="班级" SortExpression="clazz" />
                <asp:BoundField DataField="tel" HeaderText="电话" SortExpression="tel" />
                <asp:BoundField DataField="email" HeaderText="邮箱" SortExpression="email" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" OnClick="Unnamed_Click" CommandArgument='<%# Eval("sid") %>'>录入成绩</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>" SelectCommand="SELECT [sid], [sname], [sex], [academy], [major], [clazz], [tel], [email] FROM [student]"></asp:SqlDataSource>

    </div>
</asp:Content>

