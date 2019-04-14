<%@ Page Title="" Language="C#" MasterPageFile="~/ZStudent/StuMasterPage.master" AutoEventWireup="true" CodeFile="myLes.aspx.cs" Inherits="ZStudent_myLes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">我的毕业设计</font></p>
<hr/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="lid" DataSourceID="SqlDataSource" ForeColor="Black" GridLines="None" Height="188px" Width="1397px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="lid" HeaderText="毕设编号" ReadOnly="True" SortExpression="lid" >
            <HeaderStyle Height="30px" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="lname" HeaderText="毕设名称" SortExpression="lname" >
            <ItemStyle Height="30px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="source" HeaderText="来源" SortExpression="source" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="doout" HeaderText="是否在外完成" SortExpression="doout" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="type" HeaderText="类型" SortExpression="type" >
            <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
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
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                   <asp:LinkButton runat="server" CommandArgument='<%# Eval("lid") %>' OnClick="Unnamed_Click" Text="查看详情"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:mydbConnectionString %>' >
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="gstate" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

