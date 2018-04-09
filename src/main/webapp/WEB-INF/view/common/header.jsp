<script src="${pageContext.request.contextPath}/static/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/common/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/static/common/common.js"></script>
<script src="${pageContext.request.contextPath}/static/common/md5.js"></script>
<script src="${pageContext.request.contextPath}/static/common/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/common/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/common/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
<script>
	var currentUser = {
		username:"<shiro:principal property="username"/>",
		nickname:"<shiro:principal property="nickname"/>"
	}
	var basePath = "${pageContext.request.contextPath}";
	var baseApiPath = "${pageContext.request.contextPath}/api";
</script>