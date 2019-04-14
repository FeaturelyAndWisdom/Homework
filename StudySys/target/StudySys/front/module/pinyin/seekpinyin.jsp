<%--
  Created by IntelliJ IDEA.
  User: chenxid
  Date: 2019/4/7
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>拼音检索</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <script type="text/javascript">
        var localObj = window.location;
        var protocol = location.protocol;
        var host = localObj.host;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = protocol +"//"+host+"/"+contextPath;

        function seek() {
            $("#result").text("loading...................");
            var word = $("#research_word").val();
            $.ajax({
                type:'get',
                url:basePath+'/findByword?word='+word,
                success:function (data) {
                    if(data.error_code==0){
                        var res_data = data.result;
                        var resstr='';
                        resstr+='简介：\n';
                        for(var i=0;i<res_data.jijie.length;i++){
                            var temp = res_data.jijie[i];
                            if(temp=="") continue;
                            resstr+="\t"+temp+"\n";
                        }
                        resstr+='\n\n';
                        resstr+='详解：\n';
                        for(var i=0;i<res_data.xiangjie.length;i++){
                            var temp = res_data.xiangjie[i];
                            if(temp=="") continue;
                            resstr+="\t"+temp+"\n";
                        }
                        $("#result").text(resstr);
                    }else{
                        $("#result").text("输入有误，请检查后重新输入");
                    }
                }
            })
        }
    </script>
</head>
<body>
<jsp:include page="/front/topandleft.jsp"></jsp:include>
<div class="col-md-9 am-u-md-9 doc-content">
    <h1 id="web-zu-jian">拼音》拼音检索</h1>
    <hr>
    <label for="research_word">请输入需要检索的汉字：</label>
    <input id="research_word" style="width: 150px;height: 30px; margin-right: 10px;" value="">
    <input id="research" type="button" onclick="seek()" style="width: 60px;height: 30px;" value="检索"> <br>
    <hr>
    <textarea id="result" readonly="readonly" style="width: 630px;height: 300px;resize:none;"></textarea>
</div>
</div>
</section>
</body>
</html>
