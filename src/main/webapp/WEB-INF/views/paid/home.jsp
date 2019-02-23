<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet" href="/resources/css/paid/home.css?ver=<%=new Date()%>">
<script src="/resources/js/paid/home.js?ver=<%=new Date()%>"></script>

</head>
<body>
<input type="hidden" id="lang" value="${param.lang }">
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
	

	<c:choose>
		<c:when test="${param.lang == 'java'}">

			<div class="paid-home-courses-banner-java col-xs-12">
				<h1 id="paid-home-courses-category">JAVA COURSES</h1>
				<p id="paid-home-courses-description">전 세계에서 가장 많이 쓰이는 프로그래밍 언어, 자바</p>
			</div>

		</c:when>
		<c:when test="${param.lang == 'javascript'}">

			<div class="paid-home-courses-banner-javascript col-xs-12">
				<h1 id="paid-home-courses-category">JAVASCRIPT COURSES</h1>
				<p id="paid-home-courses-description">강력하고 유연한 웹의 NEXT GENERATION</p>
			</div>

		</c:when>
		<c:when test="${param.lang == 'spring'}">

			<div class="paid-home-courses-banner-spring col-xs-12">
				<h1 id="paid-home-courses-category">SPRING COURSES</h1>
				<p id="paid-home-courses-description">스프링을 안다면 당신은 OOP를 통달한 것이다</p>
			</div>

		</c:when>
	</c:choose>	



		<div class="paid-home-top-recommend col-xs-12">
			<ul>
				<li class="selected"><button class="sg-none btn-new4">NEW 4</button></li>
				<li><button class="sg-none btn-top4">TOP 4</button></li>
			</ul>
		</div>

		<div class="col-xs-12">
			<hr>
		</div>

		<!-- ~~  NEW4  ~~ -->
		<div class="col-xs-12 new4">
		
		<c:forEach var="result" items="${paidLectures }" varStatus="status" begin="0" end="3">
			<div class="col-xs-3">
				<div class="panel panel-default paid-home-course-wrapper">
					<div class="panel-body">
						<div class="courses-photo">
						<a href="/paid/detail.do?no=${result.no }">
						
					<c:choose>
						<c:when test="${!empty result.thumbnail }">
							<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/${result.thumbnail}" align="center" />
						</c:when>
						<c:otherwise>
							<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/noimage.jpg" align="center" />
						</c:otherwise>
					</c:choose>
						
						
						</a>
						</div>
						
						<div class="paid-home-panel-top-title-wrapper">
						<p id="paid-home-panel-top-title">${result.title }</p>
						<p id="paid-home-panel-top-instructor"><span>담당 마스터 : </span>${result.instructor.user.name}</p>
						<div>
							<span class="like-image"><img src="/resources/img/paid/heartFill.png" width="20px" class="fill"/></span>
							<span class="number-of-like">좋아요 ${result.like }</span>
						</div>
						</div>
						
						
						<div>
							<p id="paid-home-panel-top-price">
							<fmt:formatNumber value="${result.price }" pattern="#,###.##"/>
							<span> 원</span></p>
						</div>
					</div>
					
					<div class="paid-home-info-overlay">
						<div class="overlay-wrapper">
							<div class="overlay-date">
							   <span>UPDATED : </span>
							   <fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.createDate }" />
							</div>
							<div class="overlay-title">
								<h4>${result.title }</h4>
							</div>
							<div class="overlay-level">
								<span>level : </span><span>${result.level }</span>
							</div>
							<div class="overlay-summary">
								${result.summary }
							</div>
							<div style="margin-left: 5px; font-size: 10px;">
								<a href="/paid/detail.do?no=${result.no }"> → 강좌 구경하기</a>
							</div>
							<div class="overlay-button">
								<c:choose>
									<c:when test="${empty LOGIN_USER  }">
										<button class="sg-none sg-btn-primary login-in" id="home-nonLogin-btn">
											카트에 담기
										</button>
									</c:when>
									<c:otherwise>
												<button class="sg-btn-primary home-cart-btn">카트에 담기</button>
												<input type="hidden" class="lectureNo" name="lectureNo" value="${result.no }">
									</c:otherwise>
																
								</c:choose>
							
							</div>

							
						</div>
					</div>
					
				</div>
			</div>
		</c:forEach>

		</div>


		<!-- ~~  TOP4  ~~ -->
		<div class="col-xs-12 top4" style="display:none">
		
		<c:forEach var="result" items="${top4 }" varStatus="status">
			<div class="col-xs-3">
				<div class="panel panel-default paid-home-course-wrapper">
					<div class="panel-body">
						<div class="courses-photo">
						<a href="/paid/detail.do?no=${result.no }">
						
					<c:choose>
						<c:when test="${!empty result.thumbnail }">
							<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/${result.thumbnail}" align="center" />
						</c:when>
						<c:otherwise>
							<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/noimage.jpg" align="center" />
						</c:otherwise>
					</c:choose>
						
						
						</a>
						</div>
						
						<div class="paid-home-panel-top-title-wrapper">
						<p id="paid-home-panel-top-title">${result.title }</p>
						<p id="paid-home-panel-top-instructor"><span>담당 마스터 : </span>${result.instructor.user.name}</p>
						<div>
							<span class="like-image"><img src="/resources/img/paid/heartFill.png" width="20px" class="fill"/></span>
							<span class="number-of-like">좋아요 ${result.like }</span>
						</div>
						</div>
						
						
						<div>
							<p id="paid-home-panel-top-price">
							<fmt:formatNumber value="${result.price }" pattern="#,###.##"/>
							<span> 원</span></p>
						</div>
					</div>
					
					<div class="paid-home-info-overlay">
						<div class="overlay-wrapper">
							<div class="overlay-date">
							   <span>UPDATED : </span>
							   <fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.createDate }" />
							</div>
							<div class="overlay-title">
								<h4>${result.title }</h4>
							</div>
							<div class="overlay-level">
								<span>level : </span><span>${result.level }</span>
							</div>
							<div class="overlay-summary">
								${result.summary }
							</div>
							<div style="margin-left: 5px; font-size: 10px;">
								<a href="/paid/detail.do?no=${result.no }"> → 강좌 구경하기</a>
							</div>
							<div class="overlay-button">
								<c:choose>
									<c:when test="${empty LOGIN_USER  }">
									<a href="/user/signup.do">
										<button class="sg-btn-primary" id="home-nonLogin-btn">카트에 담기</button>
									</a>
									</c:when>
									<c:otherwise>
												<button class="sg-btn-primary home-cart-btn">카트에 담기</button>
												<input type="hidden" class="lectureNo" name="lectureNo" value="${result.no }">
									</c:otherwise>
																
								</c:choose>
							
							</div>

							
						</div>
					</div>
					
				</div>
			</div>
		</c:forEach>		
		</div>


		<div class="paid-home-courses-contents-list col-xs-12">
			<h4>TOTAL <span style="font-size:25px; font-weight:700; color:red;"> ${countLectures } </span> COURSES
				<input type="text" class="sg-input-text" id="lecture-keyword" style="float:right;width:200px;" placeholder="검색">
			</h4>
			
			<div class="lecture-box">
				<c:forEach var="result" items="${paidLectures }" varStatus="status">
						<a href="/paid/detail.do?no=${result.no }" id="paid-home-below-contents">
					<div class="col-xs-12 paid-courses-content">
						<div class="col-xs-2 courses-photo">
						
						<c:choose>
							<c:when test="${!empty result.thumbnail }">
								<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/${result.thumbnail}" align="center" />
							</c:when>
							<c:otherwise>
								<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/noimage.jpg" align="center" />
							</c:otherwise>
						</c:choose>
						
						</div>
						<div class="col-xs-7 paid-home-courseInfo-wrapper">
							<div>
								<h3 id="paid-home-courses-title">${result.title }</h3>
							</div>
							<div>
								<p id="paid-home-courses-content-description">${result.summary }</p>
							</div>
						</div>
						<div class="col-xs-2.5">
							<div>
								<p id="paid-home-courses-price">
								<fmt:formatNumber value="${result.price }" pattern="#,###.##"/>
								<span> 원</span>
								
								</p>
							</div>
						</div>
					</div>
						</a>					
				</c:forEach>
			</div>
			
		<div class="col-xs-12 text-center search-lecture-box" style="margin-top:20px;">
			<button class="sg-btn sg-nb sg-btn-primary sg-btn-lg" id="btn-get-lecture" style="width:80%">더보기</button>
		</div>
		</div>


	</div>

		<script>
		$(function(){
			$('.paid-home-top-recommend').on('click', '.btn-new4', function() {
				$('.top4').hide();
				$('.new4').show();
			})

			$('.paid-home-top-recommend').on('click', '.btn-top4', function() {
				$('.new4').hide();
				$('.top4').show();
			})
			
			var cp = 2;
			// 아이템 가져오는 기능
			function searchLecture(){
				var keyword = $("#lecture-keyword").val();
				var lang = $("#lang").val();
				$.ajax({
					url:"searchPage.do",
					type:"get",
					dataType:"json",
					data:{cp:cp,keyword:keyword,lang:lang},
					success:function(data){
						if(data.length > 0){
							$(data).each(function(index,result){
								var text = '';
								text += '<a href="/paid/detail.do?no='+result.no+'" id="paid-home-below-contents">';
								text += '<div class="col-xs-12 paid-courses-content">'
								text += '<div class="col-xs-2 courses-photo">'
								text += '<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/'+result.thumbnail+'" align="center" />'
								text += '</div>'
								text += '<div class="col-xs-7 paid-home-courseInfo-wrapper">'
								text += '<div>'
								text += '<h3 id="paid-home-courses-title">'+result.title+'</h3>'
								text += '</div>'
								text += '<div>'
								text += '<p id="paid-home-courses-content-description">'+result.summary+'</p>'
								text += '</div>'
								text += '</div>'
								text += '<div class="col-xs-2.5">'
								text += '<div>'
								text += '<p id="paid-home-courses-price">'
								text += '<span>'+ result.price+' 원</span>'
								text += '</p>'
								text += '</div>'
								text += '</div>'
								text += '</div>'
								text += '</a>'
								$('.lecture-box').append(text);
							})
						}
						if(data.length == 5){
							$('.search-lecture-box').append('<button class="sg-btn sg-nb sg-btn-primary sg-btn-lg" id="btn-get-lecture" style="width:80%">더보기</button>');
						
						}
					}
				})
			}
				
			// 더보기 클릭 시 
			$(".search-lecture-box").on('click', '#btn-get-lecture', function() {
					searchLecture();
					cp++;
					$('#btn-get-lecture').remove();
			});
			
			// 키워드 입력 시
			$(".paid-home-courses-contents-list").on('keydown','#lecture-keyword',function(e){
				if(e.keyCode == 13){
					cp = 1;
					$('.lecture-box').text("");
					$('#btn-get-lecture').remove();
					searchLecture();
					cp++;
				}
			})
		})
		</script>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>