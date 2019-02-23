/**
 * 
 */
var tableOption = {
	elem : '#laytable',
	height : 500,
	where : {

	},
	url : baseApiPath + '/role/list.do', // 数据接口
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
		field : 'role',
		title : '角色'
	}, {
		field : 'remark',
		title : '备注'
	}, {
		field : 'permissionid',
		title : '权限',
		templet : function(d) {
			d = d.permissions;
			var permissions = "";
			for (var i = 0; i < d.length; i++) {
				permission = d[i];
				permissions = permissions + permission.content;
				if (i < d.length - 1) {
					permissions = permissions + ",";
				}
			}
			return permissions;
		}
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
					url : baseApiPath + "/role/delete.do",
					data : "id=" + data.id,
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
				url : baseApiPath + "/role/info.do",
				data : data,
				success : function(data) {
					var role = data.data;
					var permissions = role.permissions;
					var permissionNames = "";
					var permissionadds = [];
					for (var i = 0; i < permissions.length; i++) {
						permission = permissions[i];
						permissionNames = permissionNames + permission.content;
						permissionadds.push(permission.id);
						if (i < permissions.length - 1) {
							permissionNames = permissionNames + ",";
						}
					}

					$('#permission2').val(permissionNames);
					vm.role.id = role.id;
					vm.role.role = role.role;
					vm.role.remark = role.remark;
					vm.role.permissionadd = permissionadds;
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(JSON.parse(jqXHR.responseText).message);
				}
			});

			vm.showEditView();
		}
	});
});

var vm = new Vue({
	el : '#vcontroller',
	data : {
		showList : true,
		showAdd : false,
		showEdit : false,
		selectInput : "",
		role : {
			id : "",
			permissionadd : [],
			role : "",
			remark : ""
		}
	},
	methods : {
		selectRole : function() {
			var tableOptionins = cloneObj(tableOption);
			tableOptionins.where.role = this.selectInput;
			tableins.reload(tableOptionins);
		},
		deleteSelect : function() {
			var table = layui.table;
			var checkStatus = table.checkStatus('base');
			if (checkStatus.data.length == 0) {
				alert("请选中至少一条记录");
				return;
			}
			confirm('确认删除所选角色？', function(index) {
				$.ajax({
					type : "post",
					url : baseApiPath + "/role/deletelist.do",
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
		loadPermission : function(permission1, permission2) {
			// console.log(role1,role2)
			$.ajax({
				type : "post",
				url : baseApiPath + "/permission/all/list.do",
				success : function(data) {
					var setting = {
						check : {
							enable : true
						},
						data : {
							simpleData : {
								enable : true
							}
						}
					};
					var zNodes = data.data;
					var selectedRoles = $('#'+permission1).val().split(",");
					for ( var index in zNodes) {
						traverseTree(zNodes[index],selectedRoles);
					}
					setting.check.chkboxType = {
						"Y" : "ps",
						"N" : "ps"
					};
					$.fn.zTree.init($("#ztree"), setting, zNodes);
					layer.open({
						type : 1,
						title : "选择权限",
						area : [ '320px', '380px' ],
						skin : 'layui-layer-rim', // 加上边框
						content : $('#select'),
						btn : [ '确定', '取消' ],
						yes : function(index, layero) {
							var zTreeOjb = $.fn.zTree.getZTreeObj("ztree");
							var checkedNodes = zTreeOjb.getCheckedNodes();
							var permissions = [];
							var permissionids = [];
							for (i = 0; i < checkedNodes.length; i++) {
								permissions.push(checkedNodes[i].name);
								permissionids.push(checkedNodes[i].id);
							}
							console.log(permissions);
							console.log(permissionids);
							var permissionVal = "";
							for (var i = 0; i < permissions.length; i++) {
								permissionVal = permissionVal + permissions[i];
								if (i < permissions.length - 1) {
									permissionVal = permissionVal + ",";
								}
							}
							$('#' + permission1).val(permissionVal);
							$('#' + permission2).val(permissionids);
							vm.role.permissionadd = permissionids;
							layer.close(index);
						},
						btn2 : function(index, layero) {
							// alert("取消了");
						},
						btnAlign : 'c'
					});

				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(JSON.parse(jqXHR.responseText).message);
				}
			});

			// alreadyRoles = $('#'+permission1).val().split(",")
			// var permissions = data.data;
			// var html = "";
			// for(j = 0; j < permissions.length; j++) {
			// var permission = permissions[j];
			// html = html + "<div class=\"layui-inline my-list-iteam\">\r\n";
			// html = html + "<input type=\"checkbox\"
			// permission=\""+permission.content+"\" class=\"chklist\"
			// value=\""+permission.id+"\" ";
			// if(alreadyRoles.contains(permission.content)){
			// html = html +"checked=\"checked\"";
			// }
			// html = html +"/>\r\n";
			// html = html + "<label class=\"chkbox\"> \r\n"
			// html = html + "<span class=\"check-image\"></span> \r\n"
			// html = html + "<span
			// class=\"radiobox-content\">"+permission.content+"</span> \r\n"
			// html = html + "</label></div> \r\n"
			// }
			// $('#selectbody').html(html);
			// $(".chklist").labelauty("chklist", "check");
			// layer.open({
			// type : 1,
			// title : "选择权限",
			// area : [ '540px', '380px' ],
			// skin : 'layui-layer-rim', // 加上边框
			// content : $('#select'),
			// btn : [ '确定', '取消' ],
			// yes : function(index, layero) {
			// var permissions = [];
			// var permissionids = [];
			// $('#selectbody input:checked').each(function(){
			// permissions.push($(this).attr('permission'));
			// permissionids.push($(this).val());
			// });
			// var permissionVal="";
			// for(var i=0;i<permissions.length;i++){
			// permissionVal = permissionVal + permissions[i];
			// if(i<permissions.length-1){
			// permissionVal = permissionVal+",";
			// }
			// }
			// $('#'+permission1).val(permissionVal);
			// $('#'+permission2).val(permissionids);
			// vm.role.permissionadd = permissionids;
			// layer.close(index);
			// },
			// btn2 : function(index, layero) {
			// // alert("取消了");
			// },
			// btnAlign : 'c'
			// });
			// },
			// error : function(jqXHR, textStatus, errorThrown) {
			// alert(JSON.parse(jqXHR.responseText).message);
			// }
			// });
		},
		editRole : function() {
			$.ajax({
				type : "post",
				url : baseApiPath + "/role/update.do",
				data : vm.role,
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
	form.on('submit(addRole)', function(data) {
		$.ajax({
			type : "post",
			url : baseApiPath + "/role/add.do",
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
	form.on('submit(editRole)', function(data) {
		vm.editRole();
		return false;
	});

});
// 遍历单个节点
function addNodeName(node,selectedRoles) {
	node['name'] = node['content'];
	if(selectedRoles.contains(node['name'])){
		node["checked"]=true;
		node["open"]=true
	}
}

// 递归遍历树
function traverseTree(node,selectedRoles) {
	if (!node) {
		return;
	}
	addNodeName(node,selectedRoles);
	if (node.children && node.children.length > 0) {
		var i = 0;
		for (i = 0; i < node.children.length; i++) {
			this.traverseTree(node.children[i],selectedRoles);
		}
	}else{
		delete node.children;
	}
}
