<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${vo.bNo == 0}">
		<title>포트폴리오 등록</title>
	</c:when>
	<c:otherwise>
		<title>포트폴리오 수정</title>
	</c:otherwise>
</c:choose>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add.css" type="text/css">
</head>
<jsp:include page="../gnb/nav.jsp" flush="true" />
<body>
<form action="" method="post" id="addForm">
<input type="hidden" name="bNo" value="${vo.bNo}">
<article class="main">
	<div class="mainLayout">
		<div class="mainLayoutInSindBlock InSindBlockOne" >
			<p class="insideTitle">
				프로젝트 제목
				<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
			</p>
			<input name="bTitle" class="insideTitleInput" value="${vo.bTitle}"/>
			<p class="insideTitle insideTitleTwo">
				프로젝트 개요
				<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
			</p>
			<input name="bSummary" class="insideTitleInput"  value="${vo.bSummary}"/>
			<div class="insideDateAndGest">
				<div class="date">
					<p class="insideTitle insideTitleTwo">프로젝트 기간
					<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
					</p>
					<div style="margin-top: 15px;">
						<c:choose>
							<c:when test="${vo.bNo != 0}">
								<input name="bStartTs" class="inside left bStartTs"  value="${vo.bStartTs}" readonly="readonly">
					  			~  
								<input name="bEndTs" class="inside right bEndTs"  value="${vo.bEndTs}" readonly="readonly">
							</c:when>
							<c:otherwise>
								<input name="bStartTs" class="inside left datePic" readonly="readonly">
					  			~  
								<input name="bEndTs" class="inside right datePic" readonly="readonly">							
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div style="background: #aaa;margin-top: 20px;"></div>
				<div class="Gest">
				<p class="insideTitle insideTitleTwo">
				프로젝트 인원
				<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
				</p>
				<div style="margin-top: 15px;">
				<input name="bUserCnt" class="insideTitleInputGest inside"  value="${vo.bUserCnt}"/>
				</div>
				</div>
			</div>
			<div>
			<p class="insideTitle insideTitleTwo">
				프로젝트 목적
			<span style="font-size: 10pt;color:#ff0061;">필수사항</span>
			</p>
			<textarea name="bPurpose" class="insideTitleInput purpose"> ${vo.bPurpose}</textarea>
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
                	<c:choose>
                		<c:when test="${vo.bNo != 0}">
							  <c:forEach var="fVo" items="${fileList}">
							  <div>
							  	<p class="fileNameList">${fVo.fOName}</p><a class="fileDel">삭제</a>
							  </div>
							  </c:forEach>
                			 <input type="file" id="fileInput" name="files[]" hidden="true" multiple="multiple"/>
		                     <input type="text" name="fileNameInput" class="fileUpload" id="fileNameInput" value="" readonly="readonly"/>
		                     <button id="fileSearch" type="button">찾아보기</button>			
                		</c:when>
                		<c:otherwise>
	                		 <input type="file" id="fileInput" name="files[]" hidden="true" multiple="multiple"/>
		                     <input type="text" name="fileNameInput" class="fileUpload" id="fileNameInput" value="" readonly="readonly"/>
		                     <button id="fileSearch" type="button">찾아보기</button>			
                		</c:otherwise>
                	</c:choose>
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
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">DB</P><input type="text"  name="bDb"   value="${vo.bDb}" style="width:90%;padding: 5px;margin-top: 10px;" /></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Tool</P><input type="text"  name="bTool"  value="${vo.bTool}" style="width:90%;padding: 5px;margin-top: 10px;" /></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Language</P><input type="text"  name="bLanguage"  value="${vo.bLanguage}" style="width:90%;padding: 5px;margin-top: 10px;" /></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Etc</P><input type="text"  name="bEtc"  value="${vo.bEtc}" style="width:90%;padding: 5px;margin-top: 10px;" /></div>
			</div>
			</div>
		</div>
	</div>
	<div style="margin: 20px auto;width:1200px;height: 30px;position: relative;"><input type="button" id="submitBtn" value="작성완료" style="width:120px; margin: 0 auto; border-radius: 10px;  height: 40px; position: absolute; left: 50%;transform:translate(-50%, 0);background-color: #ff0061;border: 1px #fec194;color: white;cursor: pointer; font-size: 14pt;"></div>
</article>
</form>
<script>
var bStartTs = "${vo.bStartTs}";
var bEndTs = "${vo.bEndTs}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/fileUp.js"></script>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>