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
	<div id="vcontroller">
		<!-- 查看用户 -->
		<div class="weadmin-body" v-show="showList">
			<fieldset class="layui-elem-field">
				<legend>查看用户</legend>
				<div class="layui-field-box">
					<div class="weadmin-block">
						<div class="layui-inline">
							<input type="text" v-model="selectInput" placeholder="请输入用户名"
								@keyup="selectUser()" autocomplete="off" class="layui-input">
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
		<!-- 增加用户 -->
		<div class="weadmin-body" v-show="showAdd">
			<fieldset class="layui-elem-field">
				<legend>新增用户</legend>
				<div class="layui-field-box">
					<div class="layui-form">
						<div class="layui-form-item">
							<label for="username" class="layui-form-label"> <span
								class="we-red">*</span>用户名
							</label>
							<div class="layui-input-inline">
								<input type="text" id="username" name="username" required=""
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<span class="we-red">*</span>
							</div>
						</div>
						<div class="layui-form-item">
							<label for="nickname" class="layui-form-label"> <span
								class="we-red">*</span>昵称
							</label>
							<div class="layui-input-inline">
								<input type="text" id="nickname" name="nickname" required=""
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<span class="we-red">*</span>
							</div>
						</div>

						<div class="layui-form-item">
							<label for="role" class="layui-form-label"> <span
								class="we-red">*</span>角色
							</label>
							<div class="layui-input-inline">
								<input type="text" id="role" required="" @focus="loadRole('role','roleids')"
									lay-verify="required" autocomplete="off" class="layui-input"
									readonly="readonly">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<span class="we-red">*</span>
							</div>
						</div>

						<div class="layui-form-item layui-hide">
							<input type="text" id="roleids" name="roleadd[0]"
								class="layui-input" readonly="readonly">
						</div>


						<div class="layui-form-item">
							<label for="phone" class="layui-form-label"> <span
								class="we-red">*</span>手机
							</label>
							<div class="layui-input-inline">
								<input type="text" id="phone" name="mobile" required=""
									lay-verify="phone" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<span class="we-red">*</span>
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_email" class="layui-form-label"> <span
								class="we-red">*</span>邮箱
							</label>
							<div class="layui-input-inline">
								<input type="text" id="L_email" name="email" required=""
									lay-verify="email" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">
								<span class="we-red">*</span>
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_pass" class="layui-form-label"> <span
								class="we-red">*</span>密码
							</label>
							<div class="layui-input-inline">
								<input type="password" id="L_pass" name="password" required=""
									lay-verify="pass" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">6到16个字符</div>
						</div>
						<div class="layui-form-item">
							<label for="L_repass" class="layui-form-label"> <span
								class="we-red">*</span>确认密码
							</label>
							<div class="layui-input-inline">
								<input type="password" id="L_repass" name="repass" required=""
									lay-verify="repass" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_repass" class="layui-form-label"></label>
							<button class="layui-btn" lay-submit lay-filter="addUser">增加</button>
							<button class="layui-btn layui-btn-warm" @click="showListView()">返回</button>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
		<!-- 编辑用户 -->
		<div class="weadmin-body" v-show="showEdit">
			<fieldset class="layui-elem-field">
				<legend>编辑用户</legend>
				<div class="layui-field-box">
					<div class="layui-form">
						<input type="text" style="display: none" name="username"
							v-model="user.id" readonly="readonly">
						<div class="layui-form-item">
							<label for="username" class="layui-form-label">用户名 </label>
							<div class="layui-input-inline">
								<input v-model="user.username" type="text" name="username"
									required="" lay-verify="required" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="nickname" class="layui-form-label">昵称 </label>
							<div class="layui-input-inline">
								<input v-model="user.nickname" type="text" name="nickname"
									required="" lay-verify="required" autocomplete="off"
									class="layui-input">
							</div>
						</div>


						<div class="layui-form-item">
							<label for="role" class="layui-form-label">角色
							</label>
							<div class="layui-input-inline">
								<input type="text" id="role2" required="" @focus="loadRole('role2','roleids2')"
									lay-verify="required" autocomplete="off" class="layui-input"
									readonly="readonly">
							</div>
						</div>

						<div class="layui-form-item layui-hide">
							<input type="text" id="roleids2" v-model="user.roleadd[0]"
								class="layui-input" readonly="readonly">
						</div>



						<div class="layui-form-item">
							<label for="phone" class="layui-form-label">手机 </label>
							<div class="layui-input-inline">
								<input v-model="user.mobile" type="text" name="mobile"
									required="" lay-verify="phone" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_email" class="layui-form-label">邮箱 </label>
							<div class="layui-input-inline">
								<input v-model="user.email" type="text" name="email" required=""
									lay-verify="email" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="L_pass" class="layui-form-label">密码 </label>
							<div class="layui-input-inline">
								<input v-model="user.password" type="password" name="password"
									autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">无需修改则留空</div>
						</div>
						<div class="layui-form-item">
							<label for="L_repass" class="layui-form-label"></label>
							<button class="layui-btn" lay-submit lay-filter="editUser">修改</button>
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
		src="${pageContext.request.contextPath}/static/js/admin/user.js"></script>
</body>

</html>