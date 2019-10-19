<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<style>
/* 	body{background: black;} */
	/* 네비 */
	body {margin:0px;}
	.nav-menu{width: 100%; height:80px;opacity:0.9; list-style-type: none; margin:0 auto; padding:0; text-align:center; overflow: hidden; background-color: #191919; position: fixed; z-index:999;}
	.nav-menu li{display:inline-block;width:280px;position: relative; }
	.nav-menu li a{display:block; height: 40px;padding: 20px 0;color:white; text-align:center; text-decoration: none;font-size:24pt; font-family: "NanumSquare";}
	.nav-menu li a:hover{background-color: #111;}
	#title-span{font-size:8px;}
	.nav-menu li a img{height:80px;}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/comm/css/gnb.css">
</head>
<body>
<nav>
		<ul class="nav-menu">
			<li style="width: 360px;"><a href="${pageContext.request.contextPath}/"  style="text-align: left; padding: 0px 0px; height:80px;"><img src="${pageContext.request.contextPath}/resources/img/Logo.png"></a></li>
			<li style="bottom: 33px;"><a href="${pageContext.request.contextPath}/portFolio/list">List</a></li>
			<li style="bottom: 33px;"><a href="${pageContext.request.contextPath}/portFolio/add">Create</a></li>
			<c:choose>
				<c:when test="${sessionScope.user eq null}">
				<li style="bottom: 33px;"><a href="${pageContext.request.contextPath}/login">Login</a></li>
				</c:when>
				<c:otherwise>
				<li style="bottom: 33px;"><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	var path = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/comm.js"></script>
</html>