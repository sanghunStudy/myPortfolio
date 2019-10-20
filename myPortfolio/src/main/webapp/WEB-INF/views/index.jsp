<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</head>
<jsp:include page="./gnb/nav.jsp" flush="true" />
<body>
<!-- 	<nav> -->
<!-- 		<ul class="nav-menu"> -->
<%-- 			<li><h1><a href="${pageContext.request.contextPath}/">B<span id="title-span">portFolio</span></a></h1></li> --%>
<!-- 			<li><a href="#">PortFolio View</a></li> -->
<%-- 			<li><a href="${pageContext.request.contextPath}/portFolio/add">Create PortFolio</a></li> --%>
<!-- 			<li><a href="#">Login</a></li> -->
<!-- 		</ul> -->
<!-- 	</nav> -->
		<article id="content-box">
			<section class="content-section content-section-one section0">
				<div class="animated animatedFadeInUp fadeInUp">
					<div class="content-title">
						<p>I'm Developer</p>
					</div>
					<div class="content-sub-title">
						<p>한 차원, 다른 신입</p>
						<p>웹 개발자를 찾으십니까?</p>
					</div>
				</div>
			</section>
			<section class="content-section content-section-two section1_item">
			<div class="my-skill animated animatedFadeInUp fadeInUp">
			<h5 style="margin: 0;"><span>01</span>활용 가능 기술</h5>
				<div>
					<h6>LANGUAGE</h6>
					<p>HTML5</p>
					<p>CSS3</p>
					<p>JAVA</p>
					<p>JAVASCRIPT</p>
<!-- 					<p>python</p> -->
<!-- 					<p>c</p> -->
<!-- 					<p>node.js</p> -->
				</div>
				<div>
					<h6>FRAMEWORK</h6>
					<p>SPRING</p>
					<p>MYBATIS</p>
					<br/>
					<br/>
				</div>
				<div>
					<h6>DATABASE</h6>
					<p>MYSQL</p>
					<p>ORACLE</p>
					<br/>
					<br/>
				</div>
			</div>
			</section>
			<section class="content-section content-section-three section2-wrap">
				<div class="my-portfolio">
					<h5 style="margin-top: 100px;"><span>02</span>포트폴리오</h5>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</section>
			<section class="content-section content-section-four section3_item">
			</section>
		<jsp:include page="./gnb/footer.jsp" flush="true" />
		</article>
</body>
</html>
