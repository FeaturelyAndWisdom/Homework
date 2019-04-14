<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="allLes.aspx.cs" Inherits="ZAdmin_allLes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">毕业设计列表</font></p><br />
    状态：0-未审核 1-已通过审核，可选择 2-已结课
<hr/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="lid" DataSourceID="SqlDataSource" GridLines="Vertical" Height="188px" Width="1397px" ForeColor="Black">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="lid" HeaderText="毕设编号" ReadOnly="True" SortExpression="lid" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="lname" HeaderText="毕设名称" SortExpression="lname" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="source" HeaderText="来源" SortExpression="source" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="doout" HeaderText="是否在外完成" SortExpression="doout" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="type" HeaderText="类型" SortExpression="type" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="hard" HeaderText="难度" SortExpression="hard" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="sumwork" HeaderText="工作量" SortExpression="sumwork" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="tname" HeaderText="教师姓名" SortExpression="tname" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="mname" HeaderText="专业名称" SortExpression="mname" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="state" HeaderText="现状态"  SortExpression="state" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="操作">
            <ItemTemplate>
                <asp:LinkButton runat="server" OnClick="Unnamed_Click" CommandArgument='<%# Eval("lid") %>' Text="查看详情"></asp:LinkButton>
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
<asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" SelectCommand="SELECT [lid], [lname], [source], [doout], [type], [hard], [sumwork], [tname], [mname], [state] FROM [teales] ORDER BY [lid]"></asp:SqlDataSource>
</asp:Content>

