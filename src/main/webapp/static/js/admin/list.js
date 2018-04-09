/**
 * 
 */

layui.use('table', function() {
	var table = layui.table;
	// 第一个实例
	var tableins = table.render({
		elem : '#laytable',
		height : 500,
		url : baseApiPath + '/user/list.do', // 数据接口
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
		} ] ]
	});
	// 监听工具条
	table.on('tool(maintable)', function(obj) {
		var data = obj.data; // 获得当前行数据
		var layEvent = obj.event;
		var tr = obj.tr; // 获得当前行 tr 的DOM对象

		if (layEvent === 'detail') { // 查看

		} else if (layEvent === 'del') { // 删除
			layer.confirm('真的删除行么', function(index) {
				tableins.reload();

				layer.close(index);
			});
		} else if (layEvent === 'edit') { // 编辑

		}
	});
});