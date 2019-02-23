<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="ko">
<script src="/resources/editor/ckeditor/ckeditor.js"></script>
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
                    <a class="navbar-brand" href="notice.do">공지사항</a>
                </div>
                <%@include file="/WEB-INF/views/manager/common/navbar.jsp" %>
            </div>
        </nav>
        
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card">
                            <div class="header">
                                <h4 class="title">등록된 무료 강의</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div style="text-align: center;">
                            	<button class="btn btn-primary" data-toggle="modal" data-target="#notice-modal" type="button">새로운 공지사항 등록</button>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                    	<tr>
	                                        <th style="width:10%">공지 번호</th>
	                                    	<th style="width:30%">제목</th>
	                                    	<th style="width:40%">내용</th>
	                                    	<th style="width:200%">기능</th>
                                    	</tr>
                                    </thead>
                                    <tbody id="freeLecture-tbody">
                                    <c:forEach var="notice" items="${notices }">
                                        <tr>
                                        	<td>${notice.no }</td>
                                        <c:choose>
                                        <c:when test="${fn:length(notice.title) > 18 }">
                                        	<td><a onclick="window.open('/qna/noticeDetail.do?rn=${notice.rn }')"><c:out value="${fn:substring(notice.title,0,18) }" />...</a></td>
                                        </c:when>
                                        <c:otherwise>
                                        	<td><a onclick="window.open('/qna/noticeDetail.do?rn=${notice.rn }')"><c:out value="${notice.title }" /></a></td>
                                        </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                        <c:when test="${fn:length(notice.contents) > 30 }">
                                        	<td><c:out value="${fn:substring(notice.contents,0,30) }" />...</td>
                                        </c:when>
                                        <c:otherwise>
                                        	<td><c:out value="${notice.contents }" /></td>
                                        </c:otherwise>
                                        </c:choose>
                                        <c:if test="${notice.available eq 1 }">
                                        	<td><button type="button" id="notice-delete-${notice.no }" class="btn btn-danger btn-xs">삭제</button></td>
                                        </c:if>
                                        <c:if test="${notice.available eq 0 }">
                                        	<td><button type="button" id="notice-recover-${notice.no }" class="btn btn-warning btn-xs">복구</button></td>
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
        </div>

        <%@include file="/WEB-INF/views/manager/common/footer.jsp" %>
        
    </div>
</div>

<div class="modal fade" id="notice-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<form class="form-group">
						<input class="form-control" type="text" name="notice-title" id="notice-title" placeholder="제목을 입력해 주세요"/>
					</form>
					<form>
						<textarea name="noticeeditor" id="noticeeditor">
						</textarea>
						<script>
							CKEDITOR.replace('noticeeditor');
						</script>
					</form>
				</div>
			</div>
			<div id="student-loading-img" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); display: none;">
				<img src="/resources/img/manager/loading.gif"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" id="submit-btn" class="btn btn-primary">등록</button>
			</div>
		</div>
	</div>
</div>

</body>

<%@include file="/WEB-INF/views/manager/common/commonjs.jsp" %>
<script src="/resources/js/manager/notice.js"></script>

</html>