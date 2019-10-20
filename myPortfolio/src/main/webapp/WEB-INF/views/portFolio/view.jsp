<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	${viewItem.bNo}
	${viewItem.bTitle}
	${viewItem.bSummary}
	${viewItem.bRegTs}
	${viewItem.bViews}
	${viewItem.bStartTs}
	${viewItem.bEndTs}
	${viewItem.bUserCnt}
	${viewItem.bPurpose}
	${viewItem.bDb}
	${viewItem.bTool}
	${viewItem.bLanguage}
	${viewItem.bEtc}
	<h3>첨부파일</h3>
	<!-- 첨부파일 부분 진행중 다운로드 되게 만들것임 구조 잡아주셈 -->
	<c:choose>
		<c:when test="${fileList.size() > 0}">
			<c:forEach var="file" items="${fileList}">
<%-- 			${file.fNo} --%>
			${file.fOName}
<%-- 			${file.fPName} --%>
<%-- 			${file.fVolume} --%>
<%-- 			${file.fDir} --%>
			<a href="${pageContext.request.contextPath}/portFolio/downLoad?fNo=${file.fNo}">다운로드</a>
			</c:forEach>
		</c:when>
		<c:otherwise>
		<p>등록된 파일이 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<a href="${pageContext.request.contextPath}/portFolio/add?bNo=${viewItem.bNo}">수정하기</a>
	<a href="${pageContext.request.contextPath}/portFolio/delete?bNo=${viewItem.bNo}">삭제하기</a>
</body>
</html>