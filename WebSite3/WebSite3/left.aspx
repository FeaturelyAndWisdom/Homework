<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理系统</title>
<link href="css2/home.css" rel="stylesheet" type="text/css" />
<link href="css2/beangle-ui,colorbox,chosen.css" rel="stylesheet" type="text/css" />
<link href="css2/WdatePicker.css" rel="stylesheet" type="text/css" />
<link href="css2/foundation.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script>
	$(function(){
		$("#my").click(function(){
			$(this).toggleClass("first_menu");	
			$(this).toggleClass("first_menu active");	
			if($("#myul").css('display')=='none'){
				$("#myul").css('display','block');				
			}else{
				$("#myul").css('display','none');
			}
		})
		
	});
</script>
</head>

<body>
<!--Head-->
<div style="float: left;margin-left:15px;width:30%">
	<img src="images/home/logo2.png" height="58px">
</div>

<div class="banner">
	<div>
		<div class="banner_area">
			<table cellpadding="0" cellspacing="0"  class="button_box_1">
				<tr>
					<td width="25"></td>
					<td width="90">
						<a href="#" class="a3" onclick="editAccount()">我的账户</a>&nbsp;&nbsp;
					</td>
					<td width="90">
						<a href="#" onclick="return bg.Go(this,'main')" class="a3">返回首页</a>&nbsp;&nbsp;
					</td>
					<td>
						<a href="#" target="_top" class="a3">退出</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="banner_area">
<form id="form11754836551" name="form11754836551" action="/eams/home.action" method="post"  >

          <a href="#" target="_blank" title="查看详情" style="color:#ffffff">杜晨曦(201507060213)</a>&nbsp;&nbsp;
            <span style="padding:0 2px;color:#FFF;font-weight:blod;">学生</span>

</form>
		</div>
	</div>
	<br><br>
	<div style="float:right;display:block;clear:both;">
		<ul class="nav_box" id="nav_box">
		</ul>
	</div>
</div>
<!--  End Head -->


<table id="mainTable" style="width:100%;height:95%;clear:both;float:left;" >
	<tr>
	   <td width="162" valign="top" id="leftTD" style="height:100%;width:10%">
			<div id="menu_panel" class="ajax_container">
            <ul class="menu collapsible">
     
     <li style="margin:0px;" class="expand"> 
     <a class="first_menu" id="my" href="#">我的</a>
     <ul id="myul" class="acitem" style="display: none;">
     <div class="scroll_box">
       			<li><a href="#" class="p_1">学籍信息</a></li>
       			<li><a href="#" class="p_1">培养计划</a></li>
       			<li><a href="#" class="p_1">计划完成情况</a></li>
       			<li><a href="#" class="p_1">我的预警</a></li>
       			<li><a href="#" class="p_1">我的课表</a></li>
       			<li><a href="#" class="p_1">大类分流申请</a></li>
       			<li><a href="#" class="p_1">选课</a></li>
       			<li><a href="#" class="p_1">我的考试</a></li>
       			<li><a href="#" class="p_1">我的成绩</a></li>
       			<li><a href="#" class="p_1">四六级考试</a></li>
       			<li><a href="#" class="p_1">毕业论文</a></li>
       			<li><a href="#" class="p_1">论文选题</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu" href="#">量化评教</a>
     <ul class="acitem" style="display: block;">
     <div class="scroll_box">
       			<li><a href="#" class="p_1">量化评教</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu" href="#">实践</a>
     <ul class="acitem" style="display: block;">
     <div class="scroll_box">
       			<li><a href="#" class="p_1">创业项目申报</a></li>
       			<li><a href="#" class="p_1">我的创业项目</a></li>
       			<li><a href="#" class="p_1">我的竞赛</a></li>
       			<li><a href="#" class="p_1">我的实习</a></li>
       			<li><a href="#" class="p_1">实习考核</a></li>
       </div></ul></li>
     <li>
     <a class="first_menu" href="#">公共服务</a>
     <ul class="acitem" style="display: block;"><div class="scroll_box">
       			<li><a href="#" class="p_1">空闲教室查看</a></li>
       			<li><a href="#" class="p_1">全校开课查询</a></li>
       			<li><a href="#" class="p_1">站内消息</a></li>
       			<li><a href="#" class="p_1">第三方授权管理</a></li>
       			<li><a href="#" class="p_1">课表打印</a></li>
  </div></ul></li>
