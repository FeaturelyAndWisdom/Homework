<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.bean.Essay"%>
<%@page import="java.util.List"%>
<%@page import="com.bbs.bean.User"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
<script type="text/javascript">
	function detail(eid){
		<%if(request.getSession().getAttribute("user")==null){%>
		alert('请登陆后进行操作');
		<%}else{%>
		location="Reply?eid="+eid;<%}%>
	}
	function goto(){
		location="front/publish.jsp";
	}
</script>
</head>

<body>
<jsp:include page="top.jsp" />
<div class="w1">
    <div class="w2">
   
    <table border="2" cellpadding="0" cellspacing="1" style="width:100%">
    	<tr align="center">
        	<th width="21%">公告时间</th>
            <th width="48%">公告名称</th>
            <th width="10%">浏览数</th>
            <th width="10%">回复数</th>
            <th width="21%">发布者</th>
        </tr>
        <%List<Essay> elst = (ArrayList)request.getSession().getAttribute("essays"); 
          if(elst==null){%>
          <jsp:forward page="/Publish" />
          <%
          	return;
          }
          for(Essay e:elst){
        %>
        <tr align="center" valign="middle">
        	<td><%=e.getPdate() %></td>
            <td><a href="javascript:void(0);" onclick="detail(<%=e.getEid()%>)"><%=e.getTitle() %></a></td>
            <td><%=e.getReadnum() %></td>
            <td><%=e.getReply() %></td>
            <td><%=e.getUser().getUname() %></td>
        </tr>
        <%} %>
        
    </table>
    </div>
</div>
<%User user = (User)request.getSession().getAttribute("user");
    	if(user!=null&&user.getRole()==0){
     %>
     <div align="right" style="padding-right: 255px;margin-top: 20px">
     <input type="button" value="发表新公告" style="width:100px;height: 50px" onclick="goto()"/>
     </div>
     <%} %>
<br /><br />
<jsp:include page="footer.jsp" />
</body>
</html>