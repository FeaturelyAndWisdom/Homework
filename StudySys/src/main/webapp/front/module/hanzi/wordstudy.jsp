<%--
  Created by IntelliJ IDEA.
  User: chenxid
  Date: 2019/4/7
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>看字识音</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <style type="text/css">
        dl, ol, ul {
            list-style-type: none;
        }

        .listLi {
            float: left;
            width: 70px;
            height: 120px;
            margin-right: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="/front/topandleft.jsp"></jsp:include>
<div class="col-md-9 am-u-md-9 doc-content">
    <h1 id="web-zu-jian">汉字》看字识音</h1>
    <hr>
    <ul class="nineLattice clearfix">

        <c:forEach items="${requestScope.hanzilst}" var="hz">
            <c:if test="${hz.isdel==0}">
                <li class="listLi">
                    <div style="height: 30px;font-size: 26px;" align="center">${hz.pinyin}</div>
                    <div style="font-size: 50px;" align="center">${hz.word}</div>
                </li>
            </c:if>
        </c:forEach>

    </ul>
</div>
</div>
</section>
</body>
</html>
