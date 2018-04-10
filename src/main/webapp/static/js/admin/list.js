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
		field : 'role',
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

		if (layEvent === 'detail') { // 查看

		} else if (layEvent === 'del') { // 删除
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

		}
	});
});

var vm = new Vue({
	el : '#vcontroller',
	data : {
		showList : true,
		showAdd : false,
		selectInput : ""
	},
	methods : {
		showAddView : function() {
			this.showAdd = true;
			this.showList = false;
		},
		showListView : function() {
			this.showAdd = false;
			this.showList = true;
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
					data : {"users":checkStatus.data},
					success : function(data) {
						alert(data.message);
						tableins.reload();
					}
				});
				layer.close(index);
			});
			
			
			console.log(checkStatus);
		}
	}
})