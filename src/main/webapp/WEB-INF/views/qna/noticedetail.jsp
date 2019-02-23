<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://momentjs.com/downloads/moment.js"></script>
<style type="text/css">
</style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>



    <!--컨테이너-->
    <div class="container" style="padding-top:50px;">
    	<div class="col-xs-3"><h4>${notice.title }</h4>
    	<p><small><fmt:formatDate value="${notice.createDate }" pattern="yyyy-MM-dd"/></small></p>
    	</div>
    	<div class="col-xs-9" style="margin-top:10px;">
    		<div>${notice.contents }</div>
    		<hr>
    		<div>
    		<c:if test="${notice.rn < lows}">
	    		<a class="sg-btn sg-nb" href="noticeDetail.do?rn=${notice.rn+1 }">이전</a>
    		</c:if>
    		<c:if test="${notice.rn > 1}">
	    		<a class="sg-btn sg-nb" href="noticeDetail.do?rn=${notice.rn-1 }">다음</a>
    		</c:if>
	    		<a class="sg-btn sg-nb" style="border:2px solid #4d4d4d;color:white;background-color:#4d4d4d;float:right;" href="notice.do">목록</a>
    		</div>
    	</div>
    </div>

    <!--컨테이너 끝-->



<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>