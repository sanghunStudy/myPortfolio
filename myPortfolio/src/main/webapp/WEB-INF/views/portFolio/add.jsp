<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 등록</title>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style>
*{outline:none;}
.portfolio-add-content-box{width:1024px; margin:0 auto; padding-top:200px;}
.main {width:1200px;height: 940px;margin:0 auto;}
.mainLayout {margin:0px 25px; height: 940px;display:grid;grid-template-columns: 750px 400px;}
.mainLayoutInSindBlock {height: 720px; display: inline-block;position: relative;top:100px;}
.InSindBlockOne {width:690px; background-color: #eee;padding: 10px;}
.InSindBlockTwo {width:330px;}
.Attachments,.setting {background-color: #eee;height: 360px;}
.Attachments {margin-bottom:10px;}
.insideTitle {color:#ff0061;font-size: 18pt;font-family: "NanumSquare";font-weight: bold;margin-top: 10px;}
.insideTitleInput { width:645px;padding: 5px 5px;margin-top: 10px;}
.insideTitleTwo {margin-top:30px;}
.insideDateAndGest {display: grid;grid-template-columns: 334px 2px 334px;height:150px;margin-top: 10px;}
.inside {width:100px;padding: 5px;margin-top:10px;}
.left {margin-right: 10px;}
.right {margin-left: 10px;}
.insideTitleInputGest {width:100px;}
.Gest {padding: 0px 20px;}
.purpose {height: 200px; padding:10px;}
</style>
</head>
<jsp:include page="../gnb/listNav.jsp" flush="true" />

<body>
<!-- <div class="portfolio-add-content-box">
	<form action="add" method="post">
		<label>제목</label>
		<input type="text" name="bTitle"/>
		<label>작성자</label>
		<input type="text" name="bWriter"/>
		<input type="text" name="bContents"/>
		<textarea name="bContents" id="bContents" rows="10" cols="20">
			내용을 입력하세요..
		</textarea>affdfdss
		<button type="submit">전송</button>	
	</form>
</div> -->
<!-- <script>
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
</script> -->
<article class="main">
	<div class="mainLayout">
		<div class="mainLayoutInSindBlock InSindBlockOne" >
			<p class="insideTitle">
				프로젝트 제목
			</p>
			<input class="insideTitleInput"/>
			<p class="insideTitle insideTitleTwo">
				프로젝트 개요
			</p>
			<input class="insideTitleInput"/>
			<div class="insideDateAndGest">
				<div class="date">
					<p class="insideTitle insideTitleTwo">프로젝트 기간</p>
					<div>
						<input class="inside left">
					  ~  
						<input class="inside right">
					</div>
				</div>
				<div style="background: #aaa;margin-top: 20px;"></div>
				<div class="Gest">
				<p class="insideTitle insideTitleTwo">
				프로젝트 개요
				</p>
				<input class="insideTitleInputGest inside"/>
				</div>
			</div>
			<div>
			<p class="insideTitle insideTitleTwo">
				프로젝트 목적
			</p>
			<input class="insideTitleInput purpose"/>
			</div>
		</div>
		<div class="mainLayoutInSindBlock InSindBlockTwo" >
			<div class="Attachments">
			</div>
			<div class="setting">
			</div>
		</div>
	</div>
</article>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>