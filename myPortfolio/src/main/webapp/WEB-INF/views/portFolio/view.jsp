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
				&#46;
				${viewItem.bTitle}
			</p>
			<p class="insideTitle insideTitleTwo">
				프로젝트 개요
			</p>
			<p class="bSummary">
				${viewItem.bSummary}
			<p/>
			<div class="insideDateAndGest">
				<div class="date">
					<p class="insideTitle insideTitleTwo">프로젝트 기간
					</p>
					<div style="margin-top: 15px;">
						<p>${viewItem.bStartTs} &#126; ${viewItem.bEndTs}	</p>
					</div>
				</div>
				<div class="contour"></div>
				<div class="Gest">
					<p class="insideTitle insideTitleTwo">
						프로젝트 인원
					</p>
					<div style="margin-top: 15px;">
						<p>
							${viewItem.bUserCnt}  명
						</p>
					</div>
				</div>
			</div>
			<div>
				<p class="insideTitle insideTitleTwo">
					프로젝트 목적	
				</p>
				<P class="bPurposeP"> ${viewItem.bPurpose}</P>
			</div>
		</div>
		<div class="mainLayoutInSindBlock InSindBlockTwo" >
			<div class="Attachments">
			<p class="insideTitle insideTitleTwo">
				첨부파일
			</p>
			<div>
			<div class="layoutEveyone">
				<span class="fileUploadLayout">
							  <c:forEach var="fVo" items="${fileList}">
							  	<div>
							  		<p class="fileNameList">${fVo.fOName}</p>
							 	 </div>
							</c:forEach>
                </span>
			</div>
			</div>
			</div>
			<div class="setting">
			<p class="insideTitle insideTitleTwo developmentEnvironment">
				개발환경
			</p>
			<div class="settingCheckBox">
				<div class="settingCheckBoxInDivBox"><P>DB</P>    	<p>${viewItem.bDb}</p></div>
				<div class="settingCheckBoxInDivBox"><P>Tool</P>  	<p>${viewItem.bTool}</p></div>
				<div class="settingCheckBoxInDivBox"><P>Language</P>	<p>${viewItem.bLanguage}</p></div>
				<div class="settingCheckBoxInDivBox"><P>Etc</P>   	<p>${viewItem.bEtc}</p></div>
			</div>
			</div>
		</div>
	</div>
	<div class="submitButtonLayOut">
	<div class="submitButton" >
		<a href="${pageContext.request.contextPath}/portFolio/add?bNo=${viewItem.bNo}">
			<input type="button" id="submitBtn" value="수정하기">
		</a>
		<a href="${pageContext.request.contextPath}/portFolio/delete?bNo=${viewItem.bNo}">
			<input type="button" id="submitBtn" value="삭제하기">
		</a>
	</div>
	</div>
</article>
<jsp:include page="../gnb/footer.jsp" flush="true" />
<%-- 	<a href="${pageContext.request.contextPath}/portFolio/add?bNo=${viewItem.bNo}">수정하기</a>
	<a href="${pageContext.request.contextPath}/portFolio/delete?bNo=${viewItem.bNo}">삭제하기</a> --%>
	
</body>
</html>