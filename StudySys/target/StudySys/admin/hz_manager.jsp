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
    <title>汉字管理</title>
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

        function deleteknow(kid) {
            $.ajax({
                type:'get',
                url:basePath+'/admin/removeKnow?kid='+kid,
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
        $("#hzlst").css("display","none");
        $("#addshow").css("display","");
    }
    function backlst() {
        $("#hzlst").css("display","");
        $("#addshow").css("display","none");
    }

    function showpy() {
        getPinyin();
    }

    function submitinfo() {
        var hz = $("#inputhz").val();
        var py = $("#inputpy").val();
        if(hz==""){
            alert("汉字内容不能为空");
            return;
        }
        var jsoninf = {"word":hz,"pinyin":py,"type":0};
        $.ajax({
            type:'post',
            url:basePath+'/admin/addKnow',
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
        var value = document.getElementById('inputhz').value;
        var result = '';
        if(value)
        {
            result = pinyinUtil.getPinyin(value, ' ', null, null)
        }
        document.getElementById('inputpy').value = result;
    }
</script>
<table align="center" id="addshow" width="450px" style="display: none">
    <tr>
        <td align="left">
            <a href="javascript:;" style="font-size: 20px" onclick="backlst()">返回</a>
        </td>
    </tr>
    <tr>
        <td align="center" style="width:50%">汉字：</td>
        <td align="center" style="width:50%">
            <input type="text" placeholder="请输入要添加的汉字" onchange="showpy()" style="width:200px;height: 35px;" id="inputhz">
        </td>
    </tr>
    <tr>
        <td align="center">拼音：</td>
        <td align="center">
            <input type="text" readonly="readonly" style="width:200px;height: 35px;" id="inputpy">
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center"><input type="button" value="提交" style="width: 100px;height: 30px" onclick="submitinfo()"></td>
    </tr>
</table>
<div id="hzlst">
<input type="button" value="添加新汉字" onclick="additem()" style="width: 150px;height: 30px;float: right;margin-bottom: 20px">
<table border="1" cellspacing="3" align="center" width="750px">
    <thead>
        <tr>
            <td width="15%" align="center">编号</td>
            <td width="25%" align="center">内容</td>
            <td width="25%" align="center">拼音</td>
            <td width="25%" align="center">创建时间</td>
            <td widtd="10%" align="center">操作</td>
        </tr>
    </thead>
    <c:forEach items="${requestScope.knowlist}" var="hz">
        <tr>
            <td align="center">${hz.kid}</td>
            <td align="center">${hz.word}</td>
            <td align="center">${hz.pinyin}</td>
            <td align="center"><fmt:formatDate value="${hz.createtime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
            <td align="center">
                <c:if test="${hz.isdel==0}">
                    <a href="javascript:;" onclick="deleteknow(${hz.kid})">删除</a>
                </c:if>
                <c:if test="${hz.isdel==1}">
                    已删除
                </c:if>
            </td align="center">
        </tr>
    </c:forEach>

</table>
</div>
</body>
</html>
