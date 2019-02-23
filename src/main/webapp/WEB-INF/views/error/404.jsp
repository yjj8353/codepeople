<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodePeople</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="container text-center">
	<h1>존재하지 않는 페이지입니다. 잠시 후 전 페이지로 돌아갑니다.</h1>
	<h1 class="m-count">5</h1>
	<img alt="" src="https://ithemes.com/wp-content/uploads/2016/10/funny-404-pages.jpg">
</div>
<script>
	setTimeout(function() {
		history.back().back();
	}, 5000);
	
	var count = 4;
	setInterval(function(){
		$('.m-count').text(count);
		count--;
	},1000)
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>