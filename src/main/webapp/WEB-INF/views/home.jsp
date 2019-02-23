<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code People</title>
<link rel="stylesheet" href="/resources/css/home/home.css">
<%@include file="/WEB-INF/views/include/style.jsp" %>

</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">
	<div class="main-banner row" style="margin-top:33px; box-shadow: 1px 0 12px 0 rgba(46, 61, 73, .15);">
		<div class="col-xs-4 banner-item" style="padding:20px;">
			<div>
				<a href="/paid/home.do?lang=java"><img alt="" src="/resources/img/user/banner/javabanner.png" style="width:100%;transition: 0.6s;"></a>
			</div>
		</div>
		
		<div class="col-xs-4 banner-item" style="padding:20px;">
			<div>
				<a href="/paid/home.do?lang=spring"><img alt="" src="/resources/img/user/banner/springbanner.png" style="width:100%;height:170px;"></a>
			</div>
		</div>
		<div class="col-xs-4 banner-item" style="padding:20px;">
			<div>
				<a href="/paid/home.do?lang=javascript"><img alt="" src="/resources/img/user/banner/javascriptbanner.png" style="width:100%;height:170px;"></a>
			</div>
		</div>
		
			<div class="sg-banner-overlay text-center" style="padding:0px;">
				<img src="/resources/img/user/banner/samplebanner.PNG" style="height:211px;float:left;">
				<div style="display:inline-block;padding:30px;color:#fa6465;">
					<h1 class="sg-main-title">Premium Lecture</h1>
					<p>초보부터 개발자 취업까지</p>
				</div>
			</div>
			
	</div>
		<div class="main-banner row" style="margin-top:10px; box-shadow: 1px 0 12px 0 rgba(46, 61, 73, .15);margin-top:20px;">
		<div class="banner-item" style="padding:20px;">
			<div>
				<a href="/free/list.do">
					<img alt="" src="/resources/img/user/banner/free.png" style="width:26%;">
					<span style="width:70%;display:inline-block;font-size:18px;">
						입문자에게 가장 어려운일은 ‘시작’ 이죠.
					뭘, 어떻게, 어디서 시작할지 모르기 때문에 언제나 난감합니다.<br>
					그래서 입문자에게 필요한 기초 무료 강의들을 준비 했습니다. <br> 하나하나 배워나가 성장하다 보면 목표를 꼭 이루실 거에요!
					</span>
				</a>
			</div>
			<div class="sg-banner-overlay  text-center" style="padding:0px;">
			<img src="/resources/img/user/banner/samplebanner2.PNG" style="height:211px;float:right;">
			<div style="display:inline-block;padding:30px;color:#1da6b9;">
					<h1 class="sg-main-title">Free Lecture</h1>
					<p>모든 개발 입문자를 위하여</p>
				</div>
			</div>
		</div>
		
	</div>
	
</div>

	<div class="my-video-container container">
 		<h3 class="sg-heading"><span>가장 인기 있는 강좌</span></h3>

		
			<c:forEach items="${likeLecture }" var="lecture">
				<div class="my-video-box" style="width:22%;">
				<div class="my-video-contents">
					<div class="my-video">
						<img src="/resources/img/paid/lectureimg/${lecture.thumbnail }" class="my-video-thumnail">
					</div>
					<div class="my-video-title">${lecture.title }</div>
					<div class="my-video-footer">
						<span style="font-size: 17px;"><i class="fas fa-heart"
							style="color: #ff6060;"></i>${lecture.like }</span> <span
							style="right: 10px; position: absolute;"><fmt:formatNumber value="${lecture.price }" type="number"/>
							<i class="fas fa-won-sign"></i></span>
					</div>
				</div>
				<div class="my-video-overlay">
					<h4>${lecture.title }</h4>
					<p>등록일 <fmt:formatDate value="${lecture.createDate }" pattern="yyyy-MM-dd"/></p>
					<strong>Summary</strong>
					<p style="background: #ffb1b130; padding: 5px; border-radius: 5px;">${lecture.summary }</p>
					<p style="position: absolute; bottom: 5px; right: 5px;">
						<a href="/paid/detail.do?no=${lecture.no }" class="sg-btn sg-btn-primary sg-nb">LEARNING</a>
					</p>
				</div>
			</div>
			</c:forEach>
			
			
		</div>

	<div class="my-video-container container">
 		<h3 class="sg-heading"><span>최근 올라온 강좌</span></h3>

			<c:forEach items="${newLecture }" var="lecture">
				<div class="my-video-box" style="width:22%;">
				<div class="my-video-contents">
					<div class="my-video">
						<img src="/resources/img/paid/lectureimg/${lecture.thumbnail }"
							class="my-video-thumnail">
					</div>
					<div class="my-video-title">${lecture.title }</div>
					<div class="my-video-footer">
						<span style="font-size: 17px;"><i class="fas fa-heart"
							style="color: #ff6060;"></i>${lecture.like }</span> <span
							style="right: 10px; position: absolute;"><fmt:formatNumber value="${lecture.price }" type="number"/>
							<i class="fas fa-won-sign"></i></span>
					</div>
				</div>
				<div class="my-video-overlay">
					<h4>${lecture.title }</h4>
					<p>등록일 <fmt:formatDate value="${lecture.createDate }" pattern="yyyy-MM-dd"/></p>
					<strong>Summary</strong>
					<p style="background: #ffb1b130; padding: 5px; border-radius: 5px;">${lecture.summary }</p>
					<p style="position: absolute; bottom: 5px; right: 5px;">
						<a href="/paid/detail.do?no=${lecture.no }" class="sg-btn sg-btn-primary sg-nb">LEARNING</a>
					</p>
				</div>
			</div>
			</c:forEach>
			
		</div>

<script>
	$('.sg-banner-overlay').mouseover(function() {
		$(this).fadeOut(200);
	});

	$('.main-banner').mouseleave(function() {
		$(this).find('.sg-banner-overlay').fadeIn(200);
	});
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>