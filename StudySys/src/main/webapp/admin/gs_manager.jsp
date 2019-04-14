<%--
  Created by IntelliJ IDEA.
  User: chenxid
  Date: 2019/4/13
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>古诗管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amaze_min_v.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/messagelst.css"/>
    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <script>
        var localObj = window.location;
        var protocol = location.protocol;
        var host = localObj.host;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = protocol +"//"+host+"/"+contextPath;

        function deleteknow(gid) {
            $.ajax({
                type:'get',
                url:basePath+'/admin/removeGushi?gid='+gid,
                success:function (data) {
                    if(data=="fail"){
                        alert("操作失败，请稍后再试");
                    }else if(data=="success"){
                        alert("操作成功");
                        history.go(0);
                    }
                }
            })
        }
    </script>
    <style>
        tr{
            height: 45px;
        }
        thead td{
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="topandleft.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pinyin_dict_withtone.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pinyinUtil.js"></script>
<script>
    function additem() {
        $("#gslst").css("display","none");
        $("#addshow").css("display","");
    }
    function backlst() {
        $("#gslst").css("display","");
        $("#addshow").css("display","none");
    }

    function showpy() {
        getPinyin();
    }

    function submitinfo() {
        var word = $("#word").val();
        var pinyin = $("#pinyin").val();
        var title = $("#title").val();
        var author = $("#author").val();
        if(title==""){
            alert("标题不能为空");
            return;
        }
        if(author==""){
            alert("作者不能为空");
            return;
        }
        if(word==""){
            alert("内容不能为空");
            return;
        }
        var jsoninf = {"title":title,"author":author,"word":word,"pinyin":pinyin};
        $.ajax({
            type:'post',
            url:basePath+'/admin/addGushi',
            contentType:'application/json;charset=utf-8',
            data:JSON.stringify(jsoninf),
            success:function (data) {
                if(data=="fail"){
                    alert("操作失败，请稍后再试");
                }else if(data=="success"){
                    alert("操作成功");
                    history.go(0);
                }
            }

        })
    }

    function getPinyin()
    {
        var value = document.getElementById('word').value;
        var result = '';
        if(value)
        {
            result = pinyinUtil.getPinyin(value, ' ', null, null);
            var temp = result.split("\n");
            for(var i=0;i<temp.length;i++){
                temp[i] = temp[i].trim();
            }
            result = temp.join("\r\n");
        }
        document.getElementById('pinyin').value = result;
    }
</script>
<table align="center" id="addshow" width="450px" style="display: none">
    <tr>
        <td align="left">
            <a href="javascript:;" style="font-size: 20px" onclick="backlst()">返回</a>
        </td>
    </tr>
    <tr>
        <td align="center" style="width:50%">标题：</td>
        <td align="center" style="width:50%">
            <input type="text" placeholder="请输入标题" style="width:300px;height: 35px;" id="title">
        </td>
    </tr>
    <tr>
        <td align="center" style="width:50%">作者：</td>
        <td align="center" style="width:50%">
            <input type="text" placeholder="请输入作者" style="width:300px;height: 35px;" id="author">
        </td>
    </tr>
    <tr>
        <td align="center" style="width:50%">内容：</td>
        <td align="center" style="width:50%">
            <textarea id="word" style="width: 300px;height: 150px;resize:none" onchange="showpy()"></textarea>
        </td>
    </tr>
    <tr>
        <td align="center">拼音：</td>
        <td align="center">
            <textarea id="pinyin" style="width: 300px;height: 150px;resize:none"></textarea>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center"><input type="button" value="提交" style="width: 100px;height: 30px" onclick="submitinfo()"></td>
    </tr>
</table>
<div id="gslst">
<input type="button" value="添加新古诗" onclick="additem()" style="width: 150px;height: 30px;float: right;margin-bottom: 20px">
<table border="1" cellspacing="3" align="center" width="750px">
    <thead>
        <tr>
            <td width="10%" align="center">编号</td>
            <td width="25%" align="center">标题</td>
            <td width="30%" align="center">内容</td>
            <td width="25%" align="center">创建时间</td>
            <td widtd="10%" align="center">操作</td>
        </tr>
    </thead>
    <c:forEach items="${requestScope.gslist}" var="gs">
        <tr>
            <td align="center">${gs.gid}</td>
            <td align="center">${gs.title}</td>
            <td align="center">
                ${fn:substring(gs.word,0 ,13)}.....
            </td>
            <td align="center"><fmt:formatDate value="${gs.createtime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
            <td align="center">
                <c:if test="${gs.isdel==0}">
                    <a href="javascript:;" onclick="deleteknow(${gs.gid})">删除</a>
                </c:if>
                <c:if test="${gs.isdel==1}">
                    已删除
                </c:if>
            </td align="center">
        </tr>
    </c:forEach>

</table>
</div>
</body>
</html>
