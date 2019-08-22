<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Home</title>	
	<style>
/* 	인코딩 */
	@charset "utf-8";
	/* 웹 폰트 */
	@font-face {
	font-family:ngwoff;
	src:url('/tpl/font/NanumGothic.woff')
	}
	@font_face {
	font-family:ngeot;
	src:url('/tpl/font/NanumGothic.eot');
	}
	@font-face {
	font-family:NanumGothic;
	src:url('/tpl/font/NanumGothic.ttf');
	}
	
/* 	클리어 코드 */
	html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td { margin:0; padding:0 }
	body, input, textarea, select, button, table { font-size:14px; font-family:'나눔고딕', NanumGothic, Helvetica, AppleGothic, Sans-serif, ngwoff, ngeot, '굴림', gulrem; }
	html, body { height: 100%; padding:0; margin:0; }
	img, fieldset { border:0 }
	ul, ol { list-style:none }
	em, address { font-style:normal }
	a { text-decoration:none }
	a:hover, a:active, a:focus { text-decoration:underline }
	
	body{background: black;}
	/* 네비 */
	.nav-menu{width: 100%; list-style-type: none; margin:0 auto; padding:0; text-align:center; overflow: hidden; background-color: #191919; position: fixed; z-index:999;}
	.nav-menu li{display:inline-block;}
	.nav-menu li a{display:block; color:white; text-align:center; padding:0px 20px; line-height:64px; text-decoration: none; font-size:14px; font-weight:660;}
	.nav-menu li a:hover{background-color: #111;}
	#title-span{font-size:8px;}
	
	/* 	떠오르는 효과 */	
	@keyframes fadeInUp {
	    from {
	        transform: translate3d(0,40px,0)
	    }
	    to {
	        transform: translate3d(0,0,0);
	        opacity: 1
	    }
	}
	
	@-webkit-keyframes fadeInUp {
	    from {
	        transform: translate3d(0,40px,0)
	    }
	    to {
	        transform: translate3d(0,0,0);
	        opacity: 1
	    }
	}
	.animated {animation-duration: 1s; animation-fill-mode: both; -webkit-animation-duration: 1s; -webkit-animation-fill-mode: both}
	.animatedFadeInUp {opacity: 0;}
	.fadeInUp {opacity: 0; animation-name: fadeInUp; -webkit-animation-name: fadeInUp;}

	
	/*컨텐츠 박스 */
	#content-box{width:100%; height:4000px;}
	.content-sub-box{width:820px; height:670px; position: relative; background-color: #191919; top: -300px; background-color: #19191A; left: 50%; transform: translateX(-50%);}
	.content-section{width:100%; color:#fff;}
	.content-section-one{width:1024px; height:25%;  margin:0 auto; background:black;  background-image:url('${pageContext.request.contextPath}/resources/img/content-1.jpg'); text-align: center; background-repeat:no-repeat; background-position:center center; background-size:cover; background-attachment:fixed;}
	.content-section-two{height:25%; background-image:url('${pageContext.request.contextPath}/resources/img/content-2.jpg'); background-repeat:no-repeat; background-position:top center; background-size:cover; background-attachment:fixed;}
	.content-section-three{height:25%; background-repeat:no-repeat; background-position:bottom center; background-size:cover; background-attachment:fixed;}
	.content-section-four{height:24%;}
	.content-footer{color: white; text-align: center; font-size: 0.8em;}
	.content-title{padding-top: 650px;}
	.content-title p{font-size:5em; color:#fff; font-weight:680; line-height: 1.6em;}
	.content-sub-title p{font-size:1.4em; color:#ffff; line-height: 1.5em;}
	.my-skill{text-align: center; font-size: 14pt; font-weight: 560; line-height: 45px; padding-top: 200px;}
	.my-skill div{display:inline-block; padding-top:50px; margin:0px 30px;}
	.my-skill h6{font-size:1.2em; color: #82B1C8;}
	.my-skill span{margin-right: 12px; color: #939DAB;}
	.my-skill h5,.my-portfolio h5{font-size: 2.0em;}
	.my-portfolio{text-align:center; font-size:15pt; padding-top:100px;}
	.my-portfolio span{margin-right: 12px; color: #939DAB;}
	.my-portfolio div{margin:150px 5px; display:inline-block; width:250px; height:250px; background-color:#fff;}
	</style>
</head>
<body>
	<nav>
		<ul class="nav-menu">
			<li><h1><a href="${pageContext.request.contextPath}/">B<span id="title-span">portFolio</span></a></h1></li>
			<li><a href="#">PortFolio View</a></li>
			<li><a href="#">Create PortFolio</a></li>
			<li><a href="#">Login</a></li>
		</ul>
	</nav>
		<article id="content-box">
			<section class="content-section content-section-one">
				<div class="animated animatedFadeInUp fadeInUp">
					<div class="content-title">
						<p>I'M</p>
						<p>A DEVELOPER</p>
					</div>
					<div class="content-sub-title">
						<p>한 차원 다른 신입</p>
						<p>웹 개발자를 찾으십니까?</p>
					</div>
				</div>
			</section>
			<section class="content-section content-section-two">
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
			<section class="content-section content-section-three">
				<div class="my-portfolio">
					<h5><span>02</span>포트폴리오</h5>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</section>
			<section class="content-section content-section-four">
			<div class="content-sub-box">
			</div>
			</section>
			<div class="content-footer">
			<p>© 2019 Proudly created with bsh</p>
			</div>
		</article>
</body>
</html>