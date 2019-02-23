<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <div class="col-xs-12">
    
        <div class="col-xs-offset-2 col-xs-8 paid-note-list-wrapper">
            
           <c:forEach var="bookmark" varStatus="status" items="${bookmarks }">
           
           <input type="hidden" id="fileName" name="fileName" value="${bookmark.history.paidLectureDetail.filePath }" />
           <input type="hidden" id="detailNo" name="detailNo" value="${bookmark.history.paidLectureDetail.no }">
           <input type="hidden" id="bookmark" name="bookmark" value="${bookmark.length }">
           
           <a href="/paid/video.do?fileName=${bookmark.history.paidLectureDetail.filePath }&detailNo=${bookmark.history.paidLectureDetail.no}&bookmark=${bookmark.length }">
            <div class="paid-each-bookmark">
	            		<div class="col-xs-2">
	            			<img alt="bookmark 이미지" src="/resources/img/paid/bookmark-icon.png" width="30px;" style="margin-top:25px; margin-left:25px;">
	            		</div>
		            	<div class="Col-xs-10">
			                <div class="paid-section-info-wrapper" style="color: gray; margin-top: 20px;">
				                <span> SECTION ${bookmark.history.paidLectureDetail.sectionNo }</span>
				                <span id="paid-each-section-name">${bookmark.history.paidLectureDetail.sectionName }</span>
				            	<div>
										LESSON ${bookmark.history.paidLectureDetail.lessonNo }
										${bookmark.history.paidLectureDetail.lessonName }
				            	</div>
								<div class="paid-each-section-date">
									<span class="glyphicon glyphicon-time"></span>
									<span>
									<fmt:formatDate pattern = "yyyy-MM-dd" value = "${bookmark.createDate }" />
									</span>
								</div>
			                </div>
			            	<div style="font-size: 20px; margin-top: 10px">
			            		<div style="margin-left: 120px; font-weight: 600">
				            		${bookmark.content }
			            		</div>
			            		<div class="col-xs-offset-2" style="font-size: 14px; margin-bottom: 20px;">
				            		<fmt:formatNumber value="${Math.floor(bookmark.length/60) }" pattern="00"/> 분
									<fmt:formatNumber value="${bookmark.length%60 }" pattern="00"/> 초
										
			            		</div>
			            	</div>
		            	</div>
        	</div>
           </a>
           </c:forEach>
    	</div>
    	
    	</div>

