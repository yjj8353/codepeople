<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet" href="/resources/css/paid/home.css?ver=1">
<script src="/resources/js/paid/home.js?ver=0"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
	
			<a href="/paid/home.do?lang=java">
			<div class="paid-home-courses-banner-java col-xs-12">
				<h1 id="paid-home-courses-category">JAVA COURSES</h1>
				<p id="paid-home-courses-description">전 세계에서 가장 많이 쓰이는 프로그래밍 언어, 자바</p>
			</div>
			</a>

			<a href="/paid/home.do?lang=javascript">
			<div class="paid-home-courses-banner-javascript col-xs-12">
				<h1 id="paid-home-courses-category">JAVASCRIPT COURSES</h1>
				<p id="paid-home-courses-description">강력하고 유연한 웹의 NEXT GENERATION</p>
			</div>
			</a>

			<a href="/paid/home.do?lang=spring">
			<div class="paid-home-courses-banner-spring col-xs-12">
				<h1 id="paid-home-courses-category">SPRING COURSES</h1>
				<p id="paid-home-courses-description">스프링을 안다면 당신은 OOP를 통달한 것이다</p>
			</div>
			</a>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>