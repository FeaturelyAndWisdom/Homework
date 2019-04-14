<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>笔画练习</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css"/>
    <%--<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>--%>

</head>
<body>
    <jsp:include page="/front/topandleft.jsp"></jsp:include>
    <!--右侧 主界面-->
    <div class="col-md-9 am-u-md-9 doc-content">
        <h1 id="web-zu-jian">拼音》笔画练习</h1>
        <hr>
        <div class="wrapper">

            <canvas class="cavs" width="600" height="300"></canvas>
            <ul class="btn-list">
                <li><input type="color" style="width: 62px;height: 34px;" id="colorChange"></li>
                <li><input type="button" id="cleanBoard" value="清屏"></li>
                <li><input type="button" id="eraser" value="橡皮"></li>
                <li><input type="button" id="rescind" value="撤销"></li>
                <li><input type="range" id="lineRuler" value="1" min="1" max="20"></li>
            </ul>
        </div>
    </div>
    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.js" type="text/javascript" charset="utf-8"></script>
    </div>
    </section>
</body>
</html>
