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
					<h5 style="margin-top: 100px;"><span>02</span>소개글</h5>
					<div class="portfolioDesignOne">
						<h1>개발자 배상훈</h1>
						<p>개발자로서 자질을 보여주고, 능력을 증명할수 있는 사람</p>
						<p>언제나 생각하고, 창의적으로 다가가며, 아이디어를 선점하는</p>
						<p>회사의 발전과 도약점이 되며</p>
						<p>그 발판에 제가 서있겠습니다.</p>
						<p>이상. 개발자 배상훈입니다.</p>			
					</div>
					<div class="portfolioDesignTwo">
						<h1>디자이너 최종민</h1>
						<p>동양적인 디자인, 몽환적인 디자인</p>
						<p>명암의 비율, 디자인적인 감각을 살려서</p>
						<p>주관적인 디자인, 퍼블리싱에 누구나 감탄 할 수 있게</p>
						<p>언제나 노력하겠습니다</p>
						<p>이상. 최종민입니다.</p>	
					</div>
				</div>
			</section>
		<jsp:include page="./gnb/footer.jsp" flush="true" />
		</article>
</body>
<style>
.content-section-one{
		background-image:url("${pageContext.request.contextPath}/resources/img/coding-924920.jpg"); 
		}
		.content-section-two{
		background-image:url('${pageContext.request.contextPath}/resources/img/background-2462431_1920.jpg');
		}
	.content-section-three{
	background-image:url('${pageContext.request.contextPath}/resources/img/ocean-3605547_1920.jpg');
	}
	.portfolioDesignOne {
			width:100%;
		}
	.portfolioDesignTwo {
		width:100%;
		}
</style>
</html>
