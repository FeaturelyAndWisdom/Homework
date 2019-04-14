<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" SelectCommand="SELECT * FROM [address] WHERE ([parid] = @parid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="parid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" SelectCommand="SELECT [id], [name], [parid] FROM [address] WHERE ([parid] = @parid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="parid" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList3" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" SelectCommand="SELECT * FROM [address] WHERE ([parid] = @parid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="parid" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
