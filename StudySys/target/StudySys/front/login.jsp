<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>嘟嘟登录</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css"/>

    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>

    <script type="text/javascript">
        var localObj = window.location;
        var protocol = location.protocol;
        var host = localObj.host;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = protocol +"//"+host+"/"+contextPath;

        function flushcode() {
            $("#mykaptcha").attr("src","../kaptcha?"+new Date().getTime());
        }

        function goregist() {
            window.open(basePath+"/front/register.jsp");
        }

        function login() {
            var uname = $("#user_name").val();
            var pwd = $("#user_pwd").val();
            var valicode = $("#valicode").val();
            var jsoninf = {"user":{"uname":uname,"pwd":pwd},"valicode":valicode};
            if(uname=="" || pwd==""){
                alert("用户名密码不能为空");
                return;
            }
            if(valicode==""){
                alert("请输入验证码");
                return;
            }
            $.ajax({
                type:"post",
                url:basePath+"/login",
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify(jsoninf),
                success:function (data) {
                    if(data=="code error"){
                        alert("验证码有误，请重新输入");
                        flushcode();
                    }else if(data=="fail"){
                        alert("用户名密码有误");
                        flushcode();
                    }else if(data=="banaccount"){
                        alert("恭喜你，你的号被封了:)");
                        flushcode();
                    }else if(data=="adminlogin"){
                        location=basePath+'/admin/index.jsp';
                    }else if(data=="success"){
                        alert("登录成功");
                        location=basePath+'/front/index.jsp';
                    }
                }
            })
        }
    </script>
</head>

<body>
<div style="width:100%;height:100%;">
    <div class="back-home" style="margin-top:40px;margin-left:80px;">
        <a href="index.jsp" class="link-btn">《返回首页</a>
    </div>

    <div class="">

    </div>

    <div class="auth-form-body mt-3" style="width:308px;height:287px;margin-left:40%;">
        <div align="center">
            <label for="user_name">Username or email address</label>
            <input type="text" id="user_name" class="form-control input-block" tabindex="1" autofocus="autofocus">
            <label for="user_pwd">Password</label>
            <input type="password" id="user_pwd" class="form-control form-control input-block">
            <input type="text" placeholder="验证码" id="valicode" style="width: 126px;margin-right: 5px;display:inline;"
                   class="form-control form-control input-block">
            <img src="../kaptcha" onclick="flushcode()" id="mykaptcha" style="border: 0;padding: 0px;margin-bottom:9px" class="form-control verify-image" width="130" height="40" title="看不清，换一张">
            <input type="button" onclick="login()" value="Sign in" tabindex="3" class="btn btn-primary btn-block">
            <input type="button" onclick="goregist()" value="Register" style="margin-top:20px;" tabindex="3"
                   class="btn btn-primary btn-block">
        </div>
    </div>

</div>

</body>
</html>
