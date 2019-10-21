<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/view.css" type="text/css">
<body>
<jsp:include page="../gnb/nav.jsp" flush="true" />
<article class="main">
	<div class="mainLayout">
		<div class="mainLayoutInSindBlock InSindBlockOne" >
			<p class="insideTitle">
				${viewItem.bNo}
				${viewItem.bTitle}
			</p>
			<input name="bTitle" class="insideTitleInput" value="${vo.bTitle}"/>
			<p class="insideTitle insideTitleTwo">
				프로젝트 개요
			</p>
			<p>
				${viewItem.bSummary}
			<p/>
			<div class="insideDateAndGest">
				<div class="date">
					<p class="insideTitle insideTitleTwo">프로젝트 기간
					</p>
					<div style="margin-top: 15px;">
						<p>${viewItem.bStartTs}</p>
					  	~  
						<p>${viewItem.bEndTs}	</p>
					</div>
				</div>
				<div style="background: #aaa;margin-top: 20px;"></div>
				<div class="Gest">
					<p class="insideTitle insideTitleTwo">
						프로젝트 인원
					</p>
					<div style="margin-top: 15px;">
						<p>
							${viewItem.bUserCnt}
						</p>
					</div>
				</div>
			</div>
			<div>
			<p class="insideTitle insideTitleTwo">
				프로젝트 목적	
			</p>
			<textarea name="bPurpose" class="insideTitleInput purpose"> ${viewItem.bPurpose}</textarea>
			</div>
		</div>
		<div class="mainLayoutInSindBlock InSindBlockTwo" >
			<div class="Attachments">
			<p class="insideTitle insideTitleTwo" style="margin: 10px 0 15px 0;">
				첨부파일
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
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">DB</P>    	<p>${viewItem.bDb}</p></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Tool</P>  	<p>${viewItem.bTool}</p></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Language</P>	<p>${viewItem.bLanguage}</p></div>
				<div style="margin-bottom: 10px;"><P style="color:#444;font-size: 12pt;font-weight: bold;">Etc</P>   	<p>${viewItem.bEtc}</p></div>
			</div>
			</div>
		</div>
	</div>
	<div style="margin: 20px auto;width:1200px;height: 30px;position: relative;"><input type="button" id="submitBtn" value="작성완료" style="width:120px; margin: 0 auto; border-radius: 10px;  height: 40px; position: absolute; left: 50%;transform:translate(-50%, 0);background-color: #ff0061;border: 1px #fec194;color: white;cursor: pointer; font-size: 14pt;"></div>
</article>
<jsp:include page="../gnb/footer.jsp" flush="true" />
<%-- 	<a href="${pageContext.request.contextPath}/portFolio/add?bNo=${viewItem.bNo}">수정하기</a>
	<a href="${pageContext.request.contextPath}/portFolio/delete?bNo=${viewItem.bNo}">삭제하기</a> --%>
	
</body>
</html>