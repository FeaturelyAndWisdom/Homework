<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="bookDetail.aspx.cs" Inherits="bookDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">图书详情</font></p>
<hr />
    <div align="center">
        <table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="4" align="center" bgcolor="#66FFCC"><asp:Label runat="server" ID="bname1"></asp:Label>详情</td>
  </tr>
  <tr>
    <td width="166">图书编号：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="bid"></asp:Label></td>
  </tr>
  <tr>
    <td>图书名称：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="bname2"></asp:Label></td>
  </tr>
  <tr>
    <td>图书类别：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="btname"></asp:Label></td>
  </tr>
  <tr>
    <td>作者姓名：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="author"></asp:Label></td>
  </tr>
  <tr>
    <td>出版社名称：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="pbname"></asp:Label></td>
  </tr>
  <tr>
    <td>出版日期：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="pbdate"></asp:Label></td>
  </tr>
    <tr>
    <td>价格：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="price"></asp:Label></td>
  </tr>
    <tr>
    <td>图书状态：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="state"></asp:Label></td>
  </tr>
    <tr>
    <td>库存量：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="num"></asp:Label></td>
  </tr> <tr>
    <td>销售量：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="salecount"></asp:Label></td>
  </tr>   <tr>
    <td>简介：</td>
    <td class="auto-style1"><asp:Label runat="server" ID="context"></asp:Label></td>
  </tr>
</table>
    </div>
</asp:Content>

