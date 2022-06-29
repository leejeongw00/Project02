<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<script src="<%=request.getContextPath()%>/resources/jQuery/jquery-3.6.0.min.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">


<style type="text/css">
nav .navbar-nav a.nav-link {
	font-weight: bold;
	color: #2c3e50 !important;
}

nav .navbar-nav  a.nav-link.active {
	color: #42b983 !important;
}

</style>
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="z-index: 2000;">
		<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/Home/Main.jsp"> <img alt="logo"
				src="../resources/img/엠블럼.jpg" style="height: 35px;" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>


			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto ">
					<li class="nav-item "><a class="nav-link active" href="${pageContext.request.contextPath}/Home/Main.jsp">홈
							<span class="sr-only"></span>
					</a></li>
					<li class="nav-item "><a class="nav-link active" href="${pageContext.request.contextPath}/Home/list.do">커뮤니티
							<span class="sr-only"></span>
					</a></li>
					<li class="nav-item "><a class="nav-link active" href="${pageContext.request.contextPath}/Home/schedule.do">일정
							<span class="sr-only"></span>
					</a></li>
					<li class="nav-item "><a class="nav-link active" href="${pageContext.request.contextPath}/Home/record.do">기록
							<span class="sr-only"></span>
					</a></li>
					<li class="nav-item "><a class="nav-link active" href="${pageContext.request.contextPath}/Home/memberview.do">멤버
							<span class="sr-only"></span>
					</a></li>
					<c:choose>
						<c:when test="${empty USER_ID}">
							<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/member/register.do">회원가입</a></li>
						</c:when>
						<c:when test="${ USER_ID == 'admin' }">
							<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin/admin.do">관리자페이지</a></li>
							<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/modify.do">회원수정</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/modify.do">회원수정</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
						
						</c:otherwise>
					</c:choose>
					
					
				</ul>

			</div>
		</div>
	</nav>
	
</body>
</html>
