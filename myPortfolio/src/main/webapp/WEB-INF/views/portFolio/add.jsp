<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 등록</title>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
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
<!-- 		<input type="text" name="bContents"/> -->
		<textarea name="bContents" id="bContents" rows="10" cols="20">
			내용을 입력하세요..
		</textarea>
		<button type="submit">전송</button>	
	</form>
</div>
<script>
	window.onload = function(){
		CKEDITOR.replace("bContents",{
			width:'100%',
			height:'400px',
			filebrowserUploadUrl :"${pageContext.request.contextPath}/portFolio/imgUp",//클릭해서 이미지 업로드
			uploadUrl : "${pageContext.request.contextPath}/portFolio/drag" //드래그앤 드랍
		
		});	
		CKEDITOR.on('dialogDefinition', function( ev ){
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;
          
            switch (dialogName) {
                case 'image': //Image Properties dialog
                    //dialogDefinition.removeContents('info');
                    dialogDefinition.removeContents('Link');
                    dialogDefinition.removeContents('advanced');
                    break;
            }
        });
	}
</script>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>