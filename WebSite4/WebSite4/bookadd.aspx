<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="bookadd.aspx.cs" Inherits="bookadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>&nbsp;</p>
    <p><font size="+2">图书信息添加</font></p>
<hr />
    <div align="center">
        <table>
              <tr>
                  <td>图书名称：</td>
                  <td><asp:TextBox runat="server" ID="bname"></asp:TextBox></td>
              </tr>
              <tr>
                  <td>图书类别：</td>
                  <td>
                      <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource" DataTextField="typename" DataValueField="typename">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydb2ConnectionString %>" SelectCommand="SELECT [typename] FROM [bookType] WHERE ([isdel] = @isdel)">
                          <SelectParameters>
                              <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                  </td>
              </tr>
            <tr>
                  <td>作者：</td>
                  <td><asp:TextBox runat="server" ID="author"></asp:TextBox></td>
              </tr>
            <tr>
                  <td>出版社名称：</td>
                  <td><asp:TextBox runat="server" ID="pbname"></asp:TextBox></td>
              </tr>
            <tr>
                  <td>价格：</td>
                  <td><asp:TextBox runat="server" ID="price"></asp:TextBox></td>
              </tr>
            <tr>
                  <td>出版日期：</td>
                  <td><input type="date" id="pbdate" runat="server" /></td>
              </tr>
            <tr>
                  <td>图书状态：</td>
                  <td>
                      <asp:RadioButton runat="server" Text="未上架" Checked="true" ID="nopass" GroupName="states"/>
                      <asp:RadioButton runat="server" Text="已上架" ID="pass" GroupName="states"/>
                      <asp:RadioButton runat="server" Text="缺货" ID="nonum" GroupName="states"/>
                  </td>
              </tr>
            <tr>
                  <td>库存量：</td>
                  <td><asp:TextBox runat="server" ID="num"></asp:TextBox></td>
              </tr>
            <tr>
                  <td>描述：</td>
                  <td><asp:TextBox TextMode="MultiLine" runat="server" ID="con"></asp:TextBox></td>
              </tr>
            <tr><td><asp:Button runat="server" Text="提交" OnClick="Unnamed_Click" />&nbsp;<input type="reset" value="重置" /></td></tr>
        </table>
    </div>
</asp:Content>

