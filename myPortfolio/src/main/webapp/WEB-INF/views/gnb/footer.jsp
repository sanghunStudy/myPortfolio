<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단</title>
<style>
.footerMenu {background-color: #313131;}
.content-footer{color: #777777; text-align: center; font-size: 0.8em; background:black;line-height: 30px;background-color: #313131;}
.content-section-four_indivLayout, .content-section-four_indivLayout a {
	color: white;
	list-style: none;
	font-size: 12pt;
	font-family: "NanumGothic";
}
.content-footer p {color:#777777;}
.content-section-four_indivLayout a {
	margin-right: 10px;
	color:#777777;
}
.content-section-four_indivLayout a:nth-last-child(n+1) {
	margin-left: 10px;
	color:#777777;
}
.content-section-four_indivLayout {
		width:1180px;
		margin: 0 auto;
		height: 50px;
		padding: 10px 10px;
		color:#777777;
	}
.footerTitle{
	padding: 5px 10px;
	font-size: 16pt;
	font-weight: bold;
	color:#777777;
	position: relative;
}
.footerPLayOut {
	    position: relative;
    width: 1200px;
    bottom: 25px;
}
.footerP{
	font-size: 12pt;
	color:#777777;
	font-weight: normal;
	text-align: center;
}
</style>
</head>
<body>
	<section class="footerMenu">
			<div class="content-section-four_indivLayout">
				<a href="${pageContext.request.contextPath}/">Main</a>|
				<a href="${pageContext.request.contextPath}/portFolio/list">List</a>|
				<a href="${pageContext.request.contextPath}/portFolio/add?bNo=0">Create</a>
				<div><p class="footerTitle"> CB PotFolio </p>
					<div class="footerPLayOut">
								<p class="footerP">대한민국 대전광역시 동구 동구 가양동 우암로 352-21</p>
							  	<p class="footerP">TEl 최종민 Tel 010-2740-1653 & 배상훈 Tel.010-8706-5885</p>
					</div>
				</div>
			</div>
			</section>
	<div class="content-footer">
	<p>© 2019 Proudly created with Cjm Bsh PortFolio</p>
	</div>
</body>
</html>