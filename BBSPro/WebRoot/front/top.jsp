<%@page import="com.bbs.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/main.css"/>
  </head>
  
  <body>
    <div class="header">
	<div class="top">
    <table width="1400" border="0" cellpadding="0" cellspacing="0" style="height:110px; padding:0; margin:0;border-spacing: 0;border-collapse: collapse;">
      <tr>
      	<td width="473" height="110"><img src="img/logo.png" class="logo f1" /></td>
        <td width="66"></td>
        <td width="699">
        <%	User user = (User)request.getSession().getAttribute("user");
        	if(user==null){
         %>
        	<form action="LoginServlet" method="post">
            	用户名：<input type="text" name="uname" id="name" style="width:110px" />&nbsp;
                密码：<input type="password" name="pwd" id="pwd" style="width:110px"/>&nbsp;
                <input type="submit" value="登陆" />
                <input type="reset" value="重置" />
                <a href="front/register.jsp">注册账户</a>
            </form>
            <%}else{ %>
            	<div align="right" style="padding-right: 20px">欢迎您，<%=user.getUname() %>
            	<a href="front/changeInf.jsp">编辑个人信息</a>&nbsp;&nbsp;&nbsp;&nbsp;
            	<a href="LoginServlet" onclick="return confirm('确定退出该账户吗？')">注销</a>
            	</div>
            <%} %>
        </td>
        <td width="162" height="110">
	        <a href="front/index.jsp">返回首页</a>
        </td>
      </tr>
      
    </table>
  </div>
</div>
<hr />
  </body>
</html>