</ul>
            </div>
		
	   </td>
	   
	   <td width="1460" valign="top" id="rightTD">
        <div id="main" class="ajax_container">
<div id="module4085360601" class="module expanded">
  <h2 class="header">
  <a href="#" class="toggle">欢迎信息</a>
  </h2>
  <div class="modulebody">
  	<table>
		<tbody><tr>
			<td valign="top" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊敬的<font color="red">杜晨曦</font>用户，欢迎使用西安石油大学教学管理系统,今天是2018年05月29号/星期二,农历日期:戊戌年(狗年),四月十五。</td>
		</tr>
		<tr>
			<td>本周为<font color="blue">2017-2018学年第2学期的</font>第<font color="red" size="5">13</font>教学周</td>
		</tr>
	</tbody></table>

  </div>
</div>

<div id="module4085360602" class="module expanded">
  <h2 class="header">
  <a href="#" class="toggle">系统公告</a>
  </h2>
  <div class="modulebody">
     <table style="font-size:10pt" width="90%">
   <tbody><tr>
	 <td width="50%">标题</td>
	 <td width="20%">发布时间</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">关于教务系统学生用户忘记密码重置的方法</a></td>
	<td>2017-04-12</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">关于2017年6月全国大学英语四六级考试补报名的紧急通知</a></td>
	<td>2017-03-13</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">关于缓考学生参加开学初补考的通知</a></td>
	<td>2017-01-20</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">关于教务管理系统学生账号绑定学校电子邮箱的通知</a></td>
	<td>2016-11-04</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">教务系统开通微信服务</a></td>
	<td>2016-10-17</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">新校区上课时间 （2016年执行）</a></td>
	<td>2016-10-12</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">2016—2017学年第一学期通识教育选修课将于10月10日—10月16日进行网上选课</a></td>
	<td>2016-10-10</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">补考成绩说明</a></td>
	<td>2016-09-26</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">成绩核对</a></td>
	<td>2016-09-22</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">请大家首次登录系统后及时修改个人密码和邮箱</a></td>
	<td>2016-09-12</td>
   </tr>
   <tr>
	<td><a style="color:blue" href="#" alt="查看详情">关于20152016学年第二学期课程(公共课程)补考安排的通知</a></td>
	<td>2016-09-06</td>
   </tr>
  </tbody></table>

  </div>
</div>

<div id="module4085360603" class="module expanded">
  <h2 class="header">
  <a href="#" class="toggle">下载</a>
  </h2>
  <div class="modulebody">
   <table style="font-size:10pt" width="90%">
   <tbody><tr>
	 <td width="80%">标题</td>
	 <td width="20%">发布时间</td>
   </tr>
   <tr>
   <td>
   &nbsp;<a href="#" target="_blank" style="color:blue">
   2016-12-07学生端毕业论文操作说明.pdf</a></td>
	<td>2017-01-04</td>
   </tr>
   <tr>
   <td>
   &nbsp;<a href="#" target="_blank" style="color:blue">
   关于2016-2017(1)通识教育选修课学生上课的通知.doc</a></td>
	<td>2016-10-20</td>
   </tr>
   <tr>
   <td>
   &nbsp;<a href="#" target="_blank" style="color:blue">
   关于2016-2017学年第一学期通识教育选修课网上选课的通知.doc</a></td>
	<td>2016-10-10</td>
   </tr>
   <tr>
   <td>
   &nbsp;<a href="#" target="_blank" style="color:blue">
   学生通识教育选修课选课操作流程.docx</a></td>
	<td>2016-10-10</td>
   </tr>
   <tr>
   <td>
   &nbsp;<a href="#" target="_blank" style="color:blue">
   学生用户说明书.pdf</a></td>
	<td>2016-04-25</td>
   </tr>
  </tbody></table>
  <a href="#">&nbsp;更多....</a>

  </div>
</div>

</div>
	   </td>
	</tr>
</table>


</body>
</html>
