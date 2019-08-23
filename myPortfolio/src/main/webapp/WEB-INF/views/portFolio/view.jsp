<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	${viewItem.bNo}
	${viewItem.bTitle}
	${viewItem.bDate}
	${viewItem.bViews}
	${viewItem.bWriter}
	${viewItem.bContents}
	
	<a href="${pageContext.request.contextPath}/portFolio/update?bNo=${viewItem.bNo}">수정하기</a>
	<a href="${pageContext.request.contextPath}/portFolio/delete?bNo=${viewItem.bNo}">삭제하기</a>
</body>
</html>