<%@page import="com.jhta.cope.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무료 강의 - 코드피플</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<style>
.yb-course-container {
	width: 320px;
	height: auto;
	padding: 10px;
	margin-right: 50px;
	margin-bottom: 30px;
	margin-top: 50px;
	float: left;
	text-align: center;
}

.yb-course-container>p {
	font-size: 17px;
	line-height: 180%;
	height: 160px;
	width: 290px;
}

.yb-text-red {
	color: red;
	font-weight: bold
}

.yb-course-container a {
	background-color: white;
	text-align: center;
	border: 2px solid #00a0d2;
	font-size: 13px;
	padding: 10px 20px 10px 20px;
	border-radius: 3px;
	font-weight: bold;
	transition: 0.7s;
}

.yb-course-container p:last-child {
	margin-top: 30px;
}

.yb-course-container a:hover {
	background-color: #00a0d2;
	color: white;
}

h3 {
	margin-bottom: 30px;
    min-height: 52px;
}

h4 {
	margin-top: 20px;
	margin-bottom: 10px;
	font-size: 19px;
}

.yb-course-img img {
	width: 100%;
	height: 195px;
}

.yb-pn-block {
	display: inline-block;
}

.yb-pn-block a {
	padding: 0px 7px 0px 7px;
    border: 2px solid #40e0d0;
    border-radius: 3px;
    font-weight: 600;
    color: #289086;
    font-size: 13px;
}

.yb-pn-block a.active{
    background-color: #40e0d0;
    color:white;
    }

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div>
			<h4><i class="fas fa-chalkboard-teacher"></i> 무료 강의</h4>
		</div>
		<hr>
		<div style="text-align: center; display: inline-block; position: absolute; right:10%; top: 6%" >
			<form action="list.do" id="free-lecture-search-form">
				<select style="width: 60px; height: 30px;" name="searchType">
					<option value="all" ${param.searchType eq 'all' ? 'selected' : ''}>전체</option>
					<option value="title" ${param.searchType eq 'title' ? 'selected' : ''}>제목</option>
				</select>
				<input style="width: 200px; height: 30px;" type="text" name="keyword" placeholder="검색" value="${param.keyword }">
				<input type="hidden" name="cp" id="cp-value" value="${param.cp }">
			</form>
		</div>
		<c:forEach var="freeLecture" items="${freeLectures }">
			<div class="yb-course-container">
				<h3>${freeLecture.lectureTitle}</h3>
				<div class="yb-course-img">
					<img
						src="/resources/img/free/${freeLecture.lectureImg }"
						alt="">
				</div>
				<h4>백지 상태에서 만들 수 있도록!!</h4>
				<p>
					${freeLecture.lectureSummary }
				</p>
				<hr style="border-top: 1px solid #2e6da4; margin-bottom: 40px;">
				<div class="yb-course-buttons">
					<a class="yb-course-button button" style="margin-top: 20px" href="/free/detail.do?freeLectureNo=${freeLecture.no }">
						배우러 가기 </a>
				</div>
			</div>
		</c:forEach>
	</div>
	<hr>
	<div class="text-center">
		<ul style="display: inline-block;">
			<c:if test="${pagination.currentBlock gt 1}">
				<li class="yb-pn-block"><a href="javascript:searchFreeLecture(${pagination.prevBlock })">&laquo;</a>
			</c:if>
			<c:forEach var="pnum" begin="${pagination.beginPage }" end="${pagination.endPage }">
				<li class="yb-pn-block"><a class="${pnum eq param.cp ? 'active': '' }" href="javascript:searchFreeLecture(${pnum })">${pnum }</a></li>
			</c:forEach>
			<c:if test="${pagination.currentBlock lt pagination.totalBlocks }">
				<li class="yb-pn-block"><a href="javascript:searchFreeLecture(${pagination.nextBlock })">&raquo;</a>
			</c:if>
		</ul>
	</div>
	<script type="text/javascript">
		function searchFreeLecture(cp) {
			$("#cp-value").val(cp);
			$("#free-lecture-search-form").submit();
		}
	</script>
	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>