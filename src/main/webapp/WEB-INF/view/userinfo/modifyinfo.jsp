<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>修改资料</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<%@include file="../common/header.jsp"%>

</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>修改资料</legend>
	</fieldset>

	<div id='updateForm' class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input v-model="model.username" type="text" name="username"
					value="<shiro:principal property="username"/>" autocomplete="off"
					placeholder="请输入用户名" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">昵称</label>
			<div class="layui-input-block">
				<input v-model="model.nickname" type="text" name="nickname"
					value="<shiro:principal property="nickname"/>" placeholder="请输入昵称"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button v-on:click="update" class="layui-btn">立即提交</button>
				<button v-on:click="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</div>
	<script>
		//layui.use([ 'form', 'layedit', 'laydate' ]);
	</script>
	<script
		src="${pageContext.request.contextPath}/static/js/userinfo/modifyinfo.js"></script>
</body>
</html>
