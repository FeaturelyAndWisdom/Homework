<%@ Page Title="" Language="C#" MasterPageFile="~/student/StuMaster.master" AutoEventWireup="true" CodeFile="myGrade.aspx.cs" Inherits="student_myGrade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="lid" DataSourceID="SqlDataSource">
            <Columns>
                <asp:BoundField DataField="lid" HeaderText="课程编号" ReadOnly="True" SortExpression="lid" />
                <asp:BoundField DataField="lname" HeaderText="课程名称" SortExpression="lname" />
                <asp:BoundField DataField="starttime" HeaderText="开始时间" SortExpression="starttime" />
                <asp:BoundField DataField="endtime" HeaderText="结束时间" SortExpression="endtime" />
                <asp:BoundField DataField="type" HeaderText="类型" SortExpression="type" />
                <asp:BoundField DataField="lesTime" HeaderText="课时" SortExpression="lesTime" />
                <asp:BoundField DataField="lesGrade" HeaderText="学分" SortExpression="lesGrade" />
                <asp:BoundField DataField="tname" HeaderText="教师姓名" SortExpression="tname" />
                <asp:BoundField DataField="grade" HeaderText="成绩" SortExpression="grade" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>" SelectCommand="SELECT [lid], [lname], [starttime], [endtime], [type], [lesTime], [lesGrade], [tname], [grade] FROM [stules] WHERE ([state] = @state)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="state" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>

