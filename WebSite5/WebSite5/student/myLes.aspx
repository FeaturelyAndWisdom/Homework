<%@ Page Title="" Language="C#" MasterPageFile="~/student/StuMaster.master" AutoEventWireup="true" CodeFile="myLes.aspx.cs" Inherits="student_myLes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="lid" DataSourceID="SqlDataSource" Height="208px" Width="943px">
            <Columns>
                <asp:BoundField DataField="lid" HeaderText="课程编号" InsertVisible="False" ReadOnly="True" SortExpression="lid" />
                <asp:BoundField DataField="lname" HeaderText="课程名称" SortExpression="lname" />
                <asp:BoundField DataField="starttime" HeaderText="开始时间" SortExpression="starttime" />
                <asp:BoundField DataField="endtime" HeaderText="结课时间" SortExpression="endtime" />
                <asp:BoundField DataField="type" HeaderText="课程类型" SortExpression="type" />
                <asp:BoundField DataField="lesTime" HeaderText="课时" SortExpression="lesTime" />
                <asp:BoundField DataField="lesGrade" HeaderText="学分" SortExpression="lesGrade" />
            </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>" SelectCommand="SELECT [lid], [lname], [starttime], [endtime], [type], [lesTime], [lesGrade] FROM [lesson] WHERE ([state] = @state)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="state" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

