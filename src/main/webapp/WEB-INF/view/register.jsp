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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/login/styles.css">
</head>
<body>
	<div id="vcontroller" class="htmleaf-container">
		<div class="wrapper">
			<div class="container">
				<h1>LarryMS管理系统</h1>
				<h2 class="loginh">后台登录中心</h2>
				<img class="logimg"
					src="${pageContext.request.contextPath}/static/images/login/admin.png"></img>
				<form class="form">
					<input type="text" v-model="resigterModel.username" placeholder="用户名"> 
					<input type="password" v-model="resigterModel.password" placeholder="密码"> 
					<input type="password" v-model="resigterModel.repeatpwd" placeholder="重复确认密码"> 
					<input type="text" v-model="resigterModel.nickname" placeholder="请输入昵称"> 
					<input type="text" v-model="resigterModel.captcha" placeholder="验证码">
					<img class="logincap" src="../captcha.do" onclick="this.src='../captcha.do?d='+Math.random();"></img>
				</form>
				<button class="register" @Click="register">注册</button>
				<h5>© 2016-2017 Larry 版权所有 larrycms.com</h5>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/static/js/register.js"></script>
</body>
</html>