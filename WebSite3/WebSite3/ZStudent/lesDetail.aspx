<%@ Page Title="" Language="C#" MasterPageFile="~/ZAdmin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="lesDetail.aspx.cs" Inherits="ZAdmin_lesDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">毕设详情</font></p>
<hr/>
    <table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="4" align="center" bgcolor="#66FFCC">毕设信息</td>
  </tr>
  <tr>
    <td width="166">毕业设计编号：</td>
    <td class="auto-style1"><asp:Label ID="lid" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>毕设名称：</td>
    <td class="auto-style1"><asp:Label ID="lname" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>题目来源：</td>
    <td class="auto-style1"><asp:Label ID="source" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>在其他社会实践中完成：</td>
    <td class="auto-style1"><asp:Label ID="doout" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>所属专业：</td>
    <td class="auto-style1"><asp:Label ID="academy" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>题目类型：</td>
    <td class="auto-style1"><asp:Label ID="type" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>难易度：</td>
    <td class="auto-style1"><asp:Label ID="hard" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>工作量：</td>
    <td class="auto-style1"><asp:Label ID="sumwork" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>教工号：</td>
    <td class="auto-style1"><asp:Label ID="tid" runat="server"></asp:Label></td>
  </tr>
    <tr>
    <td>教师姓名：</td>
    <td class="auto-style1"><asp:Label ID="tname" runat="server"></asp:Label></td>
  </tr>
   <tr>
    <td>备注：</td>
    <td class="auto-style1"><asp:Label ID="context" runat="server"></asp:Label></td>
  </tr>
</table>
</asp:Content>

