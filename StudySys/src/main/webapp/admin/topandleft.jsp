<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
</head>
<body>
<header id="amz-header">
    <div class="amz-container am-cf">
        <h1><a href="${pageContext.request.contextPath}/front/index.jsp">嘟嘟学习网</a></h1>
        <nav>
            <ul class="amz-header-nav am-collapse">
                <c:if test="${sessionScope.admin!=null}">
                    <li><a href="javascript:;">【管理员】${sessionScope.admin.uname}</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout?type=1">注销</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</header>

<div class="amz-banner">
    <div class="amz-container am-scrollspy-init am-scrollspy-inview am-animation-scale-up">
        <h1>嘟嘟学习网</h1>
        <p>学一天 提神醒脑 学两天 永不疲劳 学三天 长生不老</p>
    </div>
</div>

<section id="amz-main">
    <div class="am-g am-g-fixed">
        <!--左侧菜单栏-->
        <div class="col-md-3 am-u-md-3">
            <div class="am-sticky-placeholder" style="height: 754px; margin: 0px;">
                <div id="amz-offcanvas" class="am-offcanvas doc-offcanvas" style="margin: 0px;">
                    <section class="amz-sidebar am-offcanvas-bar">
                        <div class="dbg-link">
                            <a href="/" class="am-btn am-btn-primary">
                                <i class="am-icon-bug"></i>Hello World</a>
                        </div>
                        <ul class="am-nav">
                            <li class="am-nav-header">用户模块</li>
                            <li><a href="${pageContext.request.contextPath}/admin/getUsersInfo">用户管理<span class="am-nav-en">用户管理</span></a></li>
                            <li class="am-nav-header">汉字模块</li>
                            <li><a href="${pageContext.request.contextPath}/admin/getHanzis?type=0">汉字管理<span class="am-nav-en">汉字管理</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/getHanzis?type=1">成语管理<span class="am-nav-en">成语管理</span></a></li>
                            <li class="am-nav-header">古诗模块</li>
                            <li><a href="${pageContext.request.contextPath}/admin/getGushis">古诗管理<span class="am-nav-en">古诗管理</span></a></li>
                            <li class="am-nav-header">通告模块</li>
                            <li><a href="${pageContext.request.contextPath}/admin/getMesForadmin">通告管理<span class="am-nav-en">通告管理</span></a></li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
        <!--左侧菜单栏end-->

</body>
</html>
