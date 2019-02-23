<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet"
	href="/resources/css/instructor/modifyLectureForm.css?ver=<%=new Date()%>">
<script
	src="/resources/js/instructor/modifyLectureForm.js?ver=<%=new Date()%>"></script>

</head>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
<body>

	<div class="container">
		<hr>

		<div class="modify-form-header">
			<div class="title">
				<h1>${paidLecture.title }</h1>
				<h4>By ${paidLecture.instructor.user.name }</h4>
				<p>강좌 관리 페이지에 오신 것을 환영합니다!</p>
			</div>
		</div>

		<hr>
		
			<h4 class="small-title">COURSE STATUS</h4>
		<div class="row form-group"  style="background: #afeeee" id="course-status">
				<div class="row">
					<p>강좌 승인 상태<p>
					<div>
						<c:choose>
							<c:when test="${paidLecture.approveStatus == 'Y'}">
								<h2><span class="label label-success">승인 완료</span></h2>
							</c:when>
							<c:when test="${paidLecture.approveStatus == 'N'}">
								<h2><span class="label label-waring">승인 대기</span></h2>
							</c:when>
							<c:otherwise>
								<h2><span class="label label-danger">승인 거부</span></h2>
							</c:otherwise>
						</c:choose>	
					</div>
				</div>
			
			<div class="row">
				<p>강좌 공개 여부</p>
				<input type="hidden" id="paidLectureNo" name="paidLectureNo" value="${paidLecture.no }">
				<input type="hidden" id="instructorNo" name="instructorNo" value="${paidLecture.instructor.no }">
				<c:choose>
					<c:when test="${paidLecture.exposureStatus == 'Y' }">
				<div class="input toggle-onoff" unselectable="on">
					<input type="hidden" name="onoff" id="toggleSwitch" value="Y">
					<i class="fa fa-4x" aria-hidden="true"></i>
					<div>
						<span class="selectable-status">공개</span>
					</div>
				</div>
					</c:when>
					<c:otherwise>
				<div class="input toggle-onoff" unselectable="on">
		            <input type="hidden" name="onoff" id="toggleSwitch" class="" value="N">
		            <i class="fa fa-4x" aria-hidden="true"></i>
		            <div>
						<span class="selectable-status">비공개</span>
		            </div>
      			</div>
					</c:otherwise>
				
				</c:choose>
				
			</div>
		</div>
		
		
			<h4 class="small-title">COURSE INFO</h4>
		<div class="row form-group" style="background: #afeeee;">
			<div class="row">
				<a href="modifyCoureInfo.do?paidLectureNo=${paidLecture.no }"><button class="btn create-lecture-next" id="modifyCoureInfo">강좌 정보 변경</button></a>
			</div>
		
				<div class="row">
					<div class="col-xs-6">
						<div class="info-contents" id="info-thumb">
							<img alt="강좌 썸네일" src="/resources/img/paid/lectureimg/${paidLecture.thumbnail }" id="info-image">
						</div>
					</div>
					<div class="col-xs-6">
						<div class="row">
							<div class="col-xs-6">
								<div>
									<p>강좌 제목</p>
								</div>
								<div class="info-contents">
									<p>${paidLecture.title }</p>
								</div>
							</div>
							<div class="col-xs-6">
								<div>
									<p>프로그래밍 언어</p>
								</div>
								<div class="info-contents">
									<p>${paidLecture.lang }</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6">
								<div>
									<p>강좌 난이도</p>
								</div>
								<div class="info-contents">
									<p>${paidLecture.level }</p>
								</div>
							</div>
							<div class="col-xs-6">
								<div>
									<p>강좌 가격</p>
								</div>
								<div class="info-contents">
									<p>${paidLecture.price }</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-6">
						<div>
							<p>COURSE SUMMARY</p>
						</div>
						<div class="info-contents">
							<p>${paidLecture.summary }</p>
						
						</div>
					</div>
					<div class="col-xs-6">
						<div>
							<p>COURSE DESCRIPTION</p>
						</div>
						<div class="info-contents">
							<p>${paidLecture.description }</p>
						
						</div>
					</div>
				</div>
		</div>


			<h4 class="small-title">COURSE CONTENTS</h4>
		<div class="row form-group" style="background: #509BE1;">
			<div class="row">
				<a href="registerEachLessonForm.do?lectureNo=${paidLecture.no }"><button class="btn create-lecture-next">새로운 강의 등록</button></a>
			</div>
			
			
			<div class="row course-modify-lesson-wrapper">
				<c:if test="${empty lectureWrapper }">
					<div style="color: white;">
						<h3>아직 강좌가 없으시군요?</h3>
						<h3>지금 새로운 강좌를 등록해보세요!</h3>
					</div>
				</c:if>
			
				<c:forEach var="result" varStatus="status" items="${lectureWrapper}">
				<div class="col-xs-6 col-xs-offset-3 section-whole-box" style="text-align: center;">
					<div class="row section-top-box">
							<div>
								<span class="section-no-box"><span style="color: white;">SECTION</span><span
									id="section-no"> ${result.get(0).sectionNo}</span></span>
							</div>
							<div>
								<h3 id="section-name">${result.get(0).sectionName}</h3>
							</div>
							<div>
								<span style="color: white;">${fn:length(result) } 개 강좌 등록</span>
							</div>
					</div>
					<c:forEach var="list" varStatus="number" items="${result }">
						<div class="row section-lesson-list">
							<div class="section-lessonbox">
								<div class="lesson-per-one">
										<span id="lesson-no">${number.count}</span><span>.</span><span
											id="lesson-name">${list.lessonName}</span>

									<!--  
		                                   <div class="col-xs-2" style="text-align: right;">
		                                        <span id="complete-symbol">○</span>
		                                   </div>
		                                   -->

								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
			</div>
		</div>

			<h4 class="small-title">COURSE NOTICE</h4>
		<div class="row form-group" style="background: #ff71b2;">
			<div class="row">
				<div style="margin-bottom: 20px;">
				
				<button class="btn lecture-notice-view">공지사항 보기</button>
				<button class="btn lecture-notice-register">공지사항 등록하기</button>
				</div>
				<div style="text-align: center; margin: auto;" id="notice-table">
						<table class="table" style="width: 80%; margin: auto; height: 300px;">
					      <colgroup>
					        <col width="15%">
					        <col width="*">
					        <col width="20%">
					        <col width="15%">
					      </colgroup>
					      <thead style="text-align: center;">
					        <tr style="text-align: center;">
					          <th>번호</th>
					          <th>제목</th>
					          <th>작성자</th>
					          <th>게시일</th>
					        </tr>
					      </thead>
					      <tbody>	
					      <c:choose>
					      	<c:when test="${empty notices}">
					     	 	<tr>
					      			<td colspan="5">공지사항이 존재하지 않습니다.</td>
					      		</tr>
					      	</c:when>
					      	<c:otherwise>
						      <c:forEach items="${notices }" var="notice" varStatus="status">
							        <tr>
							          <td>${status.count}</td>
							          <td>${notice.title }</td>
							          <td>${notice.instructor.user.name}</td>
							          <td><small><fmt:formatDate value="${notice.createDate }" pattern="yyyy-MM-dd"/></small></td>
						        	</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					      </tbody>
					    </table>
					</div>				

					<div id="notice-form">
					      <div class="form-group">
							  <input type="text" placeholder="공지사항 제목을 입력하세요" id="noticeTitle" name="noticeTitle" class="title-box" >
					      </div>
					      <div class="form-group" style="margin: auto;">
					          <textarea name="noticeContents" id="noticeContents"></textarea>
					      </div>
					</div>		
			</div>
		</div>

	</div>
	
	
	<script>
	$(".section-top-box").on('click', function() {

		const flag = $(this).siblings('.section-lesson-list').css('display');

		if (flag === "none") {
			$(this).siblings('.section-lesson-list').css('display', 'block');
		} else {
			$(this).siblings('.section-lesson-list').css('display', 'none');
		}
	});
	
		
</script>
	

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>