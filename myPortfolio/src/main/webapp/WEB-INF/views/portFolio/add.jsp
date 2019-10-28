<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function maxLengthCheck(object){
	   if (object.value.length > object.maxLength){
	    object.value = object.value.slice(0, object.maxLength);
	   }   
	  }

</script>
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
<form:form action="" method="post" id="addForm" commandName="board">
<form:errors path="*" cssClass="error"/>
<input type="hidden" name="bNo" id="bNo" value="${vo.bNo}">
<article class="main">
	<div class="mainLayout">
		<div class="mainLayoutInSindBlock InSindBlockOne" >
			<p class="insideTitle">
				프로젝트 제목
				<span class="insideSpan">필수사항</span>
			</p>
			<input name="bTitle" id="bTitle" class="insideTitleInput" value="${vo.bTitle}" autocomplete=”off” />
			<form:errors path="bTitle" cssClass="error"/>
			<p class="insideTitle insideTitleTwo">
				프로젝트 개요
				<span class="insideSpan">필수사항</span>
			</p>
			<input name="bSummary" id="bSummary" class="insideTitleInput" autocomplete=”off” value="${vo.bSummary}"/>
			<div class="insideDateAndGest">
				<div class="date">
					<p class="insideTitle insideTitleTwo">프로젝트 기간
					<span class="insideSpan">필수사항</span>
					</p>
					<div class="dateMargin">
						<c:choose>
							<c:when test="${vo.bNo != 0}">
								<input name="bStartTs" class="inside left bStartTs"  value="${vo.bStartTs}" readonly="readonly" autocomplete=”off”>
					  			~  
								<input name="bEndTs" class="inside right left bEndTs"  value="${vo.bEndTs}" readonly="readonly" autocomplete=”off”>
							</c:when>
							<c:otherwise>
								<input name="bStartTs" class="inside left datePic" readonly="readonly" autocomplete=”off”>
					  			~  
								<input name="bEndTs" class="inside right left datePic" readonly="readonly" autocomplete=”off”>							
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div style="background: #aaa;margin-top: 20px;"></div>
				<div class="Gest">
				<p class="insideTitle insideTitleTwo">
				프로젝트 인원
				<span class="insideSpan">필수사항</span>
				</p>
				<div class="dateMargin">
				<input type="number"  min="1" autocomplete=”off” id="bUserCnt" name="bUserCnt" maxlength="4" oninput="maxLengthCheck(this)" class="insideTitleInputGest inside"  value="${vo.bUserCnt}"/>
				</div>
				</div>
			</div>
			<div>
			<p class="insideTitle insideTitleTwo">
				프로젝트 목적
			<span class="insideSpan">필수사항</span>
			</p>
			<textarea name="bPurpose" id="bPurpose" class="insideTitleInput purpose"> ${vo.bPurpose}</textarea>
			</div>
		</div>
		<div class="mainLayoutInSindBlock InSindBlockTwo" >
			<div class="Attachments">
			<p class="insideTitle insideTitleTwo insideTitleMargin">
				첨부파일
			<span class="insideSpan">필수사항</span>
			</p>
			<div>
			<div class="layoutEveyone">
				<span class="fileUploadLayout">
                	<c:choose>
                		<c:when test="${vo.bNo != 0}">
							  <c:forEach var="fVo" items="${fileList}">
							  <div>
							  	<p class="fileNameList">${fVo.fOName}</p><a class="fileDel" data-code="${fVo.fNo}">삭제</a>
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
			<p class="fileListPOne">복수파일을 선택하고 싶을 시</p><p class="fileListPTwo"> 찾아보기 > 파일선택자에서 Crtl키를 누르고 </p><p style="color:#aaa;font-size: 8pt;"> 중복 선택하시면 됩니다.</p>
			</div>
			</div>
			</div>
			<div class="setting">
			<p class="insideTitle insideTitleTwo insideTitleMargin">
				개발환경
			<span class="insideSpan">선택사항</span>
			</p>
			<div class="settingCheckBox">
				<div class="settingCheckBoxinDiv"><P class="settingCheckBoxInPTag">DB		</P>		<input type="text"  name="bDb"  id="bDb" value="${vo.bDb}" class="settingCheckBoxInputTag"/></div>
				<div class="settingCheckBoxinDiv"><P class="settingCheckBoxInPTag">Tool		</P>		<input type="text"  name="bTool" id="bTool" value="${vo.bTool}" class="settingCheckBoxInputTag" /></div>
				<div class="settingCheckBoxinDiv"><P class="settingCheckBoxInPTag">Language	</P>		<input type="text"  name="bLanguage" id="bLanguage" value="${vo.bLanguage}" class="settingCheckBoxInputTag" /></div>
				<div class="settingCheckBoxinDiv"><P class="settingCheckBoxInPTag">Etc		</P>		<input type="text"  name="bEtc" id="bEtc" value="${vo.bEtc}" class="settingCheckBoxInputTag" /></div>
			</div>
			</div>
		</div>
	</div>
	<div style="margin: 20px auto;width:1200px;height: 30px;position: relative;">
		<input type="button" id="submitBtn" value="작성완료" >
	</div>
</article>
</form:form>
<script>
var seUser = "${user}";
var bStartTs = "${vo.bStartTs}";
var bEndTs = "${vo.bEndTs}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/fileUp.js"></script>
<jsp:include page="../gnb/footer.jsp" flush="true" />
</body>
</html>