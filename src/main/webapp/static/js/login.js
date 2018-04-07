var vm = new Vue({
	el : '#vcontroller',

	data : {
		show : true
	},
	methods : {
		register: function(flag){
			window.location.href=basePath + "/admin/register.do";
		}
	}
})