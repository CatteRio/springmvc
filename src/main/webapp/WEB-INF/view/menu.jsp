<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="permission" items="${permissions}">
	<c:choose>
		<c:when test="${permission.children.size() > 0}">
			<li><a href="javascript:;"> <i class="iconfont">&#xe6b8;</i>
					<cite>${permission.content}</cite> <i class="iconfont nav_right">&#xe697;</i>
			</a>
				<ul class="sub-menu">
					<c:set var="permissions" value="${permission.children}"
						scope="request" />
					<jsp:include page="menu.jsp" />
				</ul>
		</c:when>
		<c:otherwise>
			<li><a _href=".${permission.path}"> <i class="iconfont">&#xe6a7;</i>
					<cite>${permission.content}</cite>
			</a></li>
		</c:otherwise>
	</c:choose>
</c:forEach>