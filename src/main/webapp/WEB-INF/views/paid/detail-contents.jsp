<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>


<div class="paid-contentslist">

	<c:choose>
		<c:when test="${LOGIN_USER eq null}">
			<!-- 비로그인 유저 -->
			<c:forEach var="result" varStatus="status" items="${lectureWrapper}">
				<div class="col-xs-8 col-xs-offset-2 section-whole-box">
					<div class="row section-top-box">
						<div class="row" style="margin-top: 20px;">
							<div class="col-xs-10">

								<span class="section-no-box"><span style="color: white;">SECTION</span><span
									id="section-no"> ${result.get(0).sectionNo}</span></span>
							</div>
							<div class="col-xs-2">
								<div id="section-complete-box">
									<span class="section-lesson-complete"> 0 </span><span> / </span><span id="section-lesson-list">${fn:length(result) } </span>
								</div>
							</div>
						</div>
						<div class="row">
							<h3 id="section-name">${result.get(0).sectionName}</h3>
						</div>
					</div>
					<c:forEach var="list" varStatus="number" items="${result }">
						<div class="row section-lesson-list">
							<div class="col-xs-1"></div>
							<div class="col-xs-10 section-lessonbox">
								<div class="lesson-per-one">
									<div class="col-xs-10">
										<span id="lesson-no">${number.count}</span><span>.</span><span
											id="lesson-name">${list.lessonName}</span>
									</div>

									<!--  
		                                   <div class="col-xs-2" style="text-align: right;">
		                                        <span id="complete-symbol">○</span>
		                                   </div>
		                                   -->

								</div>
							</div>
							<div class="col-xs-1"></div>

						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</c:when>
		<c:when test="${paymentFlag eq 'N'}">
			<!-- 로그인 & 비구매 유저 -->
			<c:forEach var="result" varStatus="status" items="${lectureWrapper}">
				<div class="col-xs-8 col-xs-offset-2 section-whole-box">
					<div class="row section-top-box">
						<div class="row" style="margin-top: 20px;">
							<div class="col-xs-10">

								<span class="section-no-box"><span style="color: white;">SECTION</span><span
									id="section-no"> ${result.get(0).sectionNo}</span></span>
							</div>
							<div class="col-xs-2">
								<div id="section-complete-box">
									<span class="section-lesson-complete">0</span><span> / </span><span
										id="section-lesson-list">${fn:length(result) } </span>
								</div>
							</div>
						</div>
						<div class="row">
							<h3 id="section-name">${result.get(0).sectionName}</h3>
						</div>
					</div>

					<c:forEach var="list" varStatus="number" items="${result }">

						<div class="row section-lesson-list">
							<div class="col-xs-1"></div>
							<div class="col-xs-10 section-lessonbox">
								<div class="lesson-per-one">
									<div class="col-xs-10">
										<span id="lesson-no">${number.count}</span><span>.</span><span
											id="lesson-name">${list.lessonName}</span>
									</div>
									<!--  
		                                   <div class="col-xs-2" style="text-align: right;">
		                                        <span id="complete-symbol">○</span>
		                                   </div>
		                                   -->
								</div>
							</div>
							<div class="col-xs-1"></div>

						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</c:when>

		<c:otherwise>
			<c:forEach var="result" varStatus="status" items="${lectureWrapper}">
					<c:set var = "sum" value = "0" />
				<div class="col-xs-8 col-xs-offset-2 section-whole-box" id="group-${status.count }">
					<div class="row section-top-box">
						<div class="row" style="margin-top: 20px;">
							<div class="col-xs-10">

								<span class="section-no-box"><span style="color: white;">SECTION</span><span
									id="section-no"> ${result.get(0).sectionNo}</span></span>
							</div>

							<div class="col-xs-2">
								<div id="section-complete-box">
									<span class="section-lesson-complete">
										<c:forEach var="history" varStatus="status" items="${lectureHistories}">
											<c:choose>
												<c:when test="${history.pass eq 'Y' && history.paidLectureDetail.sectionNo eq result.get(0).sectionNo}">
													<c:set var= "sum" value="${sum + 1}"/>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</c:forEach>
												<c:out value="${sum}"/>
										
										
									</span>
									<span> / </span>
									<span id="section-lesson-list">${fn:length(result) } </span>
								</div>
							</div>
						</div>
						<div class="row">
							<h3 id="section-name">${result.get(0).sectionName}</h3>
						</div>
					</div>
					<c:forEach var="list" varStatus="number" items="${result }">
						<div class="row section-lesson-list">
							<div class="col-xs-1"></div>
							<div class="col-xs-10 section-lessonbox">
								<div class="lesson-per-one">
									<div class="col-xs-10">
										<a href="/paid/video.do?fileName=${list.filePath }&detailNo=${list.no}"> <span id="lesson-no">${number.count}</span><span>.</span><span
											id="lesson-name">${list.lessonName}</span>
										</a>
									</div>
									
									<div class="col-xs-2 complete-section" style="text-align: right;">
					<c:choose>
						<c:when test="${!empty lectureHistories }">
						<c:forEach var="sectionFlag" varStatus="flagNum" items="${lectureHistories }">
							<c:if test="${sectionFlag.paidLectureDetail.sectionNo eq list.sectionNo}">
								<c:choose>
									<c:when test="${sectionFlag.paidLectureDetail.lessonNo eq list.lessonNo}">
										<c:choose>
											<c:when test="${sectionFlag.pass eq 'Y' }">
												<span id="complete-symbol">●</span>
											</c:when>
											<c:when test="${sectionFlag.pass eq 'N' }">
												<span id="complete-symbol">○</span>
											</c:when>
										</c:choose>
									</c:when>
								</c:choose>
							</c:if>	
						</c:forEach>
						</c:when>
					</c:choose>				
									</div>
									
									
								</div>
							</div>
							<div class="col-xs-1"></div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</div>



 </body>     
<script>
	$(".section-top-box").on('click', function() {

		const flag = $(this).siblings('.section-lesson-list').css('display');

		if (flag === "none") {
			$(this).siblings('.section-lesson-list').css('display', 'block');
		} else {
			$(this).siblings('.section-lesson-list').css('display', 'none');
		}
		
	});
	
	
	$("[id^=group]").each(function(index, item) {
		var id = $(item).attr("id");
		console.log(index+1);
	});
	

	var completeCount = 0; 
	
	$(".complete-section").each(function(inext, item) {
		var complete = $(this).children("#complete-symbol").text();
		
		if (!complete) {
			var $span = $('<span id="complete-symbol">○</span>');
			$(this).append($span);
		}
		
		if (complete == "●") {
			completeCount++;
		}
	})
	
	
	
	
//var temp = $(".section-lesson-complete").text();

//var count = (temp.match(/n/g) || []).length;

//$(".section-lesson-complete").text(count);	
//	$(".section-lesson-complete").text(completeCount);
	
	
	var str = $(".section-lesson-complete").text();
	var splitWords = substr(str.length-3, 3);
	console.log(splitWords)
	$(".section-lesson-complete").text(splitWords);
	
	
	
</script>
</html>