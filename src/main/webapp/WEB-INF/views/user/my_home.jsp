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
     
      <div class="user-info-body" style="min-height:300px;margin-top:30px;padding-left:30px;">
       
        <div class="col-xs-6" style="border-right:1px solid lightgrey;">
		 <h3>최근 본 강좌 <a href="video.do" style="font-size:14px;">(전체보기)</a></h3>

          <div class="my-video-container" style="display: inline-block;">

 		<c:forEach items="${myHistorys }" var="history" varStatus="status">
          <div class="my-video-box">
	          <div class="my-video-contents">
	            <div class="my-video">
	              <img src="/resources/img/paid/lectureimg/${history.buyLecture.paidLecture.thumbnail}" class="my-video-thumnail">
	            </div>
	            <div class="my-video-title">${history.buyLecture.paidLecture.title }</div>
				<div class="my-video-footer">
		            <span style="font-size:17px;"><i class="fas fa-heart" style="color:#ff6060;"></i>${history.buyLecture.paidLecture.like}</span>
		            <span style="right: 10px;position: absolute;"><fmt:formatNumber value="${history.buyLecture.paidLecture.price }"/><i class="fas fa-won-sign"></i></span>
				</div>            
	          </div>
	          <div class="my-video-overlay">
	          	<h4>${history.buyLecture.paidLecture.title }</h4>
	          	<div class="my-graph">
                	<div style="width:5%;"></div>
              	</div>
	            <div class="my-graph-info">
	                <span>10개 강의 중 1개 완료</span>
	                <span>5%</span>
              	</div>
	          	<strong>Summary</strong>
	          	<p style="background: #ffb1b130;padding: 5px;border-radius: 5px;">${history.buyLecture.paidLecture.summary }</p>
	          	<p style="position:absolute;bottom:5px;right:5px;"><a href="/paid/detail.do?no=${history.buyLecture.paidLecture.no }" class="sg-btn sg-btn-primary sg-nb">LEANING</a></p>
	          </div>
          </div>
		</c:forEach>
		<c:if test="${fn:length(myHistorys) == 0 }"><h1>구매한 강좌가 없습니다.</h1></c:if>
        </div>


        </div>

        <div class="col-xs-6">

          <div class="col-xs-12" style="padding:10px;">
            <h3>최근 획득한 뱃지<a href="stat.do" style="font-size:14px;">(전체보기)</a></h3>
            <br>
			<c:forEach items="${have }" var="badge">
              <div class="sg-badge-box"><i class="fas ${badge.icon }"></i></div>
            </c:forEach>
          <hr>
          </div>
         <div class="row col-xs-12">
              <div class="">
                <h3>최근 나의 활동</h3>
                <ul style="border-left:1px solid lightgray;padding:10px;">
                <c:forEach items="${have }" var="badge">
                  <li style="margin-bottom:10px;">
                    <i class="sg-li"></i>
                    <span class="sg-text-sub">오늘</span>
                    <div class="">
                      ${badge.name } 뱃지 획득! <span class="sg-text-sub">${badge.exp }exp ++</span>
                    </div>
                  </li>
                </c:forEach>
                
                </ul>
              </div>
            </div>


        </div>
      </div>
    </div>

<script>
$('.my-video-container').on('mouseleave','.my-video-box',function(){
	$(this).find('.my-video-overlay').fadeOut();
});

$('.my-video-container').on('mouseover','.my-video-box',function(){
	$(this).find('.my-video-overlay').fadeIn();
});

</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>