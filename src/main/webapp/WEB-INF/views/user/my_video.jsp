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
        <h3>내 강좌</h3>
        <div class="my-video-search" style="padding:15px;width:91%;">
        	<select id="history-sort" class="sg-input-text" style="width:200px;font-size:14px;">
              <option value="lately">최근 시청 순</option>
              <option value="lean">공부중인 강좌</option>
              <option value="end">완료한 강좌</option>
            </select>
        	<div style="display:inline-block;float:right;">
            <input type="text" id="history-keyword" placeholder="강의 제목을 입력하세요."style="width:230px;font-size:14px;" autocomplete="off" class="sg-input-text">
            <i class="fas fa-search" style="color:#ff7373;position: absolute;top: 12px;right: 15px;"></i>
        	</div>
        </div>
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
                	<div style="width:${history.buyLecture.percentage}%;"></div>
              	</div>
	            <div class="my-graph-info">
	                <span>${history.buyLecture.percentage}%</span>
              	</div>
	          	<strong>Summary</strong>
	          	<p style="background: #ffb1b130;padding: 5px;border-radius: 5px;">${history.buyLecture.paidLecture.summary }</p>
	          	<p style="position:absolute;bottom:5px;right:5px;"><a href="/paid/detail.do?no=${history.buyLecture.paidLecture.no }" class="sg-btn sg-btn-primary sg-nb">LEARNING</a></p>
	          </div>
          </div>
		</c:forEach>
		<c:if test="${fn:length(myHistorys) == 0 }"><h1>구매한 강좌가 없습니다.<small><a href="/paid/main.do">강좌 구경하기</a></small></h1></c:if>
        </div>
        <div style="padding-left:40%;" class="history-more">
        	<c:if test="${fn:length(myHistorys) == 8}">
       			<button class="sg-btn sg-btn-3rd sg-nb sg-btn-lg" id="new-history">더보기</button>
       		</c:if>
        </div>
      </div>
    </div>

<script>
$(function(){
	var cp = 1;
	
	$('.my-video-container').on('mouseleave','.my-video-box',function(){
		$(this).find('.my-video-overlay').fadeOut();
	});
	
	$('.my-video-container').on('mouseover','.my-video-box',function(){
		$(this).find('.my-video-overlay').fadeIn();
	});

	function getHistory(){
		var keyword = $("#history-keyword").val();
		var sort = $("#history-sort").val();
		
		$.ajax({
			url:"getHistory.do",
			type:"post",
			data:{keyword:keyword,sort:sort,cp:cp},
			success:function(result){
				if(result.length){
					$(result).each(function(index,history){
						var text = '<div class="my-video-box">';
				        text += '<div class="my-video-contents">';
				        text += '<div class="my-video">';
				        text += '<img src="/resources/img/paid/lectureimg/'+history.buyLecture.paidLecture.thumbnail+'" class="my-video-thumnail"></div>';
				        text += '<div class="my-video-title">'+history.buyLecture.paidLecture.title+'</div>';
				        text += '<div class="my-video-footer">';
				        text += '<span style="font-size:17px;"><i class="fas fa-heart" style="color:#ff6060;"></i>'+history.buyLecture.paidLecture.like+'</span>';
				        text += '<span style="right: 10px;position: absolute;">'+history.buyLecture.paidLecture.price+'<i class="fas fa-won-sign"></i></span></div>';
				        text += '</div>';
				        text += '<div class="my-video-overlay">';
				        text += '<h4>'+history.buyLecture.paidLecture.title+'</h4>';
				        text += '<p style="font-weight:bold;">level: '+history.buyLecture.paidLecture.level+'</p>';
				        text += '<strong>Summary</strong>';
				        text += '<p style="background: #ffb1b130;padding: 5px;border-radius: 5px;">'+history.buyLecture.paidLecture.summary+'</p>';
				        text += '<p style="position:absolute;bottom:5px;right:5px;"><a href="/paid/detail.do?no='+history.buyLecture.paidLecture.no +'" class="sg-btn sg-btn-primary sg-nb">LEARNING</a></p></div></div>';
				        $('.my-video-container').append(text);
					})
					if(result.length == 8){
						$('.history-more').append('<button class="sg-btn sg-btn-3rd sg-nb sg-btn-lg" id="new-history">더보기</button>');
					}else{
						$('.history-more').html('');
					}
				}else if(!$('.my-video-box').html()){
			        $('.my-video-container').append("<h1>검색 결과가 없습니다.</h1>");
				}
			}
		})
	}

	$("#history-keyword").keypress(function(e){
		if(e.keyCode == 13 || e.keyCode == 8){
			cp = 1;
			$('.history-more').html('');
			$('.my-video-container').html('');
			getHistory();
		}
	});

	$("#history-sort").change(function(){
		cp = 1;
		$('.history-more').html('');
		$('.my-video-container').html('');
		getHistory();
	});
	
	$(".user-info-body").on('click','#new-history',function(){
		cp++;
		getHistory();
	});
})
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>