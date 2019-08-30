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
	.pagination-box{text-align: center; margin:0 auto;}
	.pagination-box ul {width:500px; margin:0 auto;}
	.pagination-box li {display:inline-block; margin:5px 2px;}
	.pagination-box a{color:#fff;}
	.current-page a{color:red;}
</style>
</head>
<jsp:include page="../gnb/nav.jsp" flush="true" />
<body>
<div class="portfolio-list-contents-box">
	<div>
		<div>
<!-- 			action이 없기 때문에 현재와 같은 주소로 이동 (list)-->
			<form method="get" action="">
				<select name="searchMode">
					<option value="1">글 번호</option>
					<option value="2">제목</option>
					<option value="3">작성자</option>
				</select>
				<input name="keyword" type="text" value=""/>
				<input type="submit" value="검색" />
			</form>
		</div>
	</div>
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