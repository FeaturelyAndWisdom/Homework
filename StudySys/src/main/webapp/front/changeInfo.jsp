<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改个人信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/changeInf.css"/>
    <style type="text/css">
        .main {
            float: left;
            margin-top: 5%;
            margin-left: 15%;
            color: #FFF;
        }
        .user-pic {
            display: block;
            float: left;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            cursor:pointer;
        }
        .link-btn{
            margin: 0;
            padding: 0 0 0 14px;
            font-size: 16px;
            color: #FFF;
            position: relative;
            text-decoration:none;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" >
        var icon = [];

        var localObj = window.location;
        var protocol = location.protocol;
        var host = localObj.host;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = protocol +"//"+host+"/"+contextPath;

        function changePwd() {
            $("#mainTab").css("display","none");
            $("#pwdTab").css("display","");
        }

        function changeInf() {
            $("#initBtn").css("display","none");
            $("#subBtn").css("display","");
            $("#address").attr("readonly",false);
            $("#icon").attr("onclick","$('#changeIcon').click()");
        }

        function backInit() {
            $("#address").attr("readonly",true);
            $("#icon").attr("onclick","");
            $("#initBtn").css("display","");
            $("#subBtn").css("display","none");
            $("#mainTab").css("display","");
            $("#pwdTab").css("display","none");
        }

        function addimg(file) {
            if(icon.length>0) icon.pop();
            if (!file.files || !file.files[0]) {
                alert("请导入文件");
                return;
            }
            var f = file.files[0];
            var fileName = f.name;
            var pos = fileName.lastIndexOf(".");
            var lastName = fileName.substring(pos, fileName.length);
            if((lastName.toLowerCase() != ".jpg") && (lastName.toLowerCase() != ".png")){
                alert("请导入图片文件");
                return;
            }
            var img = new File([f],new Date().getTime() + "_pic" + lastName,{type:f.type});
            icon.push(img);
            var reader = new FileReader();
            reader.onload = function (evt) {
                $("#icon").attr("src",evt.target.result);
            }
            reader.readAsDataURL(file.files[0]);
        }

        function subChangePwd() {
            var answer = $("#answer").val();
            var oldpwd = $("#oldpwd").val();
            var newpwd = $("#newpwd").val();
            var reppwd = $("#reppwd").val();
            var uid = $("#uid").val();
            if(answer==""){
                alert("密保答案不能为空");
                return;
            }
            if(oldpwd==""){
                alert("原密码不能为空");
                return;
            }
            if(newpwd==""){
                alert("新密码不能为空");
                return;
            }
            if(reppwd!=newpwd){
                alert("密码不一致");
                return;
            }
            var jsonInf = {"user":{"uid":uid,"pwd":newpwd},"tempanswer":answer,"oldpwd":oldpwd};
            $.ajax({
                type:'post',
                url:basePath+'/changePwd',
                contentType:'application/json;charset=utf-8',
                data:JSON.stringify(jsonInf),
                success:function(data){
                    if(data=="answer error"){
                        alert("密保答案错误，修改密码失败");
                    }else if(data=="pwd error"){
                        alert("原密码错误，修改密码失败");
                    }else if(data=="fail"){
                        alert("修改密码失败，请稍后再试");
                    }else if(data=="success"){
                        alert("修改密码成功，再次登录生效");
                        location=basePath+'/front/index.jsp';
                    }
                }
            })
        }

        function submitInfo(){
            var formData = new FormData();
            if(icon.length>0){
                var f = icon[0];
                var lastName = f.name.substring(f.name.lastIndexOf("."), f.name.length);
                var img = new File([f],new Date().getTime() + "_icon" + lastName,{type:f.type});
                formData.append('icon',img, img.name);
            }
            var add = $("#address").val();
            if(add==""){
                alert("住址信息不能为空");
                return;
            }
            formData.append("address",add);
            $.ajax({
                type:'post',
                url:basePath+'/changeInfo',
                cache: false,
                processData: false,
                contentType: false,
                data:formData,
                success:function (data) {
                    if(data=="fail"){
                        alert("更改失败，请稍后再试");
                    }else if(data=="success"){
                        alert("更新成功");
                        history.go(0);
                    }
                }
            })
        }
    </script>
</head>

<body>
<div class="back-home" style="margin-top:40px;margin-left:80px;">
    <a href="index.jsp" class="link-btn">《返回首页</a>
</div>
<div class="main">
    <input type="hidden" value="${sessionScope.user.uid}" id="uid"/>
    <table cellpadding="10px" id="mainTab" style="">
        <tr>
            <td width="30%">
                <label for="icon">头像：</label>
            </td>
            <td width="70%">
                <input type="file" multiple="multiple" style="display: none" id="changeIcon" accept="image/jpg, image/jpeg, image/png" onchange="addimg(this)">
                <img id="icon" src="${pageContext.request.contextPath}/usericon/${sessionScope.user.uimg}" class="user-pic">
            </td>
        </tr>
        <tr>
            <td>
                <label for="uname">用户名：</label>
            </td>
            <td>
                <input id="uname" readonly="readonly" value="${sessionScope.user.uname}" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td>
                <label for="birthday">生日：</label>
            </td>
            <td>
                <input id="birthday" readonly="readonly" value="<fmt:formatDate value="${sessionScope.user.birthday}" pattern="yyyy-MM-dd" />" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td>
                <label for="address">住址：</label>
            </td>
            <td>
                <input id="address" readonly="readonly" value="${sessionScope.user.address}" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td>
                <label for="question1">密保问题：</label>
            </td>
            <td>
                <input id="question1" readonly="readonly" value="${sessionScope.user.question}" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td>
                <label for="createtime">创建时间：</label>
            </td>
            <td>
                <input id="createtime" readonly="readonly" value="<fmt:formatDate value="${sessionScope.user.createtime}" pattern="yyyy-MM-dd" />" class="form-control input-block">
            </td>
        </tr>
        <tr id="initBtn">
            <td colspan="2" align="center">
                <input type="button" style="margin-top:20px;width: 100%" onclick="changePwd()" class="btn btn-primary btn-block" value="修改密码"/>
                <input type="button" style="margin-top:20px;width: 100%" onclick="changeInf()" class="btn btn-primary btn-block" value="修改信息"/>
                <br/>
                <font color="#a52a2a" size="2px">修改信息仅可以修改住址与头像信息</font>
            </td>
        </tr>
        <tr id="subBtn" style="display: none;">
            <td colspan="2">
                <input type="button" style="margin-top:20px;width: 100%" onclick="submitInfo()" class="btn btn-primary btn-block" value="提交更改"/>
                <input type="button" style="margin-top:20px;width: 100%" onclick="backInit()" class="btn btn-primary btn-block" value="返回"/>
            </td>
        </tr>
    </table>

    <table cellpadding="10px" id="pwdTab" style="display: none;">
        <tr>
            <td>
                <label for="question">密保问题：</label>
            </td>
            <td>
                <input id="question" readonly="readonly" value="${sessionScope.user.question}" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td>
                <label for="answer">答案：</label>
            </td>
            <td>
                <input id="answer" value="" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td>
                <label for="oldpwd">旧密码：</label>
            </td>
            <td>
                <input id="oldpwd" type="password" value="" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td>
                <label for="newpwd">新密码：</label>
            </td>
            <td>
                <input id="newpwd" type="password" value="" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td>
                <label for="reppwd">重复密码：</label>
            </td>
            <td>
                <input id="reppwd" type="password" value="" class="form-control input-block">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" style="margin-top:20px;" onclick="subChangePwd()" class="btn btn-primary btn-block" value="提交修改"/>
                <input type="button" style="margin-top:20px;" onclick="backInit()" class="btn btn-primary btn-block" value="返回"/>
            </td>
        </tr>
    </table>

</div>
</body>
</html>
