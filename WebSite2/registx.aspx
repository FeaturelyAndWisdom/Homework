<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registx.aspx.cs" Inherits="registx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table width="700" border="1" align="center">
    <tr>
      <td colspan="2" align="center">学生信息录入</td>
    </tr>
    <tr>
      <td width="172" align="center">姓名：</td>
      <td width="512" align="left">
          <asp:TextBox ID="name" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="validator1" runat="server" Font-Size="10pt" ControlToValidate="name"  ErrorMessage="姓名不能为空" ></asp:RequiredFieldValidator>
      </td>
      
    </tr>
    <tr>
      <td align="center">学号：</td>
      <td align="left">
          <asp:TextBox ID="stuId" runat="server" OnTextChanged="stuId_TextChanged"></asp:TextBox>
          <asp:RequiredFieldValidator ID="validator2" runat="server" Font-Size="10pt" ControlToValidate="stuId" Display="Static" ErrorMessage="学号不能为空" ShowMessageBox="true" ShowSummary="false"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="validator3" runat="server" Font-Size="10pt" ControlToValidate="stuId" ErrorMessage="学号格式错误" ValidationExpression="\d{12}"></asp:RegularExpressionValidator>
      </td>

    </tr>
    <tr>
      <td align="center">性别：</td>
      <td align="left">
          <asp:RadioButton ID="man" runat="server" Text="男" Checked="true" GroupName="sex" />&nbsp;
          <asp:RadioButton ID="woman" runat="server" Text="女"  GroupName="sex" />
          
      </td>
    </tr>
    <tr>
      <td align="center">学院：</td>
      <td align="left">
          <asp:DropDownList ID="academy" runat="server" AutoPostBack="true" OnTextChanged="academy_SelectedIndexChanged" >
                <asp:ListItem>请选择</asp:ListItem>
                <asp:ListItem>计算机学院</asp:ListItem>
                <asp:ListItem>外国语学院</asp:ListItem>
          </asp:DropDownList>
      </td>
    </tr>
    <tr>
      <td align="center">专业：</td>
      <td align="left">
          <asp:DropDownList ID="major" runat="server" AutoPostBack="true" OnSelectedIndexChanged="major_SelectedIndexChanged">
              <asp:ListItem>请选择</asp:ListItem>
          </asp:DropDownList>
      </td>
    </tr>
    <tr>
      <td align="center">班级：</td>
      <td align="left">
          <asp:DropDownList ID="grade" runat="server" AutoPostBack="true" Rows="1" >
                <asp:ListItem>请选择</asp:ListItem>
          </asp:DropDownList>
          </td>
    </tr>
    <tr>
      <td align="center">CET4成绩：</td>
      <td align="left">
          <asp:TextBox ID="cet" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="validator4" runat="server" Font-Size="10pt" ControlToValidate="cet" Display="Static" ErrorMessage="成绩不能为空"></asp:RequiredFieldValidator>
          <asp:RangeValidator ID="validator6" runat="server" Font-Size="10pt" ControlToValidate="cet" Display="Static" ErrorMessage="成绩范围有误" MaximumValue="710" MinimumValue="0" Type="Integer"></asp:RangeValidator>
      </td>
    </tr>
    <tr>
      <td align="center">邮箱：</td>
      <td align="left">
          <asp:TextBox ID="email" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="validator7" runat="server" Font-Size="10pt" ControlToValidate="email" Display="Static" ErrorMessage="成绩不能为空"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="validator5" runat="server" Font-Size="10pt" ControlToValidate="email" Display="Static" ErrorMessage="邮箱格式有误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
       </td>
      
    </tr>
    <tr>
      <td align="center">上传照片：</td>
      <td align="left">
          <asp:FileUpload ID="photo" runat="server" Width="200px" />&nbsp;&nbsp;
          <asp:Button Text="上传并校验" runat="server" ID="upload" OnClick="upload_Click" />
          <asp:Label ID="fileShow" runat="server" Font-Size="10pt" ForeColor="red"></asp:Label>
          <asp:HiddenField ID="fileName" runat="server" />
          <!--<asp:RequiredFieldValidator ID="validator" runat="server" Font-Size="10pt" ControlToValidate="photo" Display="Static" ErrorMessage="请上传照片" ShowMessageBox="true" ShowSummary="false"></asp:RequiredFieldValidator>-->
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
          <asp:Button runat="server" OnClick="submit_Click" Text="提交"/>
          <asp:Button runat="server" OnClick="reset_Click" Text="重置" />
      </td>
    </tr>
  </table>
    </form>
</body>
</html>
