/**
 * 
 */
var tableOption = {
	elem : '#laytable',
	height : 500,
	where : {

	},
	url : baseApiPath + '/user/list.do', // 数据接口
	method : 'post',
	response : {
		statusName : 'code',// 数据状态的字段名称，默认：code
		statusCode : 200,// 成功的状态码，默认：0
		msgName : 'message',// 状态信息的字段名称，默认：msg
		countName : 'count',// 数据总数的字段名称，默认：count
		dataName : 'data',// 数据列表的字段名称，默认：data
	},
	page : true, // 开启分页
	cols : [ [ // 表头
	{
		type : 'checkbox'
	}, {
		field : 'id',
		title : 'ID',
		sort : true,
		width : 80
	}, {
		field : 'username',
		title : '用户名'
	}, {
		field : 'nickname',
		title : '昵称'
	}, {
		field : 'roleid',
		title : '角色'
	}, {
		field : 'mobile',
		title : '手机号'
	}, {
		field : 'email',
		title : '邮箱地址'
	}, {
		fixed : 'right',
		width : 150,
		align : 'center',
		toolbar : '#barDemo'
	} ] ],
	id : "base"
};
var tableins;
layui.use('table', function() {
	var table = layui.table;
	// 第一个实例
	tableins = table.render(tableOption);
	// 监听工具条
	table.on('tool(maintable)', function(obj) {
		var data = obj.data; // 获得当前行数据
		var layEvent = obj.event;
		var tr = obj.tr; // 获得当前行 tr 的DOM对象

		if (layEvent === 'del') { // 删除
			confirm('确认删除？', function(index) {
				$.ajax({
					type : "post",
					url : baseApiPath + "/user/delete.do",
					data : data,
					success : function(data) {
						alert(data.message);
						tableins.reload();
					}
				});
				layer.close(index);
			});
		} else if (layEvent === 'edit') { // 编辑

			$.ajax({
				type : "post",
				url : baseApiPath + "/user/info.do",
				data : data,
				success : function(data) {
					var user = data.data;
					vm.user.id = user.id;
					vm.user.username = user.username;
					vm.user.role = user.role;
					vm.user.nickname = user.nickname;
					vm.user.mobile = user.mobile;
					vm.user.email = user.email;
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(JSON.parse(jqXHR.responseText).message);
				}
			});

			vm.showEditView();
		}
	});
});

var vm = new Vue(
		{
			el : '#vcontroller',
			data : {
				showList : true,
				showAdd : false,
				showEdit : false,
				selectInput : "",
				user : {
					id : "",
					role : "",
					username : "",
					nickname : "",
					password : "",
					repass : "",
					mobile : "",
					email : ""
				}
			},
			methods : {
				showAddView : function() {
					this.showAdd = true;
					this.showList = false;
					this.showEdit = false;
				},
				showListView : function() {
					this.showAdd = false;
					this.showList = true;
					this.showEdit = false;
				},
				showEditView : function() {
					this.showAdd = false;
					this.showList = false;
					this.showEdit = true;
				},
				selectUser : function() {
					var tableOptionins = cloneObj(tableOption);
					tableOptionins.where.username = this.selectInput;
					tableins.reload(tableOptionins);
				},
				deleteSelect : function() {
					var table = layui.table;
					var checkStatus = table.checkStatus('base');
					confirm('确认删除所选用户？', function(index) {
						$.ajax({
							type : "post",
							url : baseApiPath + "/user/deletelist.do",
							data : JSON.stringify(checkStatus.data),
							contentType : 'application/json',
							success : function(data) {
								alert(data.message);
								tableins.reload();
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert(JSON.parse(jqXHR.responseText).message);
							}
						});
						layer.close(index);
					});

					console.log(checkStatus);
				},
				editUser : function() {
					$.ajax({
						type : "post",
						url : baseApiPath + "/user/update.do",
						data : vm.user,
						success : function(data) {
							alert(data.message, function() {
								if (data.code == 200) {
									vm.showListView();
									tableins.reload();
								}
							});
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert(JSON.parse(jqXHR.responseText).message);
						}
					});
				},
				loadRole : function() {
					$.ajax({
						type : "post",
						url : baseApiPath + "/role/list.do",
						success : function(data) {
							layer.open({
								type : 1,
								title:"选择角色",
								area: ['380px', '540px'],
								skin : 'layui-layer-rim', // 加上边框
								content :$('#select')
							});
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert(JSON.parse(jqXHR.responseText).message);
						}
					});
				}
			}
		})

// 新增用户部分代码
layui.use([ 'form' ], function() {
	var form = layui.form;
	form.verify({
		pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
		repass : function(value) {
			if ($('#L_pass').val() != $('#L_repass').val()) {
				return '两次密码不一致';
			}
		}
	});
	// 监听提交
	form.on('submit(addUser)', function(data) {
		$.ajax({
			type : "post",
			url : baseApiPath + "/user/add.do",
			data : data.field,
			success : function(data) {
				alert(data.message, function() {
					if (data.code == 200) {
						vm.showListView();
						tableins.reload();
					}
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(JSON.parse(jqXHR.responseText).message);
			}
		});
		return false;
	});

	// 监听提交
	form.on('submit(editUser)', function(data) {
		vm.editUser();
		return false;
	});

});
