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
     
       <div class="user-info-body" style="min-height:300px;padding-left:30px;">
        <div class="row">
          <div class="col-xs-4" style="background-color: #fff6f6;border-right:1px solid lightgray;padding:0px;overflow:auto;height:500px;">
            <div class="" style="background-color:white;border-bottom:1px solid #ffbaba;height:70px;">
               <img alt="" src="/resources/img/user/cope_logo.png" style="width: 267px;">
            </div>
            <c:if test="${fn:length(friends) == 0}">
            	<div class="text-center" style="margin-top:20px;">
            		<p style="font-size: 19px;font-weight: bold;">친구가 없습니다. 친구를 만들어 보세요!</p>
            		<div style="background-color:white;margin:20px;padding-bottom:10px;border: 1px solid lightblue;border-radius:5px;">
            		<h4>친구 만들기</h4>
	            		<ul>
	            			<li>강의에서 사진을 클릭해 친구요청을 보냅니다.</li>
	            			<li>또는</li>
	            			<li>Q&A에서 사진을 클릭해 친구요청을 보냅니다.</li>
	            		</ul>
            		</div>
            	</div>
            </c:if>
            <c:forEach items="${friends }" var="friend">
	            <div class="user-friends" style="">
	              <img class="user-chat-img" src="/resources/img/user/icon/${friend.follower.avatar.image eq 'Default' ? 'icon.png' : friend.follower.avatar.image}" alt="" style="width:50px;height:50px;border: 1px solid lightgray;border-radius:100px;margin:10px;">
	              <span class="friends-name">${friend.follower.name }</span>
	              <div style="display:inline-block;float: right;margin: 18px;">
	              <c:choose>
	              	<c:when test="${friend.follower.userOn == 'ON' }">
		              	<label class="label label-success" id="on-user-${friend.follower.id }">ON</label>
	              	</c:when>
					<c:otherwise>
		              	<label class="label label-default" id="on-user-${friend.follower.id }">OFF</label>
					</c:otherwise>
	              </c:choose>
	              </div>
	              <input type="hidden" class="friends-id" value="${friend.follower.id }">
	            </div>
            </c:forEach>
            
            
          </div>
          <div class="col-xs-8 my-chat-contents" style="padding:0px;height:100%;display:none;">
            <div class="" style="width:100%;margin:0px;padding:0px;background-color:#ffbaba">
              <img class="chat-header-icon" src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" alt="" style="width:50px;height:50px;border: 1px solid lightgray;border-radius:100px;margin:10px;">
              <span class="chat-friends-name"></span>
            </div>
            <div class="my-chat-body" style="height:380px;border-right:1px solid lightgray;overflow:auto;">
            </div>
            <input type="text" id="my-chat-msg" style="border:1px solid lightgray;width:100%;height: 50px;margin:0px;padding:10px;">
            <button type="button" class="my-chat-send sg-btn sg-btn-primary" style="position:absolute;right:0px;bottom:0px;padding:10px;">전송</button>
          </div>
        </div>

      </div>
      
      
    </div>
    
   
<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>