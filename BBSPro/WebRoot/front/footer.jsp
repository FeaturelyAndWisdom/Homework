<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'footer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
  </head>
  
  <body>
  <div class="footer1">
  <div class="footer2">
    <div class="link f1">
    	<select name="select" size="1"  class="select" onchange="javascript:window.open(this.options
[this.selectedIndex].value);this.selectedIndex=0">
     				 <option selected="selected">======友情链接======</option>
					 <option value="http://web.cup.edu.cn/">中国石油大学(北京)</option>
					 <option value="http://www.upc.edu.cn/">中国石油大学(华东)</option>
					 <option value="http://www.dqpi.edu.cn/">东北石油大学</option>
					 <option value="http://www.swpi.edu.cn/">西南石油大学</option>
					 <option value="http://www.cnpc.com.cn/cn/">中国石油天然气集团公司</option>
					 <option value="http://www.sinopec.com/">中国石油化工股份有限公司</option>
					 <option value="http://www.cnooc.com.cn/">中国海洋石油总公司</option>
					 <option value="http://www.sinochem.com/">中国中化集团公司</option>
					 <option value="http://www.ishaanxi.com/">陕西网</option>
					 <option value="http://www.xiancity.cn/">西安网</option>				  
	  </select>
         <select name="select" size="1" class="select" onchange="javascript:window.open(this.options
[this.selectedIndex].value);this.selectedIndex=0">
       <option selected="selected">======管理机构======</option>
					  <option value="http://dzb.xsyu.edu.cn/index.html">党政办公室</option>
					  <option value="http://jw.xsyu.edu.cn/">纪委、监察处</option>
					  <option value="http://djzx.xsyu.edu.cn/index.html">组织部</option>
					  <option value="http://xcb.xsyu.edu.cn/">宣传部</option>
                                          <option value="http://tzb.xsyu.edu.cn/">统战部</option>
					  <option value="http://xsgzc.xsyu.edu.cn/index.html">学生工作部</option>
					  <option value="http://jyzd.xsyu.edu.cn/index.html">&nbsp;&nbsp;&nbsp;&nbsp;|----就业指导中心</option>
					  <option value="http://bwch.xsyu.edu.cn/default.aspx">保卫部</option>
					  <option value="http://jwch.xsyu.edu.cn/index.html">教务处</option>
					  <option value="http://yjs.xsyu.edu.cn/">研究生院</option>
                                          <option value="http://gpzx.xsyu.edu.cn/">高教研究与评估中心</option>
					  <option value="http://kjc.xsyu.edu.cn/index.html">科技处</option>
					  <option value="http://hzfzc.xsyu.edu.cn/">合作发展处</option>
                                          <option value="http://gjjl.xsyu.edu.cn:8112/">国际交流与合作处</option>

					  <option value="http://rsch.xsyu.edu.cn/index.html">人事处</option>
					  <option value="http://cwc.xsyu.edu.cn/">财务处</option>
					  <option value="http://gzch.xsyu.edu.cn/">国有资产处</option>
					  <option value="http://ztb.xsyu.edu.cn/index.html">&nbsp;&nbsp;&nbsp;&nbsp;|----招投标办公室</option>
					  <option value="http://sysglc.xsyu.edu.cn/index.html">实验室管理处</option>
					  <option value="http://zjzx.xsyu.edu.cn">&nbsp;&nbsp;&nbsp;&nbsp;|----质检中心</option>
                                          <option value="http://zcjyc.xsyu.edu.cn/">资产经营处</option>
					  <option value="http://jjc.xsyu.edu.cn/index.html">基建处</option>
					  <option value="http://sjc.xsyu.edu.cn/index.html">审计处</option>
                                          <option value="http://ltc.xsyu.edu.cn/">离退休职工管理处</option>
					  <option value="http://xxqgwh.xsyu.edu.cn/index.html">鄠邑校区管理办公室</option>
					  <option value="http://gh.xsyu.edu.cn/index.html">工会</option>
					  <option value="http://tuanwei.xsyu.edu.cn/">团委</option>
					  <option value="http://lib.xsyu.edu.cn/">图书馆</option>
                                          <option value="http://archives.xsyu.edu.cn/">档案馆</option>
					  <option value="http://qkzx.xsyu.edu.cn/">期刊中心</option> 
					  <option value="http://xxzx.xsyu.edu.cn/index.html">信息中心</option>
					  <option value="http://hq.xsyu.edu.cn/">后勤管理处</option>
					  <option value="http://yey.xsyu.edu.cn/">&nbsp;&nbsp;&nbsp;&nbsp;|----幼儿园</option>
					  <option value="http://xyy.xsyu.edu.cn/index.html">校医院</option>
	  </select>
                 <select name="select" size="1" class="select" onchange="javascript:window.open(this.options
[this.selectedIndex].value);this.selectedIndex=0">  
	  <option selected="selected">=======院系设置=======</option>
					  <option value="http://sygc.xsyu.edu.cn/">石油工程学院</option>
					  <option value="http://zygc.xsyu.edu.cn/">地球科学与工程学院</option>
					  <option value="http://dzgc.xsyu.edu.cn/index.html">电子工程学院</option>
					  <option value="http://jxgcxy.xsyu.edu.cn/index.html">机械工程学院</option>
					  <option value="http://clkx.xsyu.edu.cn/index.html">材料科学与工程学院</option>
					  <option value="http://jsjxy.xsyu.edu.cn/index.html">计算机学院</option>
					  <option value="http://hxhg.xsyu.edu.cn/">化学化工学院</option>
					  <option value="http://lxy.xsyu.edu.cn/index.html">理学院</option>
					  <option value="http://jjglxy.xsyu.edu.cn/index.html">经济管理学院</option>
					  <option value="http://rwxy.xsyu.edu.cn/index.html">人文学院</option>
					  <option value="http://wyx.xsyu.edu.cn/index.html">外国语学院</option>
					  <option value="http://jxjy.xsyu.edu.cn/">继续教育学院(职业技术学院)</option>
					  <option value="http://cie.xsyu.edu.cn:8111/">国际教育学院</option>
					  <option value="http://szb.xsyu.edu.cn/index.html">马克思主义学院</option>
					  <option value="http://yyx.xsyu.edu.cn/">音乐系</option>
					  <option value="http://tyx.xsyu.edu.cn/">体育系</option> 
    </select>
    </div>
    <div class="wsbg">
      <div class="line"></div>
      <img src="img/fwmh.gif" />
      <a href="http://my.xsyu.edu.cn/" target="_blank" style="padding-left:5px; ">服务门户</a>
      <img src="img/jwgl.gif"/>
      <a href="http://jwxt.xsyu.edu.cn/eams/login.action" target="_blank">教务管理</a>
      <img src="img/cwcx.gif" />
      <a href="http://cwcx.xsyu.edu.cn/zhcx50/default.aspx" target="_blank">财务查询</a>
      <img src="img/bggl.gif" />
      <a href="http://oa.xsyu.edu.cn" target="_blank">办公管理</a>
      <img src="img/qkbg.gif" />
      <a href="http://qkzx.xsyu.edu.cn" target="_blank">期刊办公</a>
    </div>
  </div>
</div>
  </body>
</html>
