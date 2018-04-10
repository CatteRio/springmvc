//重写alert
window.alert = function(msg, callback) {
	layer.alert(msg, function(index) {
		layer.close(index);
		if (typeof (callback) === "function") {
			callback("ok");
		}
	});
}

// 重写confirm式样框
window.confirm = function(msg, callback) {
	layer.confirm(msg, {
		btn : [ '确定', '取消' ]
	}, function() {// 确定事件
		if (typeof (callback) === "function") {
			callback("ok");
		}
	});
}

// 深复制对象方法
function cloneObj(obj) {
	var newObj = {};
	if (obj instanceof Array) {
		newObj = [];
	}
	for ( var key in obj) {
		var val = obj[key];
		newObj[key] = typeof val === 'object' ? cloneObj(val) : val;
	}
	return newObj;
};