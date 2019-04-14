<%@ Page Title="" Language="C#" MasterPageFile="~/ZTeacher/TeaMasterPage.master" AutoEventWireup="true" CodeFile="passLes.aspx.cs" Inherits="ZTeacher_passLes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">已通过毕业设计</font></p>
<hr/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="lid" DataSourceID="SqlDataSource" ForeColor="Black" GridLines="Vertical" Height="188px" Width="1397px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="lid" HeaderText="lid" ReadOnly="True" SortExpression="lid" />
            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
            <asp:BoundField DataField="doout" HeaderText="doout" SortExpression="doout" />
            <asp:BoundField DataField="source" HeaderText="source" SortExpression="source" />
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            <asp:BoundField DataField="sumwork" HeaderText="sumwork" SortExpression="sumwork" />
            <asp:BoundField DataField="hard" HeaderText="hard" SortExpression="hard" />
            <asp:BoundField DataField="mname" HeaderText="mname" SortExpression="mname" />
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
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" ></asp:SqlDataSource>
    <br />
</asp:Content>

