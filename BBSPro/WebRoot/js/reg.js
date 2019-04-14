function check(){
		var name = document.getElementById("name").value;
		var pwd = document.getElementById("pwd").value;
		var pwd2 = document.getElementById("pwd2").value;
		if(pwd!=pwd2){
			alert('两次输入密码不一致，重新输入');
			return;
		}
		var phone = document.getElementById("phone").value;
		var rname = document.getElementById("real_name").value;
		var sid = document.getElementById("sid").value;
		if(name=='' || pwd=='' || phone=='' || rname=='' || sid==''){
			alert('信息录入有误，请检查后重新注册');
			return;
		}
		document.getElementById("fm").submit();
	}