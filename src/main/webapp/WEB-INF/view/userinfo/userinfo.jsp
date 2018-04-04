<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>导航系统后台管理平台</title>
<%@include file="../common/header.jsp"%>
<script>
	//JavaScript代码区域
	layui.use('element', function() {
		var element = layui.element;

	});
</script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">导航系统后台管理</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.do">个人中心</a></li>
				<li class="layui-nav-item"><a href="userinfo.do">个人信息</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> <shiro:principal
							property="nickname" />
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="logout.do">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">基本资料</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="modifyinfo.do" target="right">修改资料</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">安全设置</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">修改密码</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<iframe id="mainFrame" frameborder=0 name="right"
				src='modifyinfo.do' width="100%" height="100%"></iframe>
		</div>
	</div>

</body>
</html>