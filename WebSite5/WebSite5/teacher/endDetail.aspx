<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/TeaMaster.master" AutoEventWireup="true" CodeFile="endDetail.aspx.cs" Inherits="teacher_endDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource">
            <Columns>
                <asp:BoundField DataField="sid" HeaderText="学生编号" SortExpression="sid" />
                <asp:BoundField DataField="sname" HeaderText="学生姓名" SortExpression="sname" />
                <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                <asp:BoundField DataField="birthday" HeaderText="生日" SortExpression="birthday" />
                <asp:BoundField DataField="academy" HeaderText="学院" SortExpression="academy" />
                <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                <asp:BoundField DataField="clazz" HeaderText="班级" SortExpression="clazz" />
                <asp:BoundField DataField="tel" HeaderText="联系方式" SortExpression="tel" />
                <asp:BoundField DataField="grade" HeaderText="成绩" SortExpression="grade" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>"></asp:SqlDataSource>
    </div>
</asp:Content>

