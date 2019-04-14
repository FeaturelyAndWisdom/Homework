<%--
  Created by IntelliJ IDEA.
  User: chenxid
  Date: 2019/4/7
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>成语学习</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <style type="text/css">
        dl, ol, ul {
            list-style-type: none;
        }

        .listLi {
            float: left;
            width: 210px;
            height: 120px;
            margin-right: 75px;
        }
    </style>
</head>
<body>
<jsp:include page="/front/topandleft.jsp"></jsp:include>
<div class="col-md-9 am-u-md-9 doc-content">
    <h1 id="web-zu-jian">汉字》成语学习</h1>
    <hr>
    <ul class="nineLattice clearfix">
        <c:forEach items="${requestScope.cylst}" var="cy">
            <c:if test="${cy.isdel==0}">
            <li class="listLi">
                <table style="height: 30px;font-size: 26px;" width="210px">
                    <tr>
                        <td align="center" width="25%">${cy.pys[0]}</td>
                        <td align="center" width="25%">${cy.pys[1]}</td>
                        <td align="center" width="25%">${cy.pys[2]}</td>
                        <td align="center" width="25%">${cy.pys[3]}</td>
                    </tr>
                </table>
                <div style="font-size: 50px;" align="center">${cy.word}</div>
            </li>
            </c:if>
        </c:forEach>
    </ul>
</div>
</div>
</section>
</body>
</html>
