<%--
  Created by IntelliJ IDEA.
  User: chenxid
  Date: 2019/4/7
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成语检索</title>

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
                url:basePath+'/findBychengyu?word='+word,
                success:function (data) {
                    if(data.error_code==0){
                        var res_data = data.result;
                        var resstr='';
                        resstr+='拼音：'+res_data.pinyin+'\n';
                        resstr+='成语解释：'+res_data.chengyujs+'\n';
                        resstr+='词语解释：'+res_data.ciyujs+'\n';
                        resstr+='造句：'+res_data.example+'\n';
                        resstr+='出处：'+res_data.from_+'\n';
                        resstr+='引证解释：'+res_data.yinzhengjs+'\n';
                        resstr+='语法：'+res_data.yufa+'\n';
                        var temp='';
                        for(var i=0;i<res_data.tongyi.length;i++){
                            temp+=res_data.tongyi[i]+'、';
                        }
                        resstr+='同义成语：'+temp+'\n';
                        for(var i=0,temp='';i<res_data.fanyi.length;i++){
                            temp+=res_data.fanyi[i]+'、';
                        }
                        resstr+='反义成语：'+temp+'\n';
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
    <h1 id="web-zu-jian">汉字》成语检索</h1>
    <hr>
    <label for="research_word">请输入需要检索的成语：</label>
    <input id="research_word" style="width: 150px;height: 30px; margin-right: 10px;" value="">
    <input id="research" type="button" onclick="seek()" style="width: 60px;height: 30px;" value="检索"> <br>
    <hr>
    <textarea id="result" readonly="readonly" style="width: 630px;height: 300px;resize:none;"></textarea>
</div>
</div>
</section>
</body>
</html>
