<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="dashboard.do" class="simple-text">
                    관리자 페이지
                </a>
            </div>

            <ul class="nav">
            	<c:choose>
	            	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/dashboard.jsp' }">
	                	<li class="active">
	                </c:when>
	                <c:otherwise>
	                	<li>
	                </c:otherwise>
	            </c:choose>
                    <a href="dashboard.do">
                        <i class="ti-panel"></i>
                        <p>통계</p>
                    </a>
                </li>
                <c:choose>
                	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/users.jsp' }">
	                	<li class="active">
	                </c:when>
	                <c:otherwise>
	                	<li>
	                </c:otherwise>
	            </c:choose>
                    <a href="users.do">
                        <i class="ti-user"></i>
                        <p>유저</p>
                    </a>
                </li>
                <c:choose>
                	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/post.jsp' }">
	                	<li class="active">
	                </c:when>
	                <c:otherwise>
	                	<li>
	                </c:otherwise>
	            </c:choose>
                    <a href="post.do">
                        <i class="ti-view-list-alt"></i>
                        <p>게시글/댓글</p>
                    </a>
                </li>
                <c:choose>
                	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/acknowledge.jsp' }">
	                	<li class="active">
	                </c:when>
	                <c:otherwise>
	                	<li>
	                </c:otherwise>
	            </c:choose>
                    <a href="acknowledge.do">
                        <i class="ti-check"></i>
                        <p>강의 승인/강의 등록</p>
                    </a>
                </li>
                <c:choose>
                	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/notice.jsp' }">
	                	<li class="active">
	                </c:when>
	                <c:otherwise>
	                	<li>
	                </c:otherwise>
	                </c:choose>
                    <a href="notice.do">
                        <i class="ti-pencil-alt"></i>
                        <p>공지사항</p>
                    </a>
             	</li>
            </ul>
    	</div>
    </div>