layui.use('tree', function() {
	layui.tree({
		elem : '#laytree',
		nodes : getNodes(),
		click : function(node) {
			vm.loadPremission(node);
			vm.showView = true; // node即为当前点击的节点数据
		}
	});
});
var vm = new Vue({
	el : '#vcontroller',
	data : {
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