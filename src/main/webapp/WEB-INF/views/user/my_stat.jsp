<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href='/resources/css/user/my.css?ver=<%=new Date()%>'>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">

     <%@include file="/WEB-INF/views/user/my_header.jsp" %>
     <script type="text/javascript">console.log("${LOGIN_USER.avatar.exp}")</script>
     <div class="user-info-body" style="min-height:300px;margin-top:30px;padding-left:30px;">
         <div class="badge-top text-center">
            <h3 class="text-center" style="margin:30px">현재 ${LOGIN_USER.name }님은 
            <c:choose>
            	<c:when test="${LOGIN_USER.avatar.exp < 150 }">
            	씨앗 단계입니다.<br>
            	<small class="">다음 단계까지 <span class="sg-count">${150 - LOGIN_USER.avatar.exp }</span> exp 남았습니다.</small>
            	</c:when>
            	<c:when test="${LOGIN_USER.avatar.exp >= 150 and LOGIN_USER.avatar.exp < 300 }">
            	떡잎 단계입니다.<br>
            	<small class="">다음 단계까지 <span class="sg-count">${300 - LOGIN_USER.avatar.exp }</span> exp 남았습니다.</small>
            	</c:when>
            	<c:when test="${LOGIN_USER.avatar.exp >= 300 and LOGIN_USER.avatar.exp < 500 }">
            	새싹 단계입니다.<br>
            	<small class="">다음 단계까지 <span class="sg-count">${700 - LOGIN_USER.avatar.exp }</span> exp 남았습니다.</small>
            	</c:when>
            	<c:when test="${LOGIN_USER.avatar.exp >= 500 and LOGIN_USER.avatar.exp < 700 }">
            	묘목 단계입니다.<br>
            	<small class="">다음 단계까지  <span class="sg-count">${700 - LOGIN_USER.avatar.exp }</span> exp 남았습니다.</small>
            	</c:when>
            	<c:when test="${LOGIN_USER.avatar.exp > 700}">
            	나무 단계입니다.<br>
            	<small class="">다음 단계까지 <span class="sg-count">${300 - LOGIN_USER.avatar.exp }</span> exp 남았습니다.</small>
            	</c:when>
            </c:choose>
             </h3>
            
            <div class="sg-badge-tier">
               <div class="${LOGIN_USER.avatar.exp < 150 ? 'sg-active':''}">
                  <img src="/resources/img/user/icon/lv_1.PNG" alt="">
                  <span class="sg-badge-exp" style="${LOGIN_USER.avatar.exp < 150 ? '':'display:none'}">씨앗<br>
	             	<small style="font-weight: 400;">0~150 exp</small>
	              </span>
               </div>
               <div class="${LOGIN_USER.avatar.exp >= 150 and LOGIN_USER.avatar.exp < 300 ? 'sg-active':''}">
                  <img src="/resources/img/user/icon/lv_2.PNG" alt="">
                  <span class="sg-badge-exp" style="${LOGIN_USER.avatar.exp >= 150 and LOGIN_USER.avatar.exp < 300 ? '':'display:none'}">떡잎
	              <br>
	              <small style="font-weight: 400;">150~300 exp</small>
                  </span>
               </div>
               <div class="${LOGIN_USER.avatar.exp >= 300 and LOGIN_USER.avatar.exp < 500 ? 'sg-active':''}">
                  <img src="/resources/img/user/icon/lv_3.PNG" alt="">
                  <span class="sg-badge-exp" style="${LOGIN_USER.avatar.exp >= 300 and LOGIN_USER.avatar.exp < 500 ? '':'display:none'}">새싹
                  <br>
	              <small style="font-weight: 400;">300~500exp</small>
	              </span>
               </div>
               <div class="${LOGIN_USER.avatar.exp >= 500 and LOGIN_USER.avatar.exp < 700 ? 'sg-active':''}">
                  <img src="/resources/img/user/icon/lv_4.PNG" alt="">
                  <span class="sg-badge-exp" style="${LOGIN_USER.avatar.exp >= 500 and LOGIN_USER.avatar.exp < 700 ? '':'display:none'}">묘목
                  <br>
	              <small style="font-weight: 400;">500~700exp</small>
	              </span>
               </div>
               <div class="${LOGIN_USER.avatar.exp > 700 ? 'sg-active':''}">
                  <img src="/resources/img/user/icon/lv_5.PNG" alt="">
                  <span class="sg-badge-exp" style="${LOGIN_USER.avatar.exp > 700 ? '':'display:none'}">나무<br>
	              <small style="font-weight: 400;">700~ exp</small>
	              </span>
               </div>
            </div>
            <hr>
         </div>
         <div class="sg-badge-container">
            <div class="sg-badge-success">
               <h3>획득한 뱃지 <span class="badge">${fn:length(have)}</span></h3>
               <br>
               
            <c:forEach items="${have }" var="badge">
            <div class="sg-badge-sub">
              <div class="sg-badge-box"><i class="${badge.icon }"></i></div>
               <div class="sg-badge-contents" style="">
                  <h3>${badge.name }</h3>
                  <p>${badge.condition }</p>
               </div>
               <span class="label label-primary">${badge.exp }</span>
            </div>
            </c:forEach>
            
         </div>
         <hr>
         <h3>획득 가능한 뱃지 <span class="badge">${fn:length(notHave) }</span></h3>
         <br>
         <div class="sg-badge-default">
         
         	<c:forEach items="${notHave }" var="badge">
         	
            <div class="sg-badge-sub">
               <div class="sg-badge-box"><i class="${badge.icon }"></i></div>
               <div class="sg-badge-contents" style="">
                  <h3>${badge.name }</h3>
                  <p>${badge.condition }</p>
               </div>
               <span class="label label-primary">${badge.exp }</span>
            </div>
            
            </c:forEach>

         </div>
	</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>