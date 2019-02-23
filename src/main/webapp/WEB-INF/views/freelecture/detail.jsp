<%@page import="com.jhta.cope.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${freeLecture.lectureTitle} - 코드피플</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<style>
.container {
	margin-top: 50px;
}

.yb_contents_title {
	margin-bottom: 45px;
}

.yb-contents {
	width: 80%;
}

.yb-contents-sidebar {
	width: 20%;
}

iframe {
	width: 800px;
	height: 400px;
}

h2 {
	margin-top: 20px;
	margin-bottom: 20px;
}

h3 {
	margin-bottom: 30px;
}

h4 {
	margin-top: 40px;
	margin-bottom: 10px;
	font-size: 24px;
}

.yb_course_contents p {
	font-size: 17px;
	line-height: 180%;
}

.fab.fa-java {
	color: #ff7373;
}

.yb_reiview_score {
	text-align: center;
	margin-bottom: 30px;
}

.yb_reiview_score p:first-child {
	font-size: 120px;
	font-weight: 600;
	margin: 0px;
}

.yb_coment_score {
	margin-bottom: 10px;
}

.yb_comment-avatar {
	float: left;
}

.yb_comment-avatar img {
	width: 70px;
	height: 70px;
	margin-bottom: 10px;
	border: 1px soild black;
	border-radius: 100px;
	margin-right: 50px;
	margin-top: 35px;
}

.yb_reviewlist_commentlist {
	list-style-type: none;
	padding: 0px;
}

.yb_comment-body {
	display: inline-block;
}

.yb_comment-body p:nth-child(2) {
	margin-top: 10px;
	font-weight: bold;
	line-height: 100%;
}

.yb-course-img img {
	width: 100%;
	height: 195px;
}

.fas.fa-star, .fa-star-half-alt {
	color: #ad8d00;
}

.yb-contents-sidebar {
	border: 1px solid black;
	margin-top: 79px;
}

.yb_sidebar_admin img {
	margin-top: 10px;
	width: 150px;
	height: 150px;
	margin-bottom: 10px;
	border: 1px soild black;
	border-radius: 50px;
}

.yb_sidebar_admin {
	text-align: center;
	margin-bottom: 20px;
}

.yb-contents-sidebar p:last-child {
	text-align: center;
	margin-bottom: 20px;
}
.yb-contents-sidebar-contens p {
	text-align: left;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="yb-contents col-md-9">
			<div class="yb_contents_title">
				<h1>${freeLecture.lectureTitle}</h1>
			</div>
			<div class="yb_course_contents">
				${freeLecture.lectureContent }
			</div>
		</div>
		<div class="yb-contents-sidebar col-md-3">
			<div class="yb_sidebar_admin">
				<img
					src="/resources/img/user/icon/icon.png">
				<p>관리자</p>
				<hr>
			</div>
			<div class="yb-contents-sidebar-contens">
				<div class="row">
					<div class="col-md-4">
						<p>평생</p>
					</div>
					<div class="col-md-3 col-md-offset-5">
						<i class="far fa-clock"> </i>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
					<c:choose>
						<c:when test="${freeLecture.lectureLevel eq 1}">
							<p>입문</p>
						</c:when>
						<c:when test="${freeLecture.lectureLevel eq 2}">
							<p>초급</p>
						</c:when>
						<c:when test="${freeLecture.lectureLevel eq 3}">
							<p>중급</p>
						</c:when>
						<c:when test="${freeLecture.lectureLevel eq 4}">
							<p>고급</p>
						</c:when>
					</c:choose>
					</div>
					<div class="col-md-3 col-md-offset-5">
						<i class="fas fa-signal"></i>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<p>${freeLecture.lectureTime}시간</p>
					</div>
					<div class="col-md-3 col-md-offset-5">
						<i class="far fa-calendar-alt"></i>
					</div>
				</div>
				<hr>
			</div>
			<p>
				<a class="button sg-btn-primary sg-btn-sm" href="/free/section.do?freeLectureNo=${freeLecture.no }&count=1">배우러 가기</a>
			</p>
		</div>
	</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>