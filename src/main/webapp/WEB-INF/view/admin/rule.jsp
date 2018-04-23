<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>角色管理-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
<%@include file="../common/header.jsp"%>
</head>

<body>
	<div id="vcontroller">
		<!-- 查看用户 -->
		<div class="weadmin-body">
			<fieldset class="layui-elem-field">
				<legend>权限管理</legend>
				<div class="layui-field-box">
					<div class="my-layui-block">
						<div id="laytree"></div>
					</div>
					<div class="my-layui-nodeview" v-show="showView">
						<div class="layui-form">
							<input type="text" class="layui-hide" v-model="premission.id" />
							<input type="text" class="layui-hide"
								v-model="premission.parentid" />
							<div class="layui-form-item">
								<label class="layui-form-label">名称</label>
								<div class="layui-input-block">
									<input type="text" placeholder="请输入名称" autocomplete="off"
										v-model="premission.content" lay-verify="required"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">路径</label>
								<div class="layui-input-block">
									<input type="text" placeholder="请输入路径" autocomplete="off"
										v-model="premission.path" lay-verify="required"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">备注</label>
								<div class="layui-input-block">
									<input type="text" placeholder="请输入备注" autocomplete="off"
										v-model="premission.remark" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit>新增</button>
									<button class="layui-btn" lay-submit>修改</button>
									<button class="layui-btn layui-btn-warm">删除</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/static/js/admin/rule.js"></script>
</body>

</html>