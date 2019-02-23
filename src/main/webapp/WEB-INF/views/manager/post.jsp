<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/WEB-INF/views/manager/common/head.jsp" %>

<body>

<div class="wrapper">

	<%@include file="/WEB-INF/views/manager/common/sidebar.jsp" %>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="post.do">글/댓글 관리</a>
                </div>
                <%@include file="/WEB-INF/views/manager/common/navbar.jsp" %>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Q&A 게시물</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <nav style="text-align: center;">
					          	<ul id="qna-pagination" class="pagination">
					          	<!-- 
						          	<c:if test="${qnaPageInfo.curPage ne 1 }">
						          		<li><a><span aria-hidden="true">«</span><span class="sr-only">첫 페이지</span></a></li>
									</c:if>
								 -->
								 		<li class="page-item disabled"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>
									<c:forEach var="pageNum" begin="${qnaPageInfo.startPage }" end="${qnaPageInfo.endPage }">
									<c:if test="${pageNum eq 1 }">
										<li class="active"><a id="qna-page-${pageNum }">${pageNum }</a></li>
									</c:if>
									<c:if test="${pageNum ne 1 }">
										<li><a id="qna-page-${pageNum }">${pageNum }</a></li>
									</c:if>
									</c:forEach>
									<c:if test="${qnaPageInfo.curPage eq qnaPageInfo.totalPages }">
										<li class="page-item disabled"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">${qnaPageInfo.totalPages }</span></a></li>
									</c:if>
									<c:if test="${qnaPageInfo.curPage ne qnaPageInfo.totalPages }">
										<li><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">${qnaPageInfo.totalPages }</span></a></li>
									</c:if>
					          	</ul>
					        </nav>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
	                                    <tr>
	                                        <th style="width:10%">글 번호</th>
	                                    	<th style="width:20%">작성자</th>
	                                    	<th style="width:50%">제목</th>
	                                    	<th style="width:20%">처리</th>
	                                    </tr>
                                    </thead>
                                    <tbody id="qna-tbody">
                                    <c:forEach var="post" items="${qnaPosts }">
                                        <tr>
                                        	<td>${post.no }</td>
                                        	<td>${post.writer.name }</td>
                                        	<td><a id="post-info-${post.no }" href="/qna/detail.do?qnaNo=${post.no }">${post.title }</a></td>
                                        	<c:if test="${post.available eq 1 }">
                                        	<td><button type="button" id="btn-delete-post-${post.no }" class="btn btn-danger btn-xs">삭제</button></td>
                                        	</c:if>
                                        	<c:if test="${post.available eq 0 }">
                                        	<td><button type="button" id="btn-recover-post-${post.no }" class="btn btn-warning btn-xs">복구</button></td>
                                        	</c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="card card">
                            <div class="header">
                                <h4 class="title">Q&A 댓글</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <nav style="text-align: center;">
					          	<ul id="qna-answer-pagination" class="pagination">   	
					          			<li class="page-item disabled"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>
									<c:forEach var="pageNum" begin="${qnaAnswerPageInfo.startPage }" end="${qnaAnswerPageInfo.endPage }">
									<c:if test="${pageNum eq 1 }">
										<li class="active"><a id="qna-answer-page-${pageNum }">${pageNum }</a></li>
									</c:if>
									<c:if test="${pageNum ne 1 }">
										<li><a id="qna-answer-page-${pageNum }">${pageNum }</a></li>
									</c:if>
									</c:forEach>
									<c:if test="${qnaAnswerPageInfo.curPage eq qnaAnswerPageInfo.totalPages }">
										<li class="page-item disabled"><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">${qnaAnswerPageInfo.totalPages }</span></a></li>
									</c:if>
									<c:if test="${qnaAnswerPageInfo.curPage ne qnaAnswerPageInfo.totalPages }">
										<li><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only" id="qna-answer-final">${qnaAnswerPageInfo.totalPages }</span></a></li>
									</c:if>
					          	</ul>
					        </nav>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                    	<tr>
	                                        <th style="width:10%">댓글 번호</th>
	                                    	<th style="width:20%">작성자</th>
	                                    	<th style="width:50%">내용</th>
	                                    	<th style="width:20%">처리</th>
                                    	</tr>
                                    </thead>
                                    <tbody id="qna-answer-tbody">
                                    	<c:forEach var="answer" items="${qnaAnswers }">
                                        <tr>
                                        	<td>${answer.no }</td>
                                        	<td>${answer.writer.name }</td>
                                        	<td><input type="hidden" id="qna-number-${answer.qnaNo }" value="${answer.qnaNo }"/><a id="qna-answer-modal-${answer.qnaNo }" data-toggle="modal" data-target="#qna-answer-info">${answer.contents }</a></td>
                                        	<c:if test="${answer.available eq 1 }">
                                        	<td><button type="button" id="btn-delete-answer-${answer.no }" class="btn btn-danger btn-xs">삭제</button></td>
                                        	</c:if>
                                        	<c:if test="${answer.available eq 0 }">
                                        	<td><button type="button" id="btn-recover-answer-${answer.no }" class="btn btn-warning btn-xs">복구</button></td>
                                        	</c:if>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
        <%@include file="/WEB-INF/views/manager/common/footer.jsp" %>
    </div>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="qna-answer-info" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">세부 정보</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="content table-responsive table-full-width">
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width: 15%">글 번호</th>
								<th style="width: 18%">글 작성자</th>
								<th style="width: 30%">내용</th>
								<th style="width: 37%">답글이 달린 원글</th>
							</tr>
						</thead>
						<tbody>
							<tr id="qna-answer-info-ajax">
								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="loading-img" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				<img src="/resources/img/manager/loading.gif"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!--  -->

<%@include file="/WEB-INF/views/manager/common/commonjs.jsp" %>
<script src="/resources/js/manager/post.js"></script>
</body>
</html>