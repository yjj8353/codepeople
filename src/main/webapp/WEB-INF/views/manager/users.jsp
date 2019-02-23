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
                    <a class="navbar-brand" href="users.do">유저</a>
                </div>
                <%@include file="/WEB-INF/views/manager/common/navbar.jsp" %>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                   	<div class="col-md-4" style="padding-bottom: 20px">
                    	<form action="users.do" method="post">
                   			<input style="float:left; width:75%" class="form-control" type="search" id="search-bar" placeholder="아이디 입력" name="userId"/>
                   			<input style="float:right; width:20%" type="submit" class="btn btn-primary" value="찾기"/>
                   		</form>
                   		<div id="preview-id" class="card" style="float:left; width:75%; display: none; padding: 10px">
                            <div class="header">
                            	
                            </div>
                            <div class="content">
                            </div>
                        </div>
                        <div style="float:right; width:20%">
                        </div>
                   	</div>
                   
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">강사 리스트</h4>
                                <p class="category">이곳은 강사들을 모여주는 리스트 입니다</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
	                                        <th style="width: 30%">번호</th>
	                                    	<th style="width: 70%">아이디</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="instructor" items="${instructors }">
                                        <tr>
                                        	<td style="display:none;">${instructor.user.no }</td>
                                        	<td id="teacher-no-${instructor.no }">${instructor.no }</td>
										<c:if test="${instructor.user.authStatus eq '2' or instructor.user.authStatus eq '1' }">
                                        	<td><a id="teacher-modal-${instructor.no }" data-toggle="modal" data-target="#teacher-info">${instructor.user.id }</a></td>
										</c:if>
										<c:if test="${instructor.user.authStatus eq '-1' or instructor.user.authStatus eq '-2' }">
                                        	<td><a id="teacher-modal-${instructor.no }" data-toggle="modal" data-target="#teacher-info">${instructor.user.id }</a> <i class="ti-trash"></td>
                                        </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card card">
                            <div class="header">
                                <h4 class="title">학생 리스트</h4>
                                <p class="category">이곳은 학생들을 보여주는 리스트 입니다</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table id="student-table" class="table table-hover">
                                    <thead>
                                    	<tr>
	                                        <th style="width: 30%">번호</th>
	                                    	<th style="width: 70%">아이디</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${users }">
                                    <c:if test="${user.authStatus eq '2' }">
                                    	<tr>
                                        	<td id="student-no-${user.no }">${user.no }</td>
                                        	<td><a id="student-modal-${user.no }" data-toggle="modal" data-target="#student-info">${user.id }</a></td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${user.authStatus eq '1'}">
                                        <tr>
                                        	<td id="student-no-${user.no }">${user.no }</td>
                                        	<td><a id="student-modal-${user.no }" data-toggle="modal" data-target="#student-info">${user.id }</a></td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${user.authStatus eq '0'}">
                                        <tr>
                                        	<td id="student-no-${user.no }">${user.no }</td>
                                        	<td><a id="student-modal-${user.no }" data-toggle="modal" data-target="#student-info">${user.id }</a></td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${user.authStatus eq '-1'}">
                                        <tr>
                                        	<td id="student-no-${user.no }">${user.no }</td>
                                        	<td><a id="student-modal-${user.no }" data-toggle="modal" data-target="#student-info">${user.id }</a> <i class="ti-trash"></i></td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${user.authStatus eq '-2'}">
                                        <tr>
                                        	<td id="student-no-${user.no }">${user.no }</td>
                                        	<td><a id="student-modal-${user.no }" data-toggle="modal" data-target="#student-info">${user.id }</a> <i class="ti-trash"></i></td>
                                        </tr>
                                    </c:if>
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

<!-- Modal -->
<div class="modal fade" id="teacher-info" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
								<th style="width: 10%">번호</th>
								<th style="width: 20%">아이디</th>
								<th style="width: 15%">이름</th>
								<th style="width: 30%">이메일</th>
								<th style="width: 25%">삭제/복구</th>
							</tr>
						</thead>
						<tbody>
							<tr id="teacher-info-ajax">
								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="teacher-loading-img" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				<img src="../../../resources/img/manager/loading.gif"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!--  -->

<!-- Modal -->
<div class="modal fade" id="student-info" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
								<th style="width: 10%">번호</th>
								<th style="width: 20%">아이디</th>
								<th style="width: 15%">이름</th>
								<th style="width: 30%">이메일</th>
								<th style="width: 25%">삭제/복구</th>
							</tr>
						</thead>
						<tbody>
							<tr id="student-info-ajax">
								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="student-loading-img" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				<img src="../../../resources/img/manager/loading.gif"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!--  -->

</body>

<%@include file="/WEB-INF/views/manager/common/commonjs.jsp" %>
<script src="/resources/js/manager/users.js"></script>

</html>
