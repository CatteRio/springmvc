<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>用户管理-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
<%@include file="../common/header.jsp"%>
</head>

<body>
	<div class="weadmin-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">管理员管理</a>
			<a> <cite>角色管理</cite></a>
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
		<table class="layui-table">
			<thead>
				<tr>
					<th>
						<div class="layui-unselect header layui-form-checkbox"
							lay-skin="primary">
							<i class="layui-icon">&#xe605;</i>
						</div>
					</th>
					<th>ID</th>
					<th>角色名</th>
					<th>拥有权限规则</th>
					<th>描述</th>
					<th>状态</th>
					<th>操作</th>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="layui-unselect layui-form-checkbox" lay-skin="primary"
							data-id='2'>
							<i class="layui-icon">&#xe605;</i>
						</div>
					</td>
					<td>1</td>
					<td>超级管理员</td>
					<td>会员列表，问题列表</td>
					<td>具有至高无上的权利</td>
					<td class="td-status"><span
						class="layui-btn layui-btn-normal layui-btn-xs">已启用</span></td>
					<td class="td-manage"><a onclick="member_stop(this,'10001')"
						href="javascript:;" title="启用"> <i class="layui-icon">&#xe601;</i>
					</a> <a title="编辑" onclick="WeAdminShow('编辑','./role-add.html')"
						href="javascript:;"> <i class="layui-icon">&#xe642;</i>
					</a> <a title="删除" onclick="member_del(this,'要删除的id')"
						href="javascript:;"> <i class="layui-icon">&#xe640;</i>
					</a></td>
				</tr>
			</tbody>
		</table>
		<div class="page">
			<div>
				<a class="prev" href="">&lt;&lt;</a> <a class="num" href="">1</a> <span
					class="current">2</span> <a class="num" href="">3</a> <a
					class="num" href="">489</a> <a class="next" href="">&gt;&gt;</a>
			</div>
		</div>
	</div>
		<script
		src="${pageContext.request.contextPath}/static/js/admin/role.js"></script>
</body>

</html>