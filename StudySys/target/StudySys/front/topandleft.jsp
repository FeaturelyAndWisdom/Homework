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
                <c:if test="${sessionScope.user==null}">
                    <li><a href="/getting-started">欢迎您，【游客】</a></li>
                    <li><a href="${pageContext.request.contextPath}/front/login.jsp">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/front/register.jsp">注册</a></li>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    <li><a href="/getting-started">欢迎您，【${sessionScope.user.uname}】</a></li>
                    <li><a href="${pageContext.request.contextPath}/front/changeInfo.jsp">个人信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">注销</a></li>
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
                            <li class="am-nav-header">拼音学习</li>
                            <li><a href="${pageContext.request.contextPath}/front/module/pinyin/readmusic.jsp">读音学习<span class="am-nav-en">读音学习</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/front/module/pinyin/writetest.jsp">笔画练习<span class="am-nav-en">笔画练习</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/front/module/pinyin/seekpinyin.jsp">拼音检索<span class="am-nav-en">拼音检索</span></a></li>
                            <li class="am-nav-header">汉字学习</li>
                            <li><a href="${pageContext.request.contextPath}/front/module/getHanziAll">看字识音<span class="am-nav-en">看字识音</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/front/module/getChengyuAll">成语学习<span class="am-nav-en">成语学习</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/front/module/hanzi/seekchengyu.jsp">成语检索<span class="am-nav-en">成语检索</span></a></li>
                            <li class="am-nav-header">古诗学习</li>
                            <li><a href="${pageContext.request.contextPath}/front/module/getGushiAll">古诗朗读<span class="am-nav-en">古诗朗读</span></a></li>
                            <li class="am-nav-header">通告</li>
                            <li><a href="${pageContext.request.contextPath}/front/getMessAll?type=0">近期通告<span class="am-nav-en">近期通告</span></a></li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
        <!--左侧菜单栏end-->

</body>
</html>
