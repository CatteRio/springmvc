<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>管理员列表-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
<%@include file="../common/header.jsp"%>
</head>

<body>
	<div class="weadmin-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">管理员管理</a>
			<a> <cite>管理员列表</cite></a>
		</span> <a class="layui-btn layui-btn-sm"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="weadmin-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 we-search">
				<div class="layui-inline">
					<input class="layui-input" placeholder="开始日" name="start"
						id="start">
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="截止日" name="end" id="end">
				</div>
				<div class="layui-inline">
					<input type="text" name="username" placeholder="请输入用户名"
						autocomplete="off" class="layui-input">
				</div>
				<button class="layui-btn" lay-submit="" lay-filter="sreach">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		<div class="weadmin-block">
			<button class="layui-btn layui-btn-danger" onclick="delAll()">
				<i class="layui-icon"></i>批量删除
			</button>
			<button class="layui-btn" onclick="WeAdminShow('添加用户','./add.html')">
				<i class="layui-icon"></i>添加
			</button>
			<span class="fr" style="line-height: 40px">共有数据：88 条</span>
		</div>
		<table id="laytable" lay-filter="maintable">
		</table>

	</div>
	<div id="barCheck" type="text/html" style="display: none">
		<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
	</div>
	<div id="barDemo" type="text/html" style="display: none">
		<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a> <a
			class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> <a
			class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>

	<script
		src="${pageContext.request.contextPath}/static/js/admin/list.js"></script>

</body>

</html>