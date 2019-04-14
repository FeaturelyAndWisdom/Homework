<%@ Page Title="" Language="C#" MasterPageFile="~/ZTeacher/TeaMasterPage.master" AutoEventWireup="true" CodeFile="addLesson.aspx.cs" Inherits="ZTeacher_addLesson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 161px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><font size="+2">添加毕设</font></p>
<hr/>
<table width="700" border="1" align="center" cellpadding="1">
  <tr>
    <td colspan="2" align="center" bgcolor="#66FF99">添加毕业设计</td>
  </tr>
  <tr>
    <td class="auto-style1">毕设名称：</td>
    <td width="540">
        <asp:TextBox runat="server" ID="lesname"></asp:TextBox>
        <asp:RequiredFieldValidator ID="validator1" runat="server" Font-Size="10pt" ControlToValidate="lesname" ForeColor="Red"  ErrorMessage="毕设名称不能为空" ></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td class="auto-style1">题目来源：</td>
    <td>
        <asp:RadioButton runat="server" ID="scient" Text="科研" GroupName="sou"/>
        <asp:RadioButton runat="server" ID="product" Text="生产" GroupName="sou"/>
        <asp:RadioButton runat="server" ID="teach" Text="教研" GroupName="sou"/>
        <asp:RadioButton runat="server" ID="other" Text="其他" GroupName="sou" Checked="true"/>
    </td>
  </tr>
  <tr>
    <td class="auto-style1">在实验实习工程实际和社会调查等社会实践中完成：</td>
    <td>
        <asp:RadioButton runat="server" ID="doout" Text="是" GroupName="do" Checked="true"/><asp:RadioButton runat="server" ID="doin" Text="否" GroupName="do" />
    </td>
  </tr>
  <tr>
    <td class="auto-style1">所属专业：</td>
    <td>
        <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource" DataTextField="mname" DataValueField="mid">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" SelectCommand="SELECT [mname], [mid] FROM [major]"></asp:SqlDataSource>
      </td>
  </tr>
  <tr>
    <td class="auto-style1">类型：</td>
    <td><asp:DropDownList runat="server" ID="type" >
            <asp:ListItem Value="C#软件开发">C#软件开发</asp:ListItem>
            <asp:ListItem Value="Java软件开发">Java软件开发</asp:ListItem>
            <asp:ListItem Value="C++软件开发">C++软件开发</asp:ListItem>
            <asp:ListItem Value="硬件设计">硬件设计</asp:ListItem>
            <asp:ListItem Value="单片机开发">单片机开发</asp:ListItem>
            <asp:ListItem Value="通讯电路">通讯电路</asp:ListItem>
        </asp:DropDownList></td>
  </tr>
    <tr>
    <td class="auto-style1">难易度：</td>
    <td><asp:DropDownList runat="server" ID="hard" >
            <asp:ListItem Value="简单">简单</asp:ListItem>
            <asp:ListItem Value="中等">中等</asp:ListItem>
            <asp:ListItem Value="困难">困难</asp:ListItem>
        </asp:DropDownList></td>
  </tr>
    <tr>
    <td class="auto-style1">工作量：</td>
    <td><asp:DropDownList runat="server" ID="sumwork" >
            <asp:ListItem Value="小">小</asp:ListItem>
            <asp:ListItem Value="中">中</asp:ListItem>
            <asp:ListItem Value="大">大</asp:ListItem>
        </asp:DropDownList></td>
  </tr>
    <tr>
    <td class="auto-style1">备注：</td>
    <td><asp:TextBox runat="server" TextMode="MultiLine" ID="context" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Size="10pt" ForeColor="Red" ControlToValidate="context"  ErrorMessage="备注不能为空" ></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center" bgcolor="#66FF99"><asp:Button runat="server" Text="提交" OnClick="Unnamed1_Click" />&nbsp;&nbsp;<asp:Button runat="server" Text="重置" /></td>
  </tr>
</table>
<p>&nbsp;</p>
</asp:Content>

