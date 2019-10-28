<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/comm/css/gnb.css">
</head>
<body>
<nav>
		<ul class="nav-menu">
			<li style="width: 360px;"><a href="${pageContext.request.contextPath}/"  style="text-align: left; padding: 0px 0px; height:80px;"><img src="${pageContext.request.contextPath}/resources/img/Logo.png"></a></li>
			<li style="bottom: 33px;"><a href="${pageContext.request.contextPath}/portFolio/list">List</a></li>
			<li style="bottom: 33px;"><a href="${pageContext.request.contextPath}/portFolio/add?bNo=0">Create</a></li>
			<c:choose>
				<c:when test="${sessionScope.user eq null}">
				<li style="bottom: 33px;" class="loginPopup"><a>Login</a></li>
				</c:when>
				<c:otherwise>
				<li style="bottom: 33px;"><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<div class="backGroundPopup">
	</div>
	<div class="Popup">
		<div class="popupClose"><img src="${pageContext.request.contextPath}/resources/img/close.png"></div>
		<p>Login</p>
		<div class="PopupBr"></div>
		<div class="PopupBrLoing">
			<form action="login" method="post">
				<input type="text" class="ID" name="id" autocomplete=”off” placeholder="ID" onkeyup="enterkey();">
				<input type="password" class="password" name="pw" placeholder="Password" onkeyup="enterkey();">
				<input type="submit" class="submit" value="로그인" onclick="login()">
			</form>
		<div class="PopupBr PopupBr2"></div>
		<div class="Explanation">
		</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	var path = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/comm/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/resources/comm/js/gnb.js"></script>
<script type="text/javascript">
var bNo = "${vo.bNo}";
$('.loginPopup').click(function() {
	$('.backGroundPopup').css({
	    "display": "block"
	});
	
	$('.Popup').css({
	    "display": "block"
	});
});
$('.popupClose').click(function() {
	$('.backGroundPopup').css({
	    "display": "none"
	});
	
	$('.Popup').css({
	    "display": "none"
	});
});
function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행할 내용
         login();
    } else { 
    	
    	return false;
    }
};


</script>

<style>
.ID {

		background-image: url("${pageContext.request.contextPath}/resources/img/idicon.png");
		background-repeat: no-repeat;
	}
.password {
		background-image: url("${pageContext.request.contextPath}/resources/img/passicon.png");
		background-repeat: no-repeat;
}
</style>
</html>