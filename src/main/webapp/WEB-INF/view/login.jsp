<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!doctype html>
<html lang="zh">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>后台登录中心</title>
<%@include file="common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login/styles.css">
</head>
<body>
<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>LarryMS管理系统</h1>
			<h2 class="loginh" >后台登录中心</h2>
			<img class="logimg" src="${pageContext.request.contextPath}/static/images/login/admin.png"></img>
			<form id="loginForm" class="form">
				<input type="text" id="userinput" name="username" placeholder="用户名">
				<input type="password" id="pwdinput" name="password" placeholder="密码">
				<input type="text" id="capinput" name="captcha" placeholder="验证码">
				<img class="logincap" src="../captcha.do" onclick="this.src='../captcha.do?d='+Math.random();"></img>
				<button id="login-button" onClick="login();return false;" >登陆</button>
			</form>
			<h5>© 2016-2017 Larry 版权所有 larrycms.com</h5>
		</div>
	</div>
</div>

<script>
	function login() {
		if($('#userinput').val() == ""){
			layer.tips("请填写用户名", '#userinput', {
				tipsMore : false,
				time: 1000
			});
			return ;
		}
		if($('#pwdinput').val() == ""){
			layer.tips("请填写密码", '#pwdinput', {
				tipsMore : false,
				time: 1000
			});
			return ;
		}
		if($('#capinput').val() == ""){
			layer.tips("请填写验证码", '#capinput', {
				tipsMore : false,
				time: 1000
			});
			return ;
		}
		
		$.ajax({
			type : "POST",
			url : "loginProcess.do",
			data : $('#loginForm').serialize(),
			success : function(data) {
				console.log(data);
				if (data.code == 200) {
					window.location.href = "index.do";
				} else {
					var id = "";
					if(data.message == "用户不存在")id = '#userinput';
					else if(data.message == "密码错误")id = '#pwdinput';
					else if(data.message == "验证码错误")id = '#capinput';
					else {
						alert(data.message);
						$(".logincap").click();
						return ;
					}
					layer.tips(data.message,id, {
						tipsMore : false,
						time: 1000
					});
					$(".logincap").click();
				}

			},
		});
		return false;
	}
</script>

</body>
</html>