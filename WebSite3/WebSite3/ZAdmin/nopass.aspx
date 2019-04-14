<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="nopass.aspx.cs" Inherits="ZAdmin_nopass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <p><font size="+2">待审核毕业设计</font></p>
<hr/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="lid" DataSourceID="SqlDataSource" ForeColor="Black" GridLines="Vertical" Height="188px" Width="1397px" >
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
            <asp:BoundField DataField="mname" HeaderText="专业名称" SortExpression="mname" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="tname" HeaderText="教师姓名" SortExpression="tname" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="context" HeaderText="备注" SortExpression="context" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("lid") %>' OnClick="Unnamed_Click" OnClientClick="return confirm('确定通过该毕设吗？')" Text="通过" ></asp:LinkButton>
                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("lid") %>' OnClick="Unnamed_Click1" Text="查看详情" ></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" SelectCommand="SELECT [lid], [lname], [source], [doout], [type], [hard], [sumwork], [mname], [tname], [context] FROM [teales] WHERE ([state] = @state) ORDER BY [lid]">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="state" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>

