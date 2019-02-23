<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code People</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<style>
.table>thead>tr>th, td {
	border-bottom: none;
	text-align: center;
	font-size: 14px;
	color: #505050;;
}

.table>tbody>tr>td {
	padding: 18px;
	border-top: 1px solid lightgray;
	font-size: 15px;
}

.table>tbody>tr>td a {
	color: #505050;;
	font-weight: 500;
	font-size: 14px
}

.table>tbody>tr>td a:visited {
	color: #505050;;
}

.table>tbody>tr:last-child {
	border-bottom: 1px solid rgba(0, 150, 133, 0.16);
	margin-bottom: 10px;
}

.sort-link {
	border: none;
	background-color: white;
	display: inline;
}

.sort-link {
	border: none;
	background-color: white;
	display: inline;
	color: gray;
}

.sort-link:hover {
	color: rgb(22, 193, 151);
}

.sort-link.active {
	color: black;
	text-decoration: underline;
}

.sg-pn-item {
	display: inline-block;
}

.sg-pn-item a {
	padding: 0px 7px 0px 7px;
	border: 2px solid gray;
	border-radius: 3px;
	font-weight: 600;
	color: gray;
	font-size: 13px;
}

.sg-pn-item a.active {
	background-color: gray;
	color: white;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<!--컨테이너-->
	<div class="container" style="max-width: 70%;margin-top:10px;">
		<div class="col-xs-3">
		<a href="notice.do" style="color:gray;">
			<h4 style="margin-top: 50px">
				코드피플 서비스 <br>공지사항
			</h4>
		</a>
		</div>
		<div class="col-xs-9">
			<table class="table table-hover">
				<colgroup>
					<col width="*">
					<col width="15%">
					<col width="50px">
				</colgroup>
				<thead>
					<tr>
						<td>내용</td>
						<td>등록</td>
						<td>번호</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty notices}">
							<tr>
								<td colspan="6">공지사항이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${notices }" var="notice" varStatus="status">
								<tr id="rn-${notice.rn }">
									<td style="text-align: left;"><a
										href="noticeDetail.do?rn=${notice.rn }">${notice.title }</a></td>
									<td><small><fmt:formatDate
												value="${notice.createDate }" pattern="yyyy-MM-dd" /></small></td>
									<td style="font-size: 12px; color: gray">${pagination.totalRows - notice.rn  + 1}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="text-center">
				<ul style="display: inline-block;">
					<c:if test="${pagination.currentBlock gt 1 }">
						<li class="sg-pn-item"><a
							href="javascript:searchNotice(${pagination.prevBlock })">&laquo;</a></li>
					</c:if>
					<c:forEach var="pnum" begin="${pagination.beginPage }"
						end="${pagination.endPage }">
						<li class="sg-pn-item"><a
							class="${pnum eq param.cp ? 'active':'' }"
							href="javascript:searchNotice(${pnum })">${pnum }</a></li>
					</c:forEach>
					<c:if test="${pagination.currentBlock lt pagination.totalBlocks }">
						<li class="sg-pn-item"><a
							href="javascript:searchNotice(${pagination.nextBlock })">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			<div class="text-center" style="margin-top: 20px;">
				<form action="notice.do" id="notice-search-form">
					<input type="text"
						style="border: none; border-bottom: 1px solid black; width: 60%; height: 36px;"
						placeholder="검색" name="keyword" />
						<input type="hidden" value="${param.cp }" name="cp" id="cp-value">
				</form>
			</div>

		</div>
	</div>
	<!--컨테이너 끝-->


	<script>
		
		function searchNotice(cp) {
			$("#cp-value").val(cp);
			$('#notice-search-form').submit();
		}

		//봤던 글 액티브
		var noticeCookie = /noticeSeq=([^;]*)/.test(document.cookie) ? unescape(RegExp.$1)
				: '';
		var noticeSeqArray = noticeCookie.split('|');
		for ( var i in noticeSeqArray) {
			$('#rn-' + noticeSeqArray[i]).css('background', '#f1f1f1');
		}
	</script>
	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>