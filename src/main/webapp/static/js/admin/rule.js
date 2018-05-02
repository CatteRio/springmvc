//var treeOption = {
//	elem : '#laytree',
//	nodes : getNodes(),
//	click : function(node) {
//		vm.loadPremission(node);
//		vm.currentPremission = cloneObj(vm.premission);
//		vm.showView = true; // node即为当前点击的节点数据
//	}
//};
//layui.use('tree', function() {
//	layui.tree(treeOption);
//});
$(function() {
	var setting = {
		view : {
			addHoverDom : addHoverDom,
			removeHoverDom : removeHoverDom,
			selectedMulti : false
		},
		edit : {
			enable : true,
			editNameSelectAll : true,
			showRemoveBtn : true,
			showRenameBtn : true
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeEditName : beforeEditName,
			beforeRemove : beforeRemove
		}
	};
	var zNodes = [];
	function beforeEditName(treeId, treeNode) {
		vm.premission = treeNode;
		layer.open({
			type : 1,
			title : "编辑节点",
			area : [ '450px', '300px' ],
			skin : 'layui-layer-rim', // 加上边框
			content : $('#select'),
			btn : [ '确定', '取消' ],
			yes : function(index, layero) {
				vm.updateRule();
				treeNode.name = vm.premission.content;
				treeNode.content = vm.premission.content;
				treeNode.path = vm.premission.path;
				treeNode.remark = vm.premission.remark
				var zTree = $.fn.zTree.getZTreeObj("ztree");
				zTree.updateNode(treeNode);
				layer.close(index);
			},
			btn2 : function(index, layero) {
			},
			btnAlign : 'c'
		});
		return false;
	}
	function beforeRemove(treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("ztree");
		zTree.selectNode(treeNode);
		confirm("确认删除节点 :" + treeNode.name + " 吗？",function(){
			vm.premission = treeNode;
			vm.deleteRule();
			zTree.removeNode(treeNode);
		});
		return false;
	}
	function addHoverDom(treeId, treeNode) {
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
			return;
		var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $("#addBtn_" + treeNode.tId);
		if (btn)
			btn.bind("click", function() {
				vm.premission = {};
				layer.open({
					type : 1,
					title : "增加节点",
					area : [ '450px', '300px' ],
					skin : 'layui-layer-rim', // 加上边框
					content : $('#select'),
					btn : [ '确定', '取消' ],
					yes : function(index, layero) {
						vm.premission.parentid = treeNode.id;
						vm.addRule(function(){
							$.ajax({
								type : "post",
								url : baseApiPath + "/premission/list.do",
								data : vm.premission,
								success : function(data) {
									var insertNode = data.data;
									insertNode['name'] = insertNode['content'];
									insertNode['pId'] = treeNode.id;
									var zTree = $.fn.zTree.getZTreeObj("ztree");
									zTree.addNodes(treeNode, insertNode);
								},
								error : function(jqXHR, textStatus, errorThrown) {
									alert(JSON.parse(jqXHR.responseText).message);
								}
							});
						});
						layer.close(index);
					},
					btn2 : function(index, layero) {
					},
					btnAlign : 'c'
				});
				return false;
			});
	}
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_" + treeNode.tId).unbind().remove();
	}
	function selectAll() {
		var zTree = $.fn.zTree.getZTreeObj("ztree");
		zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
	}
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : baseApiPath + "/premission/all/list.do",
			success : function(data) {
				zNodes = data.data;
				for (var i = 0; i < zNodes.length; i++) {
					traverseTree(zNodes[i]);
				}

				$.fn.zTree.init($("#ztree"), setting, zNodes);
				$("#selectAll").bind("click", selectAll);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(JSON.parse(jqXHR.responseText).message);
			}
		});

	});
});
layui.use([ 'form' ], function() {
	var form = layui.form;
	form.verify();

	// 监听提交
	form.on('submit(addRule)', function(data) {
		vm.addRule();
		return false;
	});
	// 监听提交
	form.on('submit(updateRule)', function(data) {
		vm.updateRule();
		return false;
	});
	// 监听提交
	form.on('submit(deleteRule)', function(data) {
		vm.deleteRule();
		return false;
	});

});
var vm = new Vue({
	el : '#vcontroller',
	data : {
		currentPremission : {

		},
		showView : false,
		premission : {
			id : "",
			parentid : "",
			content : "",
			path : "",
			remark : ""
		}
	},
	methods : {
		loadPremission : function(node) {
			$.ajax({
				type : "post",
				url : baseApiPath + "/premission/all/list.do",
				data : node,
				async : false,
				success : function(data) {
					var premission = data.data;
					vm.premission.id = premission.id;
					vm.premission.parentid = premission.parentid;
					vm.premission.content = premission.content;
					vm.premission.path = premission.path;
					vm.premission.remark = premission.remark;
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(JSON.parse(jqXHR.responseText).message);
				}
			});
		},
		addRule : function(callBack) {
			// vm.premission.parentid = vm.premission.id;
			// vm.premission.id = null;
			$.ajax({
				type : "post",
				url : baseApiPath + "/premission/add.do",
				data : vm.premission,
				success : function(data) {
					alert(data.message);
					if(callBack){
						callBack();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(JSON.parse(jqXHR.responseText).message);
				}
			});
		},
		updateRule : function() {
			$.ajax({
				type : "post",
				url : baseApiPath + "/premission/update.do",
				data : vm.premission,
				success : function(data) {
					alert(data.message);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(JSON.parse(jqXHR.responseText).message);
				}
			});
		},
		deleteRule : function() {
			$.ajax({
				type : "post",
				url : baseApiPath + "/premission/delete.do",
				data : vm.premission,
				success : function(data) {
					alert(data.message);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(JSON.parse(jqXHR.responseText).message);
				}
			});
		}
	}
});

function getNodes() {
	var nodes;
	$.ajax({
		type : "post",
		url : baseApiPath + "/premission/all/list.do",
		async : false,
		success : function(data) {
			nodes = data.data;
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert(JSON.parse(jqXHR.responseText).message);
		}
	});
	for ( var index in nodes) {
		traverseTree(nodes[index]);
	}

	// console.log(nodes);
	return nodes;
}

// 遍历单个节点
function addNodeName(node) {
	node['name'] = node['content'];
	// if(selectedRoles.contains(node['name'])){
	// node["checked"]=true;
	// node["open"]=true
	// }
}

// 递归遍历树
function traverseTree(node) {
	if (!node) {
		return;
	}
	addNodeName(node);
	if (node.children && node.children.length > 0) {
		var i = 0;
		for (i = 0; i < node.children.length; i++) {
			this.traverseTree(node.children[i]);
		}
	} else {
		delete node.children;
	}
}