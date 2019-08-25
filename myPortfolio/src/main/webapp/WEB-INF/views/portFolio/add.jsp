<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 등록</title>
<style>
.portfolio-add-content-box{width:1024px; margin:0 auto; padding-top:200px;}
</style>
</head>
<jsp:include page="../gnb/nav.jsp" flush="true" />
<body>
<div class="portfolio-add-content-box">
	<form action="add" method="post">
		<label>제목</label>
		<input type="text" name="bTitle"/>
		<label>작성자</label>
		<input type="text" name="bWriter"/>
		<label>내용</label>
		<input type="text" name="bContents"/>
		<button type="submit">전송</button>	
	</form>
</div>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>