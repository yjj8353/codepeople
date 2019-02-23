<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet"
	href="/resources/css/instructor/registerLectureForm.css?ver=<%=new Date()%>">
<script
	src="/resources/js/instructor/registerLectureForm.js?ver=<%=new Date()%>"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
	
		<form action="/instructor/addLecture.do" method="POST" class="form-horizontal">
			<div style="padding: 0px;">
			
				<div class="form-firstPage">
				
				
				<c:if test="${empty instructorNo }">
					<div class="form-group">
						<h1>강사 등록</h1>
						<p>강좌 등록이 처음이신가요? 프로페셔널한 소개로 눈길을 끌어보세요!</p>
					</div>
		
					<hr>
					
					<div class="form-group">
							<p>INSTRUCTOR SUMMARY</p>
						<input class="title-box" type="text" placeholder="전문 분야를 간략히 소개해주세요"
							name="instructorSummary" id="instructorSummary" autofocus>
					</div>
		
					<hr>
					
					<div class="form-group">
						<p>INSTRUCTOR DESCRIPTION</p>
						<textarea class="title-box" placeholder="자세한 소개는 여기 써주세요"
							name="instructorDescription" id="instructorDescription" style="resize: none;"></textarea>
					</div>
				
					
				</c:if>		
				
				
				<div>
		
					<hr>
		
					<div class="form-group">
						<h1>강좌 등록</h1>
						<p>정보를 빠짐없이 기입하셔야 다음 스텝으로 이동할 수 있습니다</p>
					</div>
					
					<hr>
				
					<div class="form-group">
						<p>COURSE TITLE</p>
						<input class="title-box" type="text" placeholder="강좌 제목을 입력해주세요"
							name="title" id="lectureTitle" required autofocus>
					</div>
					
					<hr>
					
					<div class="form-group">
						<p>COURSE SUMMARY</p>
						<input class="title-box" type="text" placeholder="강좌 요약 정보를 입력해주세요"
							name="summary" id="lectureSummary" >
					</div>
					
					<hr>
					
					<div class="form-group">
						<p>COURSE DESCRIPTION</p>
						<textarea class="title-box" placeholder="강좌 상세 정보를 입력해주세요"
							name="description" id="lectureDescription" style="resize: none;"></textarea>
					</div>
					
					<hr>
					
					<div class="form-group">
						<div class="col-xs-6" style="padding: 0px">
							<p>LANGUAGE</p>
							<select class="lang-select" name="lang">
							    <option value="" disabled selected>해당 강좌 프로그래밍 언어 선택</option>
								<option value="java">JAVA</option>
								<option value="javascript">JAVASCRIPT</option>
								<option value="spring">SPRING</option>
							</select>
						</div>
						<div class="col-xs-6" style="padding: 0px">
							<p>COURSE LEVEL</p>
							<select class="level-select" name="level">
							    <option value="" disabled selected>해당 강좌 난이도 선택</option>
								<option value="begginer">BEGGINER</option>
								<option value="intermediate">INTERMEDIATE</option>
								<option value="advanced">ADVANCED</option>
							</select>
						</div>
					</div>
					
					<hr>
					
					<div class="form-group">
							<p>COURSE SPECIALIZED</p>
							<input class="title-box" type="text" placeholder="강좌 특징을 입력해주세요(ex : #함수형 언어 #실전 위주 ...)"
								name="specialized" id="lectureSpecial">
		
					</div>
		
					<hr>
					
					<div class="form-group">
							<p>COURSE PRICE</p>
							<input class="title-box" pattern="[0-9]+([,\.][0-9]+)?" type="number" placeholder="강좌 가격을 책정해주세요 (1000원 단위)"
								name="price" id="lecturePrice" lang="en-150" min="1000" step="1000" style="width: 70%;" value="1000">
							<span style="font-size: 20px;">원</span>
		
					</div>
					
					<hr>
					
					<div class="form-group">
							<p>COURSE THUMNAIL</p>
							<div style="margin-bottom: 20px;">
								<button class="replace">
								사진 올리기
								</button>
								<input type="file" name="prevThumbnail" id="lectureThumb" style="opacity: 0;">
								<input type="hidden" name="thumbnail" id="uploadThumb" value="">
							</div>
							<div id="holder"></div>
					</div>
				</div>
					
					<hr>
					
					<div class="form-group" style="margin-top: 30px;">
						<div class="col-xs-12">
							<input type="button" class="btn create-lecture-next" value="다음" />
							<a href="main.do"><input type="button" class="btn create-lecture-cancel" value="취소" /></a>
						</div>
					</div>
				</div>
			
				<div class="form-secondPage">
					
					<hr>
					
					<div class="form-group">
						<h1>테스트 강의 동영상 올리기</h1>
						<P style="margin-top: 20px;">강의 소개 영상을 2분 내외로 찍어 올려주세요</P>
						<p>강의 심사 후 일주일 내 승인이 완료됩니다 (평균 3일)</p>
					</div>
				
					<hr>
				
					<div class="form-group">
						<input type="hidden" name="sectionNo" id="sectionNo" value="0" required>
						<input type="hidden" name="sectionName" id="sectionName" value="INTRODUCTION" required>
						<input type="hidden" name="lessonNo" id="lessonNo" value="0" required>
						
						<p>LESSON TITLE</p>
						<input class="title-box" type="text" placeholder="테스트 강의 제목을 입력하세요(ex : 자바 8 강좌 소개 영상)"
							name="lessonName" id="lessonName" autofocus>
					</div>
	
					<hr>
					
					<div class="form-group">
						<p>LESSON VIDEO</p>
						<div style="margin-bottom: 20px;">
							<button class="replace">
							강의 영상 올리기
							</button>
							<input type="file"  accept=".avi,.mov,.mp4"
								name="prevfilePath" id="filePath" style="opacity: 0;">
							<input type="hidden" name="filePath" id="uploadFilePath" value="">
							
							</div>
							<div id="holderVideoWrapper">
								<video id="holderVideo" style="width: 400px; height: 225px;" controls></video>
							</div>
							<input type="hidden" name="lessonLength" id="lessonLength">
							
					</div>
					
					<hr>
					
					<div class="form-group" style="margin-top: 30px;">
						<div class="col-xs-12">
							<input type="submit" class="btn create-lecture-save" value="승인 요청" />
							<input type="button" class="btn create-lecture-prev" value="이전" />
						</div>
					</div>
				</div>
		</div>
	</form>














	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>