<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<style>
/* 	인코딩 */
	@charset "utf-8";
	/* 웹 폰트 */
	@font-face {
	font-family:ngwoff;
	src:url('/tpl/font/NanumGothic.woff')
	}
	@font_face {
	font-family:ngeot;
	src:url('/tpl/font/NanumGothic.eot');
	}
	@font-face {
	font-family:NanumGothic;
	src:url('/tpl/font/NanumGothic.ttf');
	}
	
/* 	클리어 코드 */
	html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td { margin:0; padding:0 }
	body, input, textarea, select, button, table { font-size:14px; font-family:'나눔고딕', NanumGothic, Helvetica, AppleGothic, Sans-serif, ngwoff, ngeot, '굴림', gulrem; }
	html, body { height: 100%; padding:0; margin:0; }
	img, fieldset { border:0 }
	ul, ol { list-style:none }
	em, address { font-style:normal }
	a { text-decoration:none }
	a:hover, a:active, a:focus { text-decoration:underline }
	
/* 	body{background: black;} */
	/* 네비 */
	.nav-menu{width: 100%; list-style-type: none; margin:0 auto; padding:0; text-align:center; overflow: hidden; background-color: #191919; position: fixed; z-index:999;}
	.nav-menu li{display:inline-block;}
	.nav-menu li a{display:block; color:white; text-align:center; padding:0px 20px; line-height:64px; text-decoration: none; font-size:14px; font-weight:660;}
	.nav-menu li a:hover{background-color: #111;}
	#title-span{font-size:8px;}
</style>
</head>
<body>
<nav>
		<ul class="nav-menu">
			<li><h1><a href="${pageContext.request.contextPath}/">B<span id="title-span">portFolio</span></a></h1></li>
			<li><a href="${pageContext.request.contextPath}/portFolio/list">PortFolio List</a></li>
			<li><a href="${pageContext.request.contextPath}/portFolio/add">Create PortFolio</a></li>
			<c:choose>
				<c:when test="${sessionScope.user eq null}">
				<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</body>
</html>