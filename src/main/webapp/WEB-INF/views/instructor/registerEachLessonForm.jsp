<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet"
	href="/resources/css/instructor/registerEachLessonForm.css?ver=<%=new Date()%>">
<script
	src="/resources/js/instructor/registerEachLessonForm.js?ver=<%=new Date()%>"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
	
		<form action="/instructor/addLesson.do" method="POST" class="form-horizontal">
				<div>
		
					<hr>
		
					<div class="form-group">
						<h1>강의 등록</h1>
						<p>정보를 빠짐없이 기입하셔야 등록이 완료됩니다</p>
					</div>
		
					<hr>
					
					<div class="form-group">
						<h3 class="small-title">SECTION</h3>
						<div class="col-xs-6">
							<p>SECTION NO</p>
							<input class="title-box" type="number" placeholder="단원 번호 입력"
								name="sectionNo" id="sectionNo" required autofocus>
						</div>
						<div class="col-xs-6">
							<p>SECTION TITLE </p>
							<input class="title-box" type="text" placeholder="단원 제목 입력"
								name="sectionName" id="sectionName" >
						</div>
					</div>
					
					<hr>
					
					<div class="form-group">
						<h3 class="small-title">LESSON</h3>
						<div class="col-xs-6">
							<p>LESSON NO</p>
							<input class="title-box" type="number" placeholder="레슨 번호 입력"
								name="lessonNo" id="lessonNo" required>
						</div>
						<div class="col-xs-6">
							<p>LESSON TITLE </p>
							<input class="title-box" type="text" placeholder="레슨 제목 입력"
								name="lessonName" id="lessonName" >
						</div>
					</div>
					
					<hr>
										
					<div class="form-group">
						<h3 class="small-title">VIDEO UPLOAD</h3>
								<button class="replace">UPLOAD</button>
								<input type="file"  accept=".avi,.mov,.mp4"
									name="prevfilePath" id="filePath" style="opacity: 0; padding-right: 600px;">
								<input type="hidden" name="filePath" id="uploadFilePath" value="">
							<div id="holderVideoWrapper">
								<video id="holderVideo" style="width: 400px; height: 225px;" controls></video>
								<input type="hidden" name="lessonLength" id="lessonLength">
								<input type="hidden" name="lectureNo" id="lectureNo" value="${lectureNo }">
								
							</div>
							
					</div>
					
					<hr>
					
					<div class="form-group" style="margin-top: 30px;">
						<div class="col-xs-12">
							<input type="button" class="btn create-lecture-cancel" value="취소" />
							<input type="submit" class="btn create-lecture-save" value="등록" />
						</div>
					</div>
		</div>
	</form>

	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>