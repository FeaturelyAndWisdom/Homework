<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <link id="beangle_theme_link" rel="stylesheet" href="css/beangle-ui.css" type="text/css"/>
</head>

<body>

<link rel="stylesheet" href="css/index.css" />

<div class="browser-hint">
	<h2>请使用IE8(或以上版本)、Firefox或Google Chrome浏览器访问本系统<br>否则可能影响功能使用</h2>
	<ul>
	<li>
			<a class="iexplorer" href="http://www.microsoft.com/windows/internet-explorer" target="_blank"></a>
		</li>
		<li>
			<a class="firefox" href="http://www.mozilla.com" target="_blank"></a>
		</li>
		<li>
			<a class="chrome" href="http://www.google.com/chrome" target="_blank"></a>
		</li>
	</ul>
</div>


		<div class="mainbody">
			<div style="height:15%"></div>
			<div class="smallBox">
				<div class="sb-content">
					<div class="logindiv">
<form id="loginForm" runat="server" name="loginForm" method="post" >

					<%--<input name="username" id="username" tabindex="1" type="text" class="leftList" value="请输入用户名" 
					    	onFocus="if(value=='请输入用户名') {value=''}" onBlur="if (value=='') {value='请输入用户名'}" style="color:gray;font-size:15px;"/>--%>
                    <asp:TextBox runat="server" name="username" id="username" tabindex="1" class="leftList" Text="请输入用户名" onFocus="if(value=='请输入用户名') {value=''}" onBlur="if (value=='') {value='请输入用户名'}" style="color:gray;font-size:15px;"></asp:TextBox>
				    <input id="passText" name="passText" type="text" tabindex="2" onfocus="changeTip(this);" value="请输入密码" class="rightList" style="color:gray;font-size:15px;"/>
				    <%--<input id="password" name="password" type="password" onBlur="changeTip(this);" placeholder="" value="" class="rightList" style="display: none;color:gray;font-size:15px;"/>--%>
                    <asp:TextBox type="password" runat="server" id="password" name="password" onBlur="changeTip(this);" placeholder="" value="" class="rightList" style="display: none;color:gray;font-size:15px;"></asp:TextBox>
					<input name="encodedPassword" type="hidden" value=""/>
<%--<input type="submit"  value="" onclick="bg.form.submit('loginForm',null,null,checkLogin);return false;" name="submitBtn" tabindex="3" class="logIn"/>--%>
                    <asp:Button runat="server" Text="" name="submitBtn" tabindex="3" class="logIn" OnClick="Login_Click"/>
					<div style="margin-top:50px">
                        <%if (Request["error"] == "1")
                            { %>
                        <div align="center">
                            <font size="+5" color="red">用户名密码错误</font>
                        </div>
                        <%} %>
						<span class="fl">
					    	1、教师账号为6位教职工代码，默认密码和账号一致； <br />
				        	2、学生账号为12位学号，默认密码为账号后6位； <br />
				       		温馨提示：当您第一次登录系统后，请主动修改密码。
					  	</span>
					  	<span class="fl" style="padding-left:150px;">
				    		<div style="text-align:center;color:red;font-size:15px;"><br></div>
					  	</span>
				  		<span class="fr" style="padding-right:50px">
				  			
					  		<div><a href="/eams/resetPassword.action">忘记密码?</a></div>
				      		<div>
					  	  		<input name="session_locale" id="local_zh" type="radio" tabindex="4" value="zh_CN" checked="checked"/><label for="local_zh">中文</label>
						  		<input name="session_locale" id="local_en" type="radio" tabindex="5" value="en_US"/><label for="local_en">ENGLISH</label>
					    	</div>
						</span>
					</div>

</form>
				    </div>
				</div>
			</div>
		</div>
		<div class="footer">
			<img src="/eams/static/css/img/icon1.png"> 系统管理员：029-81469762 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<img src="/eams/static/css/img/icon2.png"> 处长信箱：jwch@xsyu.edu.cn 
		</div>
		<div class="foot"> CopyRight 2015  西安石油大学 &nbsp;&nbsp; | &nbsp;&nbsp; 技术支持：上海树维信息科技有限公司 </div>
		
<script type="text/javascript">
	var form  = document.loginForm;

	function checkLogin(form){
		if(!form['username'].value || form['username'].value == '请输入用户名'){
			alert("请输入用户名");return false;
		}
		if(!form['password'].value){
			alert("密码不能为空");return false;
		}
    	form['password'].value = CryptoJS.SHA1('f5e6713f-2db8-4a82-b8d8-1a994c04711f-' + form['password'].value);
		return true;
	}
	
	function changeTip(th){
        var passText = document.getElementById('passText');
        var pass = document.getElementById('password');
        if(th.id == 'password'){
            if(th.value == '' || th.value.length == 0 ){
                passText.style.display='';
                pass.style.display='none';
            }
        }else{
            passText.style.display='none';
            pass.style.display='';
            pass.focus();
        }
    }
	
	if("zh".indexOf("en")!=-1){document.getElementById('local_en').checked=true;}
	var username=beangle.cookie.get("username");
	if(null!=username){ form['username'].value=username;}
	(function(){
		// 侦测登陆页面是否被嵌套了
		if(jQuery("body > div:not(.logindiv,.foot,.browser-hint,.footer,.mainbody)").length) {
			window.location = "/eams/login.action?v=1";
		}
	})();
</script>
</body>

</html>
