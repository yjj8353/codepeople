<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet"
	href="/resources/css/instructor/modifyCoureInfo.css?ver=<%=new Date()%>">
<script
	src="/resources/js/instructor/modifyCoureInfo.js?ver=<%=new Date()%>"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
	
		<form action="/instructor/updateLecture.do" method="POST" class="form-horizontal">
			<div style="padding: 0px;">
				<div>
		
					<hr>
		
					<div class="form-group">
						<h1>강좌 정보 수정</h1>
						<p>정보를 변경한 후 '수정' 버튼을 눌러주세요</p>
					</div>
					
					<hr>
				
					<div class="form-group">
						<p>COURSE TITLE</p>
						<input class="title-box" type="text" placeholder="강좌 제목을 입력해주세요"
							name="title" id="lectureTitle" value="${paidLecture.title }" required autofocus>
					</div>
					
					<hr>
					
					<div class="form-group">
						<p>COURSE SUMMARY</p>
						<input class="title-box" type="text" placeholder="강좌 요약 정보를 입력해주세요"
							name="summary" id="lectureSummary" value="${paidLecture.summary }">
					</div>
					
					<hr>
					
					<div class="form-group">
						<p>COURSE DESCRIPTION</p>
						<textarea class="title-box" placeholder="강좌 상세 정보를 입력해주세요"
							name="description" id="lectureDescription" style="resize: none;">${paidLecture.description }</textarea>
					</div>
					
					<hr>
					
					<div class="form-group">
						<div class="col-xs-6" style="padding: 0px">
							<p>LANGUAGE</p>
							<select class="lang-select" name="lang">
							    <option value="" disabled>해당 강좌 프로그래밍 언어 선택</option>
								<option value="java">JAVA</option>
								<option value="javascript">JAVASCRIPT</option>
								<option value="spring">SPRING</option>
							</select>
							<input type="hidden" id="prevLang" value="${paidLecture.lang }">
						</div>
						<div class="col-xs-6" style="padding: 0px">
							<p>COURSE LEVEL</p>
							<select class="level-select" name="level">
							    <option value="" disabled>해당 강좌 난이도 선택</option>
								<option value="begginer">BEGGINER</option>
								<option value="intermediate">INTERMEDIATE</option>
								<option value="advanced">ADVANCED</option>
							</select>
							<input type="hidden" id="prevLevel" value="${paidLecture.level }">
						</div>
					</div>
					
					<hr>
					
					<div class="form-group">
							<p>COURSE SPECIALIZED</p>
							<input class="title-box" type="text" placeholder="강좌 특징을 입력해주세요(ex : #함수형 언어 #실전 위주 ...)"
								name="specialized" id="lectureSpecial" value="${paidLecture.specialized }">
					</div>
		
					<hr>
					
					<div class="form-group">
							<p>COURSE PRICE</p>
							<input class="title-box" pattern="[0-9]+([,\.][0-9]+)?" type="number" placeholder="강좌 가격을 책정해주세요 (1000원 단위)"
								name="price" id="lecturePrice" lang="en-150" min="1000" step="1000" style="width: 70%;" value="${paidLecture.price }">
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
								<input type="hidden" name="thumbnail" id="uploadThumb" value="${paidLecture.thumbnail }">
								<input type="hidden" name="no" id="paidLectureNo" value="${paidLecture.no }">
								<input type="hidden" name="approveStatus" id="approveStatus" value="${paidLecture.approveStatus }">
								<input type="hidden" name="exposureStatus" id="exposureStatus" value="${paidLecture.approveStatus }">
							</div>
							<div id="holder"></div>
					</div>
				</div>
					
					<hr>
					
					<div class="form-group" style="margin-top: 30px;">
						<div class="col-xs-12">
							<input type="submit" class="btn create-lecture-next" value="수정" />
							<a href="/instructor/modifyLectureForm.do?lectureNo=${paidLecture.no }"><input type="button" class="btn create-lecture-cancel" value="취소" /></a>
						</div>
					</div>

		</div>
	</form>














	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>