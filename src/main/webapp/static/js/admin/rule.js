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
			beforeDrag : beforeDrag,
			beforeEditName : beforeEditName,
			beforeRemove : beforeRemove,
			beforeRename : beforeRename
		}
	};
	var zNodes = [];
	var log, className = "dark";
	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	function beforeEditName(treeId, treeNode) {
		className = (className === "dark" ? "" : "dark");
		var zTree = $.fn.zTree.getZTreeObj("ztree");
		zTree.selectNode(treeNode);
		setTimeout(function() {
			if (confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？")) {
				setTimeout(function() {
					zTree.editName(treeNode);
				}, 0);
			}
		}, 0);
		return false;
	}
	function beforeRemove(treeId, treeNode) {
		className = (className === "dark" ? "" : "dark");
		var zTree = $.fn.zTree.getZTreeObj("ztree");
		zTree.selectNode(treeNode);
		return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
	}
	function beforeRename(treeId, treeNode, newName, isCancel) {
		className = (className === "dark" ? "" : "dark");
		if (newName.length == 0) {
			setTimeout(function() {
				var zTree = $.fn.zTree.getZTreeObj("ztree");
				zTree.cancelEditName();
				alert("节点名称不能为空.");
			}, 0);
			return false;
		}
		return true;
	}
	var newCount = 1;
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
				layer.open({
					type : 1,
					title : "增加节点",
					area : [ '450px', '300px' ],
					skin : 'layui-layer-rim', // 加上边框
					content : $('#select'),
					btn : [ '确定', '取消' ],
					yes : function(index, layero) {
						vm.premission.parentid = treeNode.id;
						vm.addRule();
						var zTree = $.fn.zTree.getZTreeObj("ztree");
						zTree.addNodes(treeNode, {
							id : 100,
							pId : treeNode.id,
							name : vm.premission.content
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
		$.fn.zTree.init($("#ztree"), setting, zNodes);
		$("#selectAll").bind("click", selectAll);
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
		addRule : function() {
//			vm.premission.parentid = vm.premission.id;
//			vm.premission.id = null;
			$.ajax({
				type : "post",
				url : baseApiPath + "/premission/add.do",
				data : vm.premission,
				success : function(data) {
					alert(data.message);
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
}

// 递归遍历树
// 作者：张超
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
	}
}