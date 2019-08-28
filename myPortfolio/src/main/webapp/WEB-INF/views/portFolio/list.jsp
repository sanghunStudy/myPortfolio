<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 목록</title>
<style>
	body{background:black;}
	.portfolio-list-contents-box{width:1024px; padding-top:120px; margin:0 auto; text-align:center;}
	.portfolio-list-contents-box .list-contents{width:350px; height:350px; margin:30px 30px; display:inline-block; background:#fff;}
	.pagination-box a{color:#fff;}
</style>
</head>
<jsp:include page="../gnb/nav.jsp" flush="true" />
<body>
<div class="portfolio-list-contents-box">
	<c:choose>
	 <c:when test="${list.size() > 0 }">
	 	<c:forEach var="item" items="${list}">
	 		<div class="list-contents">
		 		${item.bNo}
		 		<a href="${pageContext.request.contextPath}/portFolio/view?bNo=${item.bNo}">${item.bTitle}</a>
		 		${item.bWriter}
	 		</div>
	 	</c:forEach>
	 </c:when>
	 <c:otherwise>
	 	<p>등록된 포트폴리오가 없습니다.</p>
	 </c:otherwise>
	</c:choose>
	<div class="pagination-box">
		${pager.pagination}
	</div>
</div>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>