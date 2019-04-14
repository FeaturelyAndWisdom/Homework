<%--
  Created by IntelliJ IDEA.
  User: chenxid
  Date: 2019/4/13
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/messagelst.css"/>
    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <script>
        var localObj = window.location;
        var protocol = location.protocol;
        var host = localObj.host;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = protocol +"//"+host+"/"+contextPath;

        function operation(type,uid) {
            $.ajax({
                type:'get',
                url:basePath+'/admin/operaccount?uid='+uid+"&type="+type,
                success:function (data) {
                    if(data=="fail"){
                        alert("操作失败，请稍后再试");
                    }else if(data=="success"){
                        alert("操作成功");
                        history.go(0);
                    }
                }
            })
        }
    </script>
    <style>
        tr{
            height: 35px;
        }
        thead td{
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="topandleft.jsp"></jsp:include>
<table border="1" cellspacing="3" align="center" width="750px">
    <thead>
        <tr>
            <td width="7%" align="center">编号</td>
            <td width="15%" align="center">用户名</td>
            <td width="15%" align="center">地址</td>
            <td widtd="15%" align="center">生日</td>
            <td widtd="15%" align="center">密保问题</td>
            <td widtd="15%" align="center">创建时间</td>
            <td widtd="13%" align="center">操作</td>
        </tr>
    </thead>
    <c:forEach items="${requestScope.userlist}" var="user">
        <tr>
            <td align="center">${user.uid}</td>
            <td align="center">${user.uname}</td>
            <td align="center">${user.address}</td>
            <td align="center"><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
            <td align="center">${user.question}</td>
            <td align="center"><fmt:formatDate value="${user.createtime}" pattern="yyyy-MM-dd"/></td>
            <td align="center">
                <c:if test="${user.isdel==0}">
                    <a href="javascript:;" onclick="operation(0,${user.uid})">封号</a>
                </c:if>
                <c:if test="${user.isdel==1}">
                    <a href="javascript:;" onclick="operation(1,${user.uid})">解禁</a>
                </c:if>
            </td align="center">
        </tr>
    </c:forEach>
</table>
</body>
</html>
