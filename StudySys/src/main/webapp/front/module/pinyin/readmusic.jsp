<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>读音学习</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
</head>
<body>
    <jsp:include page="/front/topandleft.jsp"></jsp:include>

    <!--右侧 主界面-->
        <div class="col-md-9 am-u-md-9 doc-content">
            <h1 id="web-zu-jian">拼音》读音学习</h1>
            <hr>
            <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
                    height="582" hspace="10" title="汉语拼音字母表" vspace="10" width="629">
                <param name="quality" value="high">
                <param name="movie" value="http://www.hanyupinyin.cn/swf/biao/pinyinbiao_03.swf">
                <embed height="582" hspace="10" pluginspage="http://www.macromedia.com/go/getflashplayer" quality="high"
                       src="http://www.hanyupinyin.cn/swf/biao/pinyinbiao_03.swf" title="汉语拼音字母表"
                       type="application/x-shockwave-flash" vspace="10" width="629">
            </object>

        </div>
    </div>
    </section>
</body>
</html>
