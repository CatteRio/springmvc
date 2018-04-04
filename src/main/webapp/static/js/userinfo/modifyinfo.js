var vm = new Vue({
	el : '#updateForm',
	data : {
		model:{
			username : currentUser.username,
			nickname : currentUser.nickname
		}
	},
	methods : {
		update : function() {
			if(this.username == ''){
				alert("请填写用户名!");
				return ;
			}
			if(this.nickname == ''){
				alert("请填写昵称!");
				return ;
			}
			$.ajax({
				url:basePath+"/user/update.do",
				data:this.model,
				type:"post",
				success:function(data){
					alert(data.message);
			    },
			    error:function(data){
			    	alert(data.message);
			    }
			});
		},
		reset : function(){
			this.model.username=currentUser.username;
			this.model.nickname=currentUser.nickname;
		}
	}
})