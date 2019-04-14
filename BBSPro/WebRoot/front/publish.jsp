<%@page import="com.bbs.bean.User"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
<link rel="stylesheet" type="text/css" href="../css/base.css"/>
<script type="text/javascript">
	function sub(){
		var t = document.getElementById("title").value;
		var c = document.getElementById("cont").value;
		if(t=='' || c==''){
			alert('标题或内容不能为空');
			return;
		}
		document.getElementById("fm").submit();
	}
	
</script>
</head>

<body>
<jsp:include page="top.jsp" />
<div class="w1">
    <div class="w2">
   <form action="Publish" id="fm" method="post">
    <table border="2" cellpadding="0" cellspacing="1" style="width:100%;background-color:#CCCCCC;">
    	<tr align="center" >
    		<td width="200px"><h3>标&nbsp;&nbsp;&nbsp;&nbsp;题</h3></td>
    		<td width="600px"><input type="text" name="title" id="title" style="margin-left: 116px" class="input_text"/></td>
    	</tr>
    	<tr></tr>
    	<tr align="center">
    		<td><h3>内&nbsp;&nbsp;&nbsp;&nbsp;容</h3></td>
    		<td>
    			<textarea rows="100" cols="200" align="left" name="cont" id="cont" style="margin: 0px; height: 253px; width: 907px;"></textarea>
    		</td>
    	</tr>
    	<tr style="height:40px">
    		<td colspan="2" align="center">
    			<input type="button" value="提交" onclick="sub()" style="width: 130px;height: 32px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    			<input type="reset" value="重置" style="width: 130px;height: 32px"/>
    		</td>
    	</tr>
    </table>
    </form>
    </div>
</div>
<br/><br/>

<jsp:include page="footer.jsp" />
</body>
</html>