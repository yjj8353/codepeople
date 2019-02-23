<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/img/manager/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/resources/img/manager/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<c:choose>
    	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/dashboard.jsp' }">
        	<title>관리자 - 통계</title>
        </c:when>
    	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/users.jsp' }">
        	<title>관리자 - 유저</title>
        </c:when>
    	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/post.jsp' }">
        	<title>관리자 - 게시글/댓글</title>
        </c:when>
    	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/acknowledge.jsp' }">
        	<title>관리자 - 강의 승인</title>
        </c:when>
    	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/notice.jsp' }">
        	<title>관리자 - 공지사항</title>
        </c:when>
    	<c:when test="${pageContext.request.requestURI eq '/WEB-INF/views/manager/rtchat.jsp' }">
        	<title>관리자 - 실시간 채팅</title>
        </c:when>
    </c:choose>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="/resources/css/manager/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="/resources/css/manager/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="/resources/css/manager/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/resources/css/manager/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="/resources/css/manager/themify-icons.css" rel="stylesheet">
</head>