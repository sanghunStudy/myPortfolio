<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 목록</title>
<style>
	.portfolio-list-contents-box{width:1024px; padding-top:200px; margin:0 auto;}
</style>
</head>
<jsp:include page="../gnb/nav.jsp" flush="true" />
<body>
<div class="portfolio-list-contents-box">
	<c:choose>
	 <c:when test="${list.size() > 0 }">
	 	<c:forEach var="item" items="${list}">
	 		${item.bNo}
	 		<a href="${pageContext.request.contextPath}/portFolio/view?bNo=${item.bNo}">${item.bTitle}</a>
	 		${item.bWriter}
	 	</c:forEach>
	 </c:when>
	 <c:otherwise>
	 	<p>등록된 포트폴리오가 없습니다.</p>
	 </c:otherwise>
	</c:choose>
</div>
</body>
</html>