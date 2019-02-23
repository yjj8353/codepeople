<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href="/resources/css/paid/detail.css?ver=<%= new Date()%>">
<link rel="stylesheet" href="/resources/css/paid/contents.css?ver=<%= new Date()%>">
<link rel="stylesheet" href="/resources/css/paid/note.css?ver=<%= new Date()%>">
<link rel="stylesheet" href="/resources/css/paid/question.css?ver=<%= new Date()%>">

<!-- summernote 플러그인 모듈 -->
<link href="/resources/plugins/summernote/summernote.css" rel="stylesheet">
<script src="/resources/plugins/summernote/summernote.js"></script>
<!-- summer note korean language pack -->
<script src="/resources/plugins/summernote/lang/summernote-ko-KR.js"></script>


<!-- 아임포트 결제모듈 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/js/paid/detail.js?ver=<%= new Date()%>"></script>
<script src="/resources/js/paid/note.js?ver=<%= new Date()%>"></script>
<script src="/resources/js/paid/question.js?ver=<%= new Date()%>"></script>

</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">

            <div class="paid-top-default">
                <div class='col-xs-12 paid-top-menu'>
                    <div class='col-xs-10' id='paid-info-topleft'>
                    	<div class="like-wrapper">
                    	<c:choose>
                    		<c:when test="${empty LOGIN_USER }">
                    				<span><img src="/resources/img/paid/heartFill.png" width="30px" class="fill"/></span>
			                    	<span style="display: none;"><img src="/resources/img/paid/heartEmpty.png" width="30px" class="empty" /></span>
			                    	<span id="like">${lectureDetails[0].paidLecture.like }</span><span>명이 좋아합니다</span>
                    		</c:when>
                    		<c:otherwise>
                    			<c:choose>
                    				<c:when test="${likeStatus eq 1 }">
			                    		<span class="like-image"><img src="/resources/img/paid/heartFill.png" width="30px" class="fill"/></span>
			                    		<span class="like-image" style="display: none;"><img src="/resources/img/paid/heartEmpty.png" width="30px" class="empty" /></span>
			                    		<span id="like">${lectureDetails[0].paidLecture.like }</span><span>명이 좋아합니다</span>
                    				</c:when>
                    				<c:otherwise>
                    					<span class="like-image" style="display: none;"><img src="/resources/img/paid/heartFill.png" width="30px" class="fill" /></span>
			                    		<span class="like-image"><img src="/resources/img/paid/heartEmpty.png" width="30px" class="empty"/></span>
			                    		<span id="like">${lectureDetails[0].paidLecture.like }</span><span>명이 좋아합니다</span>
                    				</c:otherwise>	
                    			</c:choose>
                    		</c:otherwise>
                    	</c:choose>
                    	</div>
                    	
                    	<input type="hidden" name="paidLectureNo" id="paidLectureNo" value="${lectureDetails[0].paidLecture.no}">
                   		<c:forEach var="result" items="${title }">
	                        <h1 class='paid-title'>
	                            ${result }
	                        </h1>
                   		</c:forEach>
                   		
                        <h3 id='paid-level'>
                            <span>For </span> ${lectureDetails[0].paidLecture.level }
                        </h3>
                        <div>
                        
                        
                        <c:choose>
                        	<c:when test="${LOGIN_USER eq null}">
	                        	<div>
		                            <button class="sg-btn-primary nonlogin-paid-purchase-btn">지금 구매하기</button>
	                        	</div>
	                        	<div>
	    	                        <button class="sg-btn-primary nonlogin-paid-cart-btn">카트에 담기</button>
	                        	</div>
                        	</c:when>
                        	<c:when test="${paymentFlag == 'N'}">
	                        	<div>
	                        		<input type="hidden" class="lecturePrice" value=" ${lectureDetails[0].paidLecture.price }">
	                        		<input type="hidden" class="lectureNoForPayment" value="${lectureDetails[0].paidLecture.no }">
		                            <button class="sg-btn-primary" id="paid-purchase-btn">지금 구매하기</button>
	                        	</div>
	                        	<div>
									<input type="hidden" class="lectureNo" name="lectureNo" value="${lectureDetails[0].paidLecture.no}">
	    	                        <button class="sg-btn-primary" id="paid-cart-btn">카트에 담기</button>
	                        	</div>
                        	</c:when>
                        	<c:otherwise>
                        		<c:choose>
                        			<c:when test="${empty lectureHistories }">
                        			<a href="/paid/video.do?fileName=${lectureDetails[0].filePath }&detailNo=${lectureDetails[0].no}">
		 	                           <button class="sg-btn-primary paid-continue-btn" id="continue-0">
		 	                           ORIENTATION
		 	                           </button>
		 	                           </a>
                        			</c:when>
                        			<c:otherwise>
		 	                           <a href="/paid/video.do?fileName=${lectureHistories.get(0).paidLectureDetail.filePath }&detailNo=${lectureHistories.get(0).paidLectureDetail.no}">
			 	                           <button class="sg-btn-primary paid-continue-btn" id="continue-${lectureHistories.get(0).paidLectureDetail.no }">
			 	                           continue to <span style="font-size: 20px; font-weight: 600;">[ ${lectureHistories.get(0).paidLectureDetail.lessonName } ]</span>
			 	                           </button>
		 	                           </a>
                        			</c:otherwise>
                        		</c:choose>
                        	
                        	</c:otherwise>
                        </c:choose>
                        
                        </div>

                    </div>
                    <div class='col-xs-2' id='paid-info-topright'>
                        <p style='font-weight: bold;'>언어</p>
                        <p id='paid-language-top'>
                            ${lectureDetails[0].paidLecture.lang }
                        </p>
                        <hr />
                        <p style='font-weight: bold;'>개강일</p>
                        <p id='paid-date-top'>
                        
                        <fmt:formatDate pattern = "yyyy-MM-dd" value = "${lectureDetails[0].paidLecture.createDate }" />

                        </p>
                        <hr />
                        <p style='font-weight: bold;'>담당 마스터</p>
                        <p id='paid-instructor-top'>
                            ${lectureDetails[0].paidLecture.instructor.user.name}
                        </p>
                    </div>
                </div>
                <div class="col-xs-12 paid-progress">
                    <div class='top-icon'>
                        <span class="paid-top-icon left"><img src="/resources/img/paid/paid-start.png" class='paid-top-icon'></img></span>
                        <span class="paid-top-icon right"><img src="/resources/img/paid/flag.png" class='paid-top-icon'></img></span>
                    </div>

                    <div id='paid-bar-total'>
                    	<input type="hidden" value="${numbersOfPass }" id="numbersOfPass" />
                    	<input type="hidden" value="${lectureDetails.size() }" id="lessonLength" />
                        <div id="paid-bar-progress">
                     
                     <c:if test="${!empty numbersOfPass }">
                        <div class="completePercent">
                        	<div id="completePercent">
                        		▼
                        	</div>
                        	<div id="numOfPercent">
                        	</div>
                        </div>
                     </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 paid-default-menu">
                <ul>
                    <li><a href=# id="detail-overview">OVERVIEW</a></li>
                    <li><a href=# id="detail-contents">COURSE CONTENTS</a></li>
                    <li><a href=# id="detail-note">MY NOTE</a></li>
                    <li><a href=# id="detail-bookmark">BOOKMARK</a></li>
                    <li><a href=# id="detail-announce">공지사항</a></li>
                </ul>
            </div>
            <div class="col-xs-12">
                <hr />
            </div>
           
<input type="hidden" id="lecNo" name="lecNo" value="${lectureNo }">

				<div class="paid-contents">
					<!-- ajax 페이지 html 갱신 -->
				</div>

</div>       


<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>