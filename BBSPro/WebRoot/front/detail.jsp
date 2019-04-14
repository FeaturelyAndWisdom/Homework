<%@page import="com.bbs.bean.User"%>
<%@page import="com.bbs.bean.Comment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.bean.Essay"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正文</title>
<style type="text/css">
.cont {
	padding-left:10px;
	padding-right:10px;
	padding-bottom:10px;
	}
</style>
<script type="text/javascript">
	function reback(){
		var recont = document.getElementById("repcont").value;
		if(recont==''){
			alert("回复内容不能为空");
			return;
		}
		document.getElementById("fm").submit();
	}
</script>
</head>

<body>
<jsp:include page="top.jsp" />

<%  Map map = (Map)request.getAttribute("map");
	Essay e = (Essay)new ArrayList(map.keySet()).get(0);
	ArrayList<Comment> lst = (ArrayList)map.get(e);
	User user = (User)request.getSession().getAttribute("user");
 %>
<table width="1204" height="161" border="1" bordercolor="#0033FF" cellpadding="0" cellspacing="1" align="center">
  <tr>
    <td height="41" colspan="3" style="background-color:#CCC" >您现在的位置：首页-><%=e.getTitle() %></td>
  </tr>
  <tr>
  <td width="150" align="center">
  	<img src="txs/tx<%=e.getUser().getImg() %>.jpg" width="100" height="100" /><br />
    <p align="center"><%=e.getUser().getUname() %></p>
     </td>
  	<td colspan="2">
    <div class="cont">
    	<h1 align="center"><%=e.getTitle() %></h1>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><%=e.getCont() %></span>
</div>
    </td>
  </tr>
  <%if(lst!=null)
  	for(Comment c:lst){ %>
  <tr>
  <td width="120" align="center">
  	<img src="txs/tx<%=c.getUser().getImg() %>.jpg" width="100" height="100" /><br />
    <p align="center"><%=c.getUser().getUname() %></p>
     </td>
  	<td colspan="2">
        <div class="cont"><%=c.getCont() %></div>
    </td>
  </tr>
  <%} %>
  <tr>
    <td height="300px" align="center"><img src="txs/tx<%=user.getImg() %>.jpg" width="100" height="100" /><br />
    <p align="center">我(<%=user.getUname() %>)</p></td>
    <td width="700" colspan="2" valign="middle" class="cont">
    	<form action="Reply" method="post" id="fm">
    	<textarea id="repcont" name="repcont" style="width:260px;height:170px"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type="button" name="rep" id="rep" value="发表回复" onclick="reback()" />
    	<input type="hidden" name="eid" id="eid" value="<%=e.getEid()%>"/> 
    	</form>
    	</td>
  </tr>
</table>
<br/><br/>
<jsp:include page="footer.jsp" />
</body>
</html>