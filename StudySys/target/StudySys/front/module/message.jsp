<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>通告</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/messagelst.css"/>
    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
</head>
<script>
    function getdetail(mid) {
        var localObj = window.location;
        var protocol = location.protocol;
        var host = localObj.host;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = protocol +"//"+host+"/"+contextPath;
        
        $.ajax({
            type:'get',
            url:basePath+'/front/module/getMessDetail?mid='+mid,
            success:function (data) {
                var date = new Date(data.createtime);
                $("#meslist").css("display","none");
                $("#mesdetail").css("display","");
                $("#title").text(data.title);
                $("#mesdate").text(date.getFullYear()+"-"+(date.getMonth() + 1) + '-' + date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds());
                $("#content").text(data.content);
            }
        })
    }

    function back() {
        $("#mesdetail").css("display","none");
        $("#meslist").css("display","");
    }
</script>
<body>
<jsp:include page="/front/topandleft.jsp"></jsp:include>
<div class="col-md-9 am-u-md-9 doc-content">
    <%--<h1 id="web-zu-jian">近期通告</h1>--%>
    <%--<hr>--%>
    <div id="divNotice" class="bulletin-board clearfix" style="width: 720px;">
        <div id="divnotice1238" class="singleton">
            <div id="meslist">
            <h2>通知公告</h2>
            <ul class="articlelist clearfix">
                <c:forEach items="${requestScope.meslst}" var="mes">
                    <c:if test="${mes.isdel==0}">
                    <li>
                        <a class="inform" href="javascript:;" onclick="getdetail(${mes.mid})" title="${mes.title}">${mes.title}</a>
                        <span><fmt:formatDate value="${mes.createtime}" pattern="yyyy-MM-dd"></fmt:formatDate> </span>
                    </li>
                    </c:if>
                </c:forEach>
            </ul>
            </div>

            <div id="mesdetail" style="display: none">
                <a href="javascript:;" onclick="back()" style="font-size: 19px"><<返回 </a>
                <br><br>
                <h1 id="title" align="center"></h1>
                <h2 id="mesdate" align="right"></h2>
                <div id="content" style="font-size: 15px;"></div>
            </div>
        </div>
    </div>
</div>
</div>
</section>
</body>
</html>
