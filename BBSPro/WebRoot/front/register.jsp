<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link rel="stylesheet" type="text/css" href="../css/base.css"/>
<script src="../js/jquery-1.3.2.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript" language="javascript" src="../js/lanrenzhijia.js"></script>
<script src="../js/reg.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
	function checkName(){
		var name = document.getElementById("name").value;
		location = "../Register?uname="+name;
	}
</script>
</head>

<body>
<div id="head">
	<!--<div class="mod-header">
    	<img src="../img/logo-tieba.png" width="137" height="46" style="display:block"/>
    </div>-->
    <table width="981" border="0">
  <tr>
    <td width="242"><img src="../img/logo.png" width="242" height="72" /></td>
    <td width="137">&nbsp;</td>
    <td width="389"><h2>注册账号</h2></td>
    <td width="195">已有账号,立即
    <a href="index.jsp">登录</a>
    </td>
  </tr>
</table>

</div>
<hr/>
<div id="content">
	<form action="../Register" id="fm" method="post">
    <table width="478" height="267" border="0">
  <tr>
    <th scope="row">用户名：</th>
    <td><label for="textfield"></label>
      <input type="text" name="name" id="name" class="input_text" />
      </td>
  </tr>
  <tr>
    <th scope="row">密码：</th>
    <td><label for="textfield2"></label>
      <input type="password" name="pwd" id="pwd" class="input_text"/></td>
  </tr>
  <tr>
    <th scope="row">确认密码：</th>
    <td><label for="textfield2"></label>
      <input type="password" name="pwd2" id="pwd2" class="input_text"/></td>
  </tr>
  <tr>
    <th scope="row">手机号码：</th>
    <td><label for="textfield"></label>
      <input type="text" name="phone" id="phone" class="input_text" /></td>
  </tr>
  <tr>
    <th scope="row">真实姓名：</th>
    <td><label for="textfield"></label>
      <input type="text" name="real_name" id="real_name" class="input_text" /></td>
  </tr>
  <tr>
    <th scope="row">学号：</th>
    <td><label for="textfield"></label>
      <input type="text" name="sid" id="sid" class="input_text" /></td>
  </tr>
  <tr>
    <th scope="row">头像：</th>
    <td>
    <select name="img" id="img" class="visualSelect" style="width: 345px;height: 30px;">
	<option value="01">头像01</option>
	<option value="02">头像02</option>
	<option value="03">头像03</option>
	<option value="04">头像04</option>
	<option value="05">头像05</option>
	<option value="06">头像06</option>
	<option value="07">头像07</option>
	<option value="08">头像08</option>
	<option value="09">头像09</option>
	<option value="10">头像10</option>
</select>

      </td>
  </tr>
  <tr>
    <th scope="row">权限：</th>
    <td>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="role" value="0"/>学校管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="role" value="1" checked="checked"/>学生
      </td>
  </tr>
  <tr>
  	<td colspan="2" align="center">
  	<input type="button" style="width: 130px;height: 32px" onclick="check()" value="注册"/>&nbsp;&nbsp;&nbsp;
  	<input type="reset" value="重置" style="width: 130px;height: 32px"/>&nbsp;&nbsp;&nbsp;&nbsp;
  	<input type="button" style="width: 130px;height: 32px" onclick="checkName()" value="检查用户名"/>
  	</td>
  	
  </tr>
</table>
    </form>
</div>

</body>
</html>