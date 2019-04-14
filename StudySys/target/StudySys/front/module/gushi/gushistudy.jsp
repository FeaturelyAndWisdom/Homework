<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chenxid
  Date: 2019/4/7
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>古诗朗读</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/messagelst.css"/>
    
    <script>
        var localObj = window.location;
        var protocol = location.protocol;
        var host = localObj.host;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = protocol +"//"+host+"/"+contextPath;
        
        function findDetail(gid) {
            $.ajax({
                type:'get',
                url:basePath+'/front/module/getGushiByGid?gid='+gid,
                success:function (data) {
                    $("#detail").css("display","");
                    $("#gushilist").css("display","none");
                    $("#title").text(data.title);
                    $("#author").text(data.author);
                    for(var i=0;i<data.wlines.length;i++){
                        var pytemp = '<tr>';
                        var pys = data.pys[i][0].split(" ");
                        for(var j=0;j<pys.length;j++){
                            pytemp+="<td align='center' width='"+(1/pys.length)*100+"%'>"+pys[j]+"</td>"
                        }
                        pytemp+="</tr>";
                        var wdtemp = '<tr>';
                        var words = data.wlines[i]
                        for(var j=0;j<pys.length;j++){
                            wdtemp+="<td align='center' width='"+(1/words.length)*100+"%'>"+words[j]+"</td>"
                        }
                        wdtemp+="</tr>";
                        $("#gsmain").append(pytemp+wdtemp);
                    }
                }
            })
        }
    </script>
    <style type="text/css">
        td{
            font-size: 25px;
        }
    </style>
</head>
<body>
<jsp:include page="/front/topandleft.jsp"></jsp:include>
<div class="col-md-9 am-u-md-9 doc-content">
    <h1 id="web-zu-jian">古诗》古诗朗读</h1>
    <hr>
    <div id="divNotice" class="bulletin-board clearfix" style="width: 720px;">
        <div id="divnotice1238" class="singleton">
            <div id="gushilist">
            <h2>古诗列表</h2>
            <ul class="articlelist clearfix">
                <c:forEach items="${requestScope.gslst}" var="gs">
                    <c:if test="${gs.isdel==0}">
                    <li>
                        <a class="inform" href="javascript:;" onclick="findDetail(${gs.gid})" title="${gs.title}">${gs.title}</a>
                        <span>${gs.author}</span>
                    </li>
                    </c:if>
                </c:forEach>
            </ul>
            </div>
            <script>
                function back() {
                    $("#detail").css("display","none");
                    $("#gushilist").css("display","");
                    $("#gsmain").html("");
                }
            </script>
            <div id="detail" style="display: none;">
                <a href="javascript:;" onclick="back()" style="font-size: 19px"><<返回</a>
                <br><br>
                <div id="title" align="center" style="font-size: 25px;"></div>
                <div id="author" align="center"></div>
                <table id="gsmain" align="center" style="font-size: 7px;">
                </table>
            </div>
        </div>
    </div>
</div>
</div>
</section>
</body>
</html>
