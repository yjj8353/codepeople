<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet" href="/resources/css/instructor/main.css?ver=<%=new Date()%>">
<!-- 아임포트 결제모듈 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/js/instructor/main.js?ver=<%=new Date()%>"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">

		<div class="instructor-banner col-xs-12">
			<h1 id="instructor-banner-name">INSTRUCTOR</h1>
			<p id="instructor-banner-description">CODE PEOPLE에선 누구나 선생님이 될 수 있습니다</p>
			  <a href="/instructor/registerLectureForm.do">
			 <button class="btn sg-btn-secondary" id="btn-course-register">
			      <span class="glyphicon glyphicon-edit"></span>
			   	  <span> 신규 강좌 등록</span>
			</button>
			  </a>
			
		</div>
		
		
		
		
		<div class="instructor-main-contents-list col-xs-12">

		<c:choose>
			<c:when test="${!empty paidLectures }">
			<div class="instructor-home-top-menu col-xs-12">
				<ul>
					<li class="selected"><a href=#>COURSES</a></li>
					<li><a href=#>DASHBOARD</a></li>
				</ul>
			</div>
			
	
			<div class="col-xs-12">
				<hr>
			</div>
			
			<h4>TOTAL <span style="font-size:25px; font-weight:700; color:red;"> ${paidLectures.size() } </span> COURSES</h4>
			<c:forEach var="result" items="${paidLectures }" varStatus="status">
					<a href="/instructor/modifyLectureForm.do?lectureNo=${result.no }" id="instructor-main-below-contents">
				<div class="col-xs-12 instructor-main-courses-content">
					<div class="col-xs-2 courses-photo">
					
					<c:choose>
						<c:when test="${!empty result.thumbnail }">
							<img id="instructor-main-courses-photo" src="/resources/img/paid/lectureimg/${result.thumbnail}" align="center" />
						</c:when>
						<c:otherwise>
							<img id="instructor-main-courses-photo" src="/resources/img/paid/lectureimg/noimage.jpg" align="center" />
						</c:otherwise>
					</c:choose>
					
					</div>
					<div class="col-xs-4 instructor-main-courseInfo-wrapper">
							<c:choose>
								<c:when test="${result.approveStatus == 'Y'}">
									<span class="badge badge-success">승인 완료</span>
								</c:when>
								<c:otherwise>
									<span class="badge badge-warning">승인 대기</span>
								</c:otherwise>
							</c:choose>	
							<c:choose>
								<c:when test="${result.exposureStatus == 'Y'}">
									<span class="badge badge-success">공개</span>
								</c:when>
								<c:otherwise>
									<span class="badge badge-warning">비공개</span>
								</c:otherwise>
							</c:choose>	
						<div style="margin-top: 20px;">
							<h5 id="instructor-main-courses-title">${result.title }</h5>
						</div>
						<div>
							<p style="color: lightgray;">${result.instructor.user.name }</p>
						</div>
						<div>
							<p class="instructor-main-courses-price">
							<fmt:formatNumber value="${result.price }" pattern="#,###.##"/>
							<span> 원</span>
							</p>
						</div>
					</div>
					<div class="col-xs-5" style="text-align: center">
							<div class="row">
								<span class="instructor-info-small-title">등록강좌 수</span>
								<p class="instructor-info-small-content">${lessonCounts.get(status.index) }</p>
							</div>
							<div class="row">
								<span class="instructor-info-small-title">최근 업데이트</span>
								<p class="instructor-info-small-content">
									<fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.createDate }" />
								</p>
							</div>
							<div class="row">
								<span class="instructor-info-small-title">강좌 구매</span>
								<p class="instructor-info-small-content">${StudentCounts.get(status.index) }</p>
							</div>
							
					
					</div>
				</div>
					</a>					
			</c:forEach>
			</c:when>
			<c:otherwise>
				<h3>
					지금 강좌를 등록해보세요!
				</h3>
			</c:otherwise>
		</c:choose>			




		</div>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>