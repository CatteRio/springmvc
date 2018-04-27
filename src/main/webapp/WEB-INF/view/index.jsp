<%@page import="com.yy.utils.SpringContextUtils"%>
<%@page import="com.yy.service.impl.PremissionService"%>
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
			<a href="./index.do">WeAdmin v1.0</a>
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
				<%-- <%
					PremissionService premissionService = SpringContextUtils.getBean(PremissionService.class);
					
					
					User user = (User) SecurityUtils.getSubject().getPrincipal();
					List<Role> roles = user.getRoles();
					List<Premission> premissions = new ArrayList<>();
					for(Role role : roles){
						premissions.addAll(role.getPremissions());
					}
					request.setAttribute("premissions", premissions);
				%>
				<c:forEach var="premission" items="${premissions}">
					<li>${premission.content}</li>
				</c:forEach> --%>




				<li><a href="javascript:;"> <i class="iconfont">&#xe6b8;</i>
						<cite>会员管理</cite> <i class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="./member/list.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>会员列表</cite>

						</a></li>
						<li><a _href="./member/del.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>会员删除</cite>

						</a></li>
						<li><a href="javascript:;"> <i class="iconfont">&#xe70b;</i>
								<cite>会员管理</cite> <i class="iconfont nav_right">&#xe697;</i>
						</a>
							<ul class="sub-menu">
								<li><a _href="./member/addInput.do"> <i
										class="iconfont">&#xe6a7;</i> <cite>输入框操作</cite>
								</a></li>
								<li><a _href="./404.do"> <i class="iconfont">&#xe6a7;</i>
										<cite>三级菜单演示</cite>
								</a></li>
								<li><a _href="./404.do"> <i class="iconfont">&#xe6a7;</i>
										<cite>导航菜单演示</cite>
								</a></li>
							</ul></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont">&#xe705;</i>
						<cite>文章管理</cite> <i class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="./article/list.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>文章列表</cite>
						</a></li>
						<li><a _href="./article/category.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>分类管理</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont">&#xe723;</i>
						<cite>订单管理</cite> <i class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="./order/list.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>订单列表</cite>
						</a></li>
					</ul></li>

				<shiro:hasPermission name="管理员管理">
					<li><a href="javascript:;"> <i class="iconfont">&#xe726;</i>
							<cite>管理员管理</cite> <i class="iconfont nav_right">&#xe697;</i>
					</a>
						<ul class="sub-menu">
							<shiro:hasPermission name="用户管理">
								<li><a _href="./admin/user.do"> <i class="iconfont">&#xe6a7;</i>
										<cite>用户管理</cite>
								</a></li>
							</shiro:hasPermission>
							<shiro:hasPermission name="角色管理">
								<li><a _href="./admin/role.do"> <i class="iconfont">&#xe6a7;</i>
										<cite>角色管理</cite>
								</a></li>
							</shiro:hasPermission>
							<shiro:hasPermission name="权限管理">
								<li><a _href="./admin/rule.do"> <i class="iconfont">&#xe6a7;</i>
										<cite>权限管理</cite>
								</a></li>
							</shiro:hasPermission>
						</ul></li>
				</shiro:hasPermission>
				<li><a href="javascript:;"> <i class="iconfont">&#xe6ce;</i>
						<cite>系统统计</cite> <i class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="./echarts/echarts1.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>拆线图</cite>
						</a></li>
						<li><a _href="./echarts/echarts2.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>柱状图</cite>
						</a></li>
						<li><a _href="./echarts/echarts3.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>地图</cite>
						</a></li>
						<li><a _href="./echarts/echarts4.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>饼图</cite>
						</a></li>
						<li><a _href="./echarts/echarts5.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>雷达图</cite>
						</a></li>
						<li><a _href="./echarts/echarts6.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>k线图</cite>
						</a></li>
						<li><a _href="./echarts/echarts7.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>热力图</cite>
						</a></li>
						<li><a _href="./echarts/echarts8.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>仪表图</cite>
						</a></li>
						<li><a _href="./echarts/echarts9.do"> <i class="iconfont">&#xe6a7;</i>
								<cite>地图DIY实例</cite>
						</a></li>
					</ul></li>
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
	<div class="footer">
		<div class="copyright">Copyright ©2018 WeAdmin v1.0 All Rights
			Reserved</div>
	</div>
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