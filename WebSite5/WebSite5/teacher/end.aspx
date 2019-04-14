<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/TeaMaster.master" AutoEventWireup="true" CodeFile="end.aspx.cs" Inherits="teacher_end" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="lid" DataSourceID="SqlDataSource">
            <Columns>
                <asp:BoundField DataField="lid" HeaderText="课程编号" InsertVisible="False" ReadOnly="True" SortExpression="lid" />
                <asp:BoundField DataField="lname" HeaderText="课程名称" SortExpression="lname" />
                <asp:BoundField DataField="starttime" HeaderText="开始时间" SortExpression="starttime" />
                <asp:BoundField DataField="endtime" HeaderText="结束时间" SortExpression="endtime" />
                <asp:BoundField DataField="type" HeaderText="类型" SortExpression="type" />
                <asp:BoundField DataField="lesTime" HeaderText="课时" SortExpression="lesTime" />
                <asp:BoundField DataField="lesGrade" HeaderText="学分" SortExpression="lesGrade" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="查看详情" OnClick="Unnamed_Click" CommandArgument='<%# Eval("lid") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb3ConnectionString %>" SelectCommand="SELECT * FROM [lesson] WHERE ([state] = @state)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="state" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

