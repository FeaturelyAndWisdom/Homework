<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>嘟嘟注册</title>

    <script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
    <style type="text/css">
        body {
            background: url('../img/regist_bgm.jpg');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-attachment: fixed;
        }

        .tabsty {
            margin-left: 5%;
            margin-top: 10%;
        }

        .fontsty {
            color: #FFF;

        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css"/>

    <script type="text/javascript">
        var localObj = window.location;
        var protocol = location.protocol;
        var host = localObj.host;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = protocol +"//"+host+"/"+contextPath;

        $(function () {
            /*初始化出生日期组件  */
            var date=new Date();//创建日期对象
            var year=date.getFullYear();
            for(var i=year-100;i<=year;i++){
                $("#year").append("<option value=\""+i+"\">"+i+"</option>");
            }
            for(var i=1;i<=12;i++){
                $("#month").append("<option value=\""+i+"\">"+i+"</option>");
            }
            getDays($("#month").val(),$("#year").val());
        })

        function getDaysInMonth(month,year) { //年月对应的日数算法
            var days;
            if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                days = 31;
            } else if (month == 4 || month == 6 || month == 9 || month == 11) {
                days = 30; //固定30
            } else {
                if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) { //排除百年，每四年一闰；每四百年一闰；
                    days = 29; //闰年29
                } else {
                    days = 28; //平年28
                }
            }
            return days; //返回该年月的日数
        }

        function getDays(){
            var year = $("#year").val();
            var month = $("#month").val();
            var days = getDaysInMonth(month,year);
            $("#day").empty();
            for(var i=1;i<=days;i++){
                $("#day").append("<option value=\""+i+"\">"+i+"</option>");
            }
        }

        function register() {
            var uname = $("#regist_name").val();
            var pwd = $("#regist_pwd").val();
            var pwd2 = $("#repeat_pwd").val();
            var address = $("#regist_address").val();
            var birthday = $("#year").val()+$("#month").val()+$("#day").val()+"";
            var question = $("#regist_question").val();
            var answer = $("#regist_answer").val();
            if(uname==""){
                alert("用户名不能为空");
                return;
            }
            if(pwd==""){
                alert("密码不能为空");
                return;
            }
            if(pwd2!=pwd){
                alert("密码不一致");
                return;
            }
            if(address==""){
                alert("地址不能为空");
                return;
            }
            if(answer==""){
                alert("答案不能为空");
                return;
            }
            var datainf = {"uname":uname,"pwd":pwd,"address":address,"birthday":birthday,"question":question,"answer":answer};
            $.ajax({
                type:'post',
                url:basePath+'/register',
                contentType:'application/json;charset=utf-8',
                data:JSON.stringify(datainf),
                success:function (data) {
                    if(data=='uname repeat'){
                        alert("用户名已存在，请重新选择:)");
                    }else if(data=='fail'){
                        alert("注册失败，请稍后再试");
                    }else if(data=="success"){
                        alert("注册成功，已自动登录");
                        location=basePath+'/front/index.jsp';
                    }
                }
            })
        }
    </script>
</head>

<body>
<table class="tabsty">
    <tr>
        <td>
            <div class="fontsty">
                <table>
                    <tr>
                        <td>
                            用户名：
                        </td>
                        <td>
                            <input type="text" id="regist_name" class="form-control input-block" placeholder="用户名 将用于登录">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            密码：
                        </td>
                        <td>
                            <input id="regist_pwd" type="password" class="form-control input-block" placeholder="密码">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            确认密码：
                        </td>
                        <td>
                            <input id="repeat_pwd" type="password" class="form-control input-block" placeholder="重复密码">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            现住址：
                        </td>
                        <td>
                            <input id="regist_address" type="text" class="form-control input-block" placeholder="住址">
                        </td>
                    </tr>
                </table>

            </div>
        </td>

        <td width="58%"></td>

        <td>
            <div class="fontsty">
                <table>
                    <tr>
                        <td>
                            生日：
                        </td>
                        <td>
                            <select class="form-control input-block" id="year" onchange="getDays()" name="Year" style="width:75px;height: 30px;"></select>
                            <em>年</em>
                            <select class="form-control input-block" id="month" onchange="getDays()" name="Month" style="width:60px;height: 30px"></select>
                            <em>月</em>
                            <select class="form-control input-block" id="day" name="Date" style="width:60px;height: 30px"></select>
                            <em>日</em>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            密保问题
                        </td>
                    </tr>
                    <tr>
                        <td>
                            1、
                        </td>
                        <td>
                            <select class="form-control input-block" id="regist_question" style="width:210px;height:35px">
                                <option value="你的姓氏是什么？">你的姓氏是什么？</option>
                                <option value="你父亲的姓氏是什么？">你父亲的姓氏是什么？</option>
                                <option value="你母亲的姓氏是什么？">你母亲的姓氏是什么？</option>
                                <option value="你父亲的生日是多少号？">你父亲的生日是多少号？</option>
                                <option value="你母亲的生日是多少号？">你母亲的生日是多少号？</option>
                                <option value="你初恋是谁？">你初恋是谁？</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>答案：</td>
                        <td>
                            <input style="width:190px" id="regist_answer" class="form-control input-block" placeholder="密保答案">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="button" onclick="register()" value="注册" tabindex="3" class="btn btn-primary btn-block">
                        </td>
                    </tr>
                </table>

            </div>
        </td>
    </tr>
</table>

</body>
</html>
