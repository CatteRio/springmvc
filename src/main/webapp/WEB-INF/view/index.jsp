<%@page import="com.yy.utils.ShiroUtils"%>
<%@page import="com.yy.utils.SpringContextUtils"%>
<%@page import="com.yy.service.impl.PermissionServiceImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yy.pojo.Premission"%>
<%@page import="java.util.List"%>
<%@page import="com.yy.pojo.Role"%>
<%@page import="com.yy.pojo.User"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>后台管理</title>
<%@include file="common/header.jsp"%>
</head>
<body>
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a href="./index.do">后台管理系统</a>
		</div>
		<div class="left_open">
			<i title="展开左侧栏" class="iconfont">&#xe699;</i>
		</div>
		<ul class="layui-nav left fast-add" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">+新增</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="WeAdminShow('资讯','https://www.youfa365.com/')"><i
							class="iconfont">&#xe6a2;</i>资讯</a>
					</dd>
					<dd>
						<a onclick="WeAdminShow('图片','http://www.baidu.com')"><i
							class="iconfont">&#xe6a8;</i>图片</a>
					</dd>
					<dd>
						<a onclick="WeAdminShow('用户','https://www.youfa365.com/')"><i
							class="iconfont">&#xe6b8;</i>用户</a>
					</dd>
				</dl></li>
		</ul>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;"><shiro:principal
						property="nickname" /></a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="WeAdminShow('个人信息','http://www.baidu.com')">个人信息</a>
					</dd>
					<dd>
						<a
							onclick="WeAdminShow('切换帐号','${pageContext.request.contextPath}/login.do')">切换帐号</a>
					</dd>
					<dd>
						<a class="loginout"
							href="${pageContext.request.contextPath}/admin/logout.do">退出</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index"><a href="/">前台首页</a></li>
		</ul>

	</div>
	<!-- 顶部结束 -->
	<!-- 中部开始 -->
	<!-- 左侧菜单开始 -->
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				<%--强行调用shiro方法获取用户信息--%>
				<shiro:hasRole name=""></shiro:hasRole>
				<%
					List<Premission> premissions = ShiroUtils.getUser().getPremissions();
					request.setAttribute("premissions", premissions);
				%>
				<jsp:include page="menu.jsp" />
			</ul>
		</div>
	</div>
	<!-- <div class="x-slide_left"></div> -->
	<!-- 左侧菜单结束 -->
	<!-- 右侧主体开始 -->
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="wenav_tab" id="WeTabTip"
			lay-allowclose="true">
			<ul class="layui-tab-title" id="tabName">
				<li>我的桌面</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<iframe src='welcome.do' frameborder="0" scrolling="yes"
						class="weIframe"></iframe>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content-bg"></div>
	<!-- 右侧主体结束 -->
	<!-- 中部结束 -->
	<!-- 底部开始 -->
	<!-- <div class="footer">
		<div class="copyright">Copyright ©2018 WeAdmin v1.0 All Rights
			Reserved</div>
	</div> -->
	<!-- 底部结束 -->
	<script type="text/javascript">
		layui.config({
			base : './static/js/',
			version : '101100'
		}).use('admin');
		layui.use([ 'jquery', 'admin' ], function() {
		});
	</script>
</body>
<!--Tab菜单右键弹出菜单-->
<ul class="rightMenu" id="rightMenu">
	<li data-type="fresh">刷新</li>
	<li data-type="current">关闭当前</li>
	<li data-type="other">关闭其它</li>
	<li data-type="all">关闭所有</li>
</ul>

</html>