<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add.css" type="text/css">
<style>

</style>
</head>
<jsp:include page="../gnb/nav.jsp" flush="true" />
<%-- <jsp:include page="../gnb/listNav.jsp" flush="true" /> --%>
<body>
<form action="" method="post" id="">
<article class="main">
	<div class="mainLayout">
		<div class="mainLayoutInSindBlock InSindBlockOne" >
			<p class="insideTitle">
				프로젝트 제목
				<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
			</p>
			<input name="bTitle" class="insideTitleInput"/>
			<p class="insideTitle insideTitleTwo">
				프로젝트 개요
				<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
			</p>
			<input name="bSummary" class="insideTitleInput"/>
			<div class="insideDateAndGest">
				<div class="date">
					<p class="insideTitle insideTitleTwo">프로젝트 기간
					<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
					</p>
					<div style="margin-top: 15px;">
						<input name="bStartTs" class="inside left datePic" readonly="readonly">
					  ~  
						<input name="bEndTs" class="inside right datePic"  readonly="readonly">
					</div>
				</div>
				<div style="background: #aaa;margin-top: 20px;"></div>
				<div class="Gest">
				<p class="insideTitle insideTitleTwo">
				프로젝트 인원
				<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
				</p>
				<div style="margin-top: 15px;">
				<input name="bUserCnt" class="insideTitleInputGest inside"/>
				</div>
				</div>
			</div>
			<div>
			<p class="insideTitle insideTitleTwo">
				프로젝트 목적
			<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
			</p>
			<textarea name="bPurpose" class="insideTitleInput purpose"> </textarea>
			</div>
		</div>
		<div class="mainLayoutInSindBlock InSindBlockTwo" >
			<div class="Attachments">
			<p class="insideTitle insideTitleTwo" style="margin: 10px 0 15px 0;">
				첨부파일
			<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
			</p>
			<div>
			<div class="layoutEveyone">
				<span class="fileUploadLayout">
                     <input type="file" id="fileInput" name="files[]" hidden="true" multiple="multiple"/>
                     <input type="text" name="fileNameInput" class="fileUpload" id="fileNameInput" value="" readonly="readonly"/>
                     <button id="fileSearch" type="button">찾아보기</button>			
				</span>
			</div>
			<div id="fileList">
			<p style="color: #aaa;">복수파일을 선택하고 싶을 시</p><p style="color:#aaa;font-size: 8pt;"> 찾아보기 > 파일선택자에서 Crtl키를 누르고 </p><p style="color:#aaa;font-size: 8pt;"> 중복 선택하시면 됩니다.</p>
			</div>
			</div>
			</div>
			<div class="setting">
			<p class="insideTitle insideTitleTwo" style="margin: 10px 0 15px 0;">
				개발환경
			<span style="font-size: 10pt;color:#ff0061;">선택사항</span>
			</p>
			<div class="settingCheckBox">
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">DB</P><input type="text"  name="bDb" style="width:90%;padding: 5px;margin-top: 10px;" /></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Tool</P><input type="text"  name="bTool"  style="width:90%;padding: 5px;margin-top: 10px;" /></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Language</P><input type="text"  name="bLanguage"  style="width:90%;padding: 5px;margin-top: 10px;" /></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Etc</P><input type="text"  name="bEtc" style="width:90%;padding: 5px;margin-top: 10px;" /></div>
			</div>
			</div>
		</div>
	</div>
	<div style="margin: 20px auto;width:1200px;height: 30px;position: relative;"><input type="submit" value="작성완료" style="width:120px; margin: 0 auto; border-radius: 10px;  height: 40px; position: absolute; left: 50%;transform:translate(-50%, 0);background-color: #ff0061;border: 1px #fec194;color: white;cursor: pointer; font-size: 14pt;"></div>
</article>
</form>
<script src="${pageContext.request.contextPath}/resources/js/fileUp.js"></script>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>