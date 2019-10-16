<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>	
	<style>

	body{background: black;}
	/* 	떠오르는 효과 */	
	@keyframes fadeInUp {
	    from {
	        transform: translate3d(0,40px,0)
	    }
	    to {
	        transform: translate3d(0,0,0);
	        opacity: 0.6
	    }
	}
	
	@-webkit-keyframes fadeInUp {
	    from {
	        transform: translate3d(0,40px,0)
	    }
	    to {
	        transform: translate3d(0,0,0);
	        opacity: 0.6;
	    }
	}
	.animated {animation-duration: 1s; animation-fill-mode: both; -webkit-animation-duration: 1s; -webkit-animation-fill-mode: both}
	.animatedFadeInUp {opacity: 0;}
	.fadeInUp {opacity: 0; animation-name: fadeInUp; -webkit-animation-name: fadeInUp;}

	
	/*컨텐츠 박스 */
	#content-box{width:100%; height:4000px;}
	.content-sub-box{width:820px; height:670px; position: relative; background-color: #191919; top: -300px; background-color: #19191A; left: 50%; transform: translateX(-50%);}
	.content-section{width:100%; color:#fff;}
	.content-section-one{width:100%; height:25%;  margin:0 auto; background:black;  background-image:url('${pageContext.request.contextPath}/resources/img/coding-924920.jpg'); text-align: center; background-repeat:no-repeat; background-position:center center; background-size:cover; background-attachment:fixed;}
	.content-section-two{height:25%; background-image:url('${pageContext.request.contextPath}/resources/img/background-2462431_1920.jpg'); background-repeat:no-repeat; background-position:top center; background-size:cover; background-attachment:fixed;}
	.content-section-three{height:25%; background-repeat:no-repeat; background-position:bottom center; background-size:cover; background-attachment:fixed;background-image:url('${pageContext.request.contextPath}/resources/img/ocean-3605547_1920.jpg');}
	.content-section-four{height:24%;}
	.content-title{padding-top:100px;position:relative;top:350px;width: 1100px; margin: 0 auto; background: black;}
	.content-sub-title {padding-bottom:100px;position:relative; top:350px; margin: 0 auto;width: 1100px; background-color: black;}
	.content-title p{font-size:58pt; color:#fff; font-weight:680; line-height: 1.6em;font-family: "NanumMyeongjo";}
	.content-sub-title p{font-size:24pt; color:#ffff; line-height: 1.5em;font-family: "NanumMyeongjo"}
	.my-skill{text-align: center; font-size: 14pt; font-weight: 560; line-height: 45px; margin: 0 auto;
    width: 1200px; position: relative; top: 300px; opacity: 0.6;background:black; }
	.my-skill div{display:inline-block; padding-top:50px; margin:0px 30px;}
	.my-skill h6{font-size:1.2em; color: #82B1C8;}
	.my-skill span{margin-right: 12px; color: #939DAB;}
	.my-skill h5,.my-portfolio h5{font-size: 2.0em;}
	.my-portfolio{text-align:center; font-size:15pt; padding-top:100px;}
	.my-portfolio span{margin-right: 12px; color: #939DAB;}
	.my-portfolio div{margin:150px 5px; display:inline-block; width:250px; height:250px; background-color:#fff;}
	</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
			<h5><span>01</span>활용 가능 기술</h5>
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
					<h5><span>02</span>포트폴리오</h5>
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
