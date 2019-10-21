<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 목록</title>
<style>
	*{outline: none;}
	body{background:white;}
	.portfolio-list-contents-box{width:1200px; padding-top:120px; margin:0 auto; text-align:center;height: 735px;}
	.portfolio-list-contents-box .list-contents{width:600px; height:50px; margin:10px auto; background:#fff;}
	.pagination-box{text-align: center; margin:0 auto;}
	.pagination-box ul {width:500px; margin:0 auto;}
	.pagination-box li {display:inline-block; margin:5px 2px;}
	.pagination-box a{color:#fff;}
	.current-page a{color:red;}
	.tag {height: 40px; padding: 5px 10px; border:none;}
	.search {height: 34px; border:none;}
	.submit {height: 30px;width: 60px;  
	background-color: #ff0061; 
	color:white; 
	font-family: "NanumSquare";
	background-image: url("${pageContext.request.contextPath}/resources/img/search.png");position: relative;bottom: 1px;
	background-repeat: no-repeat;
	background-position: 10px center;
	background-size: 30px 30px;cursor: pointer;}
	.submitLayout {
		border:1px solid gray; width:400px; height: 40px;margin: 0 auto;
	}
	.submitLayout form {display: grid;grid-template-columns:100px 300px 60px;}
</style>
</head>
<jsp:include page="../gnb/nav.jsp" flush="true" />
<%-- <jsp:include page="../gnb/listNav.jsp" flush="true" /> --%>
<body>
<div class="portfolio-list-contents-box">
	<div>
		<div class="submitLayout">
<!-- 			action이 없기 때문에 현재와 같은 주소로 이동 (list)-->
			<form method="get" action="">
				<select name="searchMode" class="tag" >
					<option value="1">글 번호</option>
					<option value="2">제목</option>
					<option value="3">작성자</option>
				</select>
				<input name="keyword" class="search" type="text" value=""/>
				<input type="submit" class="submit" style="width:60px;margin: 0px;height: 42px;" value="">
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
	 	<p style="height: 750px;font-size: 24pt;line-height: 700px;">등록된 포트폴리오가 없습니다.</p>
	 </c:otherwise>
	</c:choose>
	<div class="pagination-box">
		${pager.pagination}
	</div>
</div>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>