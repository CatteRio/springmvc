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
		<!-- 查看角色 -->
		<div class="weadmin-body" v-show="showList">
			<fieldset class="layui-elem-field">
				<legend>查看角色</legend>
				<div class="layui-field-box">
					<div class="weadmin-block">
						<div class="layui-inline">
							<input type="text" v-model="selectInput" placeholder="请输入角色名"
								@keyup="selectRole()" autocomplete="off" class="layui-input">
						</div>
						<button class="layui-btn" lay-submit="" lay-filter="sreach">
							<i class="layui-icon">&#xe615;</i>
						</button>
						<button class="layui-btn layui-btn-danger" @click="deleteSelect()">
							<i class="layui-icon"></i>批量删除
						</button>
						<button class="layui-btn" @click="showAddView()">
							<i class="layui-icon"></i>添加
						</button>
					</div>
					<table id="laytable" lay-filter="maintable">
					</table>
					<div id="barDemo" style="display: none">
						<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> <a
							class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
					</div>
				</div>
			</fieldset>
		</div>
		<!-- 增加角色 -->
		<div class="weadmin-body" v-show="showAdd">
			<fieldset class="layui-elem-field">
				<legend>新增角色</legend>
				<div class="layui-field-box">
					<div class="layui-form">
						<div class="layui-form-item">
							<label for="role" class="layui-form-label"> <span
								class="we-red">*</span>角色
							</label>
							<div class="layui-input-inline">
								<input type="text" id="role" name="role" required=""
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<span class="we-red">*</span>
							</div>
						</div>
						<div class="layui-form-item">
							<label for="remark" class="layui-form-label"> <span
								class="we-red">*</span>描述
							</label>
							<div class="layui-input-inline">
								<input type="text" id="remark" name="remark" required=""
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<span class="we-red">*</span>
							</div>
						</div>

						<div class="layui-form-item">
							<label for="premission" class="layui-form-label"> <span
								class="we-red">*</span>权限
							</label>
							<div class="layui-input-inline">
								<input type="text" id="premission" required=""
									@focus="loadPremission('premission','premissionids')"
									lay-verify="required" autocomplete="off" class="layui-input"
									readonly="readonly">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<span class="we-red">*</span>
							</div>
						</div>

						<div class="layui-form-item layui-hide">
							<input type="text" id="premissionids" name="premissionadd[0]"
								class="layui-input" readonly="readonly">
						</div>
						<div class="layui-form-item">
							<label for="L_repass" class="layui-form-label"></label>
							<button class="layui-btn" lay-submit lay-filter="addRole">增加</button>
							<button class="layui-btn layui-btn-warm" @click="showListView()">返回</button>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
		<!-- 编辑角色 -->
		<div class="weadmin-body" v-show="showEdit">
			<fieldset class="layui-elem-field">
				<legend>编辑角色</legend>
				<div class="layui-field-box">
					<div class="layui-form">
						<input type="text" class="layui-hide"
							v-model="role.id" readonly="readonly">
						<div class="layui-form-item">
							<label class="layui-form-label">角色 </label>
							<div class="layui-input-inline">
								<input v-model="role.role" type="text" required=""
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">描述 </label>
							<div class="layui-input-inline">
								<input v-model="role.remark" type="text" required=""
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>


						<div class="layui-form-item">
							<label for="role" class="layui-form-label">权限 </label>
							<div class="layui-input-inline">
								<input type="text" id="premission2" required=""
									@focus="loadPremission('premission2','premissionids2')"
									lay-verify="required" autocomplete="off" class="layui-input"
									readonly="readonly">
							</div>
						</div>

						<div class="layui-form-item layui-hide">
							<input type="text" id="premissionids2"
								v-model="role.premissionadd[0]" class="layui-input"
								readonly="readonly">
						</div>
						<div class="layui-form-item">
							<label for="L_repass" class="layui-form-label"></label>
							<button class="layui-btn" lay-submit lay-filter="editRole">修改</button>
							<button class="layui-btn layui-btn-warm" @click="showListView()">返回</button>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
		<!-- 选择角色列表 -->
		<div id="select" style="display: none">
			<div id="selectbody" class="weadmin-body"></div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/static/js/admin/role.js"></script>
</body>

</html>