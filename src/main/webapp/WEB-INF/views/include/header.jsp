

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--네비게이션 바~~-->
<div class="wrapper">

<c:if test="${LOGIN_USER.authStatus == 9 }">
	<div style="position:fixed;width:130px;height:130px;background-color:#c9545c;left:15px;bottom:20px;z-index:1;border-radius:100px;border:1px solid #c9545c;padding:25px;text-align:center;">
		<a href="/manager/dashboard.do" style="color:white;">
			<i class="fas fa-lock" style="font-size: 59px;"></i>
			<br><small>관리자 페이지</small>
		</a>
</div>
</c:if>

<!-- 로딩 화면 -->
<div class="sg-loading-fade">
	<div class="sg-loading-box">
		<img alt="" src="/resources/img/user/loading.gif" style="width: 365px;height: 365px;border-radius: 500px;">
	</div>
</div>

<!-- 헤더 -->
	<header class="sg-header">
		<div class="col-sm-offset-2 col-sm-6 sg-menu-left" style="display: block">
			<span>
			<a href="/home.do" style="float: left"><img alt="CODEPEOPLE LOGO" src="/resources/img/user/cope_logo.png" class="cope-logo"></a>
			</span>
			<div class="sg-menu" style="margin-left: 30%;">
				<ul>
					<li><a href="/paid/main.do">PREMIUM</a>
						<ul>
							<li><a href="/paid/home.do?lang=java" style="color:#ff8100;"><img alt="" src="https://visualpharm.com/assets/78/Java-595b40b65ba036ed117d147f.svg" width="30"> JAVA</a></li>
							<li><a href="/paid/home.do?lang=spring"  style="color:#35a853;"><img alt="" src="http://assets.tianmaying.com/avatars/90227ff73b68435eb2449571d0258043.png" width="30"> SPRING</a></li>
							<li><a href="/paid/home.do?lang=javascript" style="color:#e4aa00;"><img alt="" src="https://image.flaticon.com/icons/svg/919/919828.svg" width="30"> JS</a></li>
						</ul></li>
					<li><a href="/free/list.do">OPEN</a></li>
					<li><a href="/qna/list.do?cp=1">Q&A</a></li>
					<li><a href="/qna/notice.do?cp=1">NOTICE</a></li>
					<li style="float: right;margin-top: 13px;">
						<form style="padding-left: 50px;" method=get action="http://www.google.co.kr/search" target="_blank" id="sg-form-search" >
							<input type="text" name="q" value="" placeholder="검색" style="text-align: center; border-radius: 10px; border: none; height: 30px;" name="q">
							<button type="submit" style="border: none; background: none; color: white; font-size: 20px;position:absolute;top:-3px;right:0px;" name="btnG"> <img src="/resources/img/user/icon/google.png" width='20'></button>
						</form>
					</li>
				</ul>
			</div>
		</div>
		<div class="col-xs-4 sg-menu-right">
			<c:choose>
				<c:when test="${LOGIN_USER eq null}">
					<nav class="sg-menu-login" style="font-size: 15px; color: white; font-weight: bold; margin-top: 20px;">
						<a class="sg-text-white login-in" style="cursor:point">LOGIN</a> || <a href="/login/signup.do" class="sg-text-white">JOIN</a>
					</nav>
				</c:when>
				<c:otherwise>
					<a style="margin:0px;padding:0px;" class="btn-sg-menu"><img src="/resources/img/user/icon/${LOGIN_USER.avatar.image eq 'Default' ? 'icon.png' : LOGIN_USER.avatar.image}" alt=""style="width: 30px; height: 30px; border-radius: 100px; margin: 10px; float: left;background-color:white;">
					<span style="font-size:15px;display: inline-block;padding-top: 16px;">${LOGIN_USER.name}</span></a>
					<a style="margin-left:20px;!important" href="/instructor/main.do"><i class="fas fa-book"></i></a>
					<a style="margin-left:20px;" href="/paid/cart.do"><img src="/resources/img/paid/cart-white.png" width=25px; id="cart-menu"></a>
					<div class="sg-menu-info">
						<div class="sg-info-menu-box">
							<div class="sg-info-header">
								<span class="sg-user-img">
									<a href="/user/my/home.do">
										<img src="/resources/img/user/icon/${LOGIN_USER.avatar.image eq 'Default' ? 'icon.png' : LOGIN_USER.avatar.image}"
										style="width: 70px; height: 70px; border-radius: 100px; margin: 10px; float: left;background-color:white;">
									</a>
								</span>
								<div class="sg-user-info">
										<p><a href="/user/my/info.do">${LOGIN_USER.name }</a></p>
									
										<p><a href="/user/my/stat.do">${LOGIN_USER.avatar.exp }exp</a></p>
									<p>
										<a href="/login/logout.do">로그아웃</a>
									</p>
								</div>
							</div>
							<div class="sg-info-body">
								<ul>
									<li><a href="/user/my/video.do">내 강좌</a><i class="glyphicon glyphicon-folder-open"></i></li>
									<li><a href="/user/my/chat.do">친구 목록/채팅</a><i class="fas fa-bell"></i></li>
									<li><a href="/user/my/info.do">결제 내역</a><i class="glyphicon glyphicon-credit-card"></i></li>
									<li><a href="#">위시리스트</a><i class="fas fa-heart"></i></li>
								</ul>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</header>
	<!--헤더 끝~~-->
	
	<!--유저 헤더 시작~~-->
	<div class="sg-user-header sg-background"
		style="background: url(/resources/img/user/background/<c:choose><c:when test="${LOGIN_USER == null }">Productsp-Page-Header-1500x300.jpg</c:when><c:otherwise>${LOGIN_USER.avatar.bgImg != 'Default' ? LOGIN_USER.avatar.bgImg:'Productsp-Page-Header-1500x300.jpg'}</c:otherwise></c:choose>) 0% 30% / cover !important;">
		<div class="container text-center sg-user-show">
			<div>
				<c:choose>
					<c:when test="${LOGIN_USER == null }">
						<div c	lass="text-center" style="margin-top: 20px;">
							<img class="sg-profile-img" src="<c:url value='/resources/img/user/icon/'/>icon.png" width="165px" height="165px">
						</div>
						<div class="col-xs-12 text-center" style="margin-top: 20px;">
							<a class="login-in sg-user-name">손님</a>
							 <span style="position: absolute; margin-top: 10px;"></span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="text-center" style="margin-top: 20px;">
							<a href="/user/my/home.do"><img class="sg-profile-img" src="<c:url value='/resources/img/user/icon/'/>${LOGIN_USER.avatar.image eq 'Default' ? 'icon.png' : LOGIN_USER.avatar.image}" width="165px" height="165px"></a>
						</div>
						<div class="col-xs-12 text-center" style="margin-top: 20px;">
							<a class="sg-user-name" href="/user/my/info.do">${LOGIN_USER.name }</a>
							<span></span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="text-center btn-close-header">
			<i class="fas fa-caret-up sg-size-lg sg-text-white"></i>
		</div>
	</div>


	<div class="sg-modal-fade">
		<div class="sg-modal-box">
			<div class="sg-modal-login">
				<div class="col-md-8">
					<h1 class="text-center sg-text-alert">어서오세요!</h1>
					<form id="form-login" action="/login/login.do" method="post">
						<label for="id">아이디</label> <input type="text" name="id" autocomplete="off" id="input-login-id"> 
						<label for="password">비밀번호</label> 
						<input type="password" name="password" id="input-login-pwd">
						<button class="sg-btn sg-btn-primary" style="display: block;width: 100%;height: 58px;margin-top: -3px;">로그인</button>
					</form>
				</div>
				<div class="col-md-4" style="padding-top: 60px; height: 100%;">
					<a href="/login/googleSignIn.do"><img alt="Connect with Google" src="https://d81pi4yofp37g.cloudfront.net/wp-content/plugins/wordpress-social-login/assets/img/32x32/wpzoom/google.png" style="    margin-bottom: 20px;
    margin-top: 25px;"></a>
					<a href="/login/naverSignIn.do"><img alt="Connect with Naver" src="http://static.nid.naver.com/oauth/small_g_in.PNG" height="60" width="195" style="margin-bottom: 20px;"></a>
					<a href="/login/signup.do" style="height:60px;width:195px;display:block;text-align:center" class="sg-btn sg-btn-primary sg-btn-lg">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	


	<script>
	$("input[id^='input-login']").focus(function(){$(this).animate({'padding-left':'13%'}).prev().animate({left:'0%','font-size':'12px'})});
	$("input[id^='input-login']").focusout(function(){if($(this).val()==""){$(this).css('padding-left','20%').prev().animate({left:'10%','font-size':'15px'})}});

	function shake(){
			 $(".sg-modal-box").animate({left:"24%"},70);
			 $(".sg-modal-box").animate({left:"26%"},70);
			 $(".sg-modal-box").animate({left:"24%"},70);
			 $(".sg-modal-box").animate({left:"26%"},70);
			 $(".sg-modal-box").animate({left:"25%"},70);
		}
		var reqListener = '${param.fail}' || "";
		if(reqListener != ""){
			shake();
		if (reqListener == "login") {
			$(".sg-modal-fade").show();
			$(".sg-text-alert").text("아이디 혹은 비밀번호가 일치하지 않습니다.");
		} else if (reqListener == "auth") {
			$(".sg-modal-fade").show();
			$(".sg-text-alert").text("이메일 인증을 받으신 후 로그인 해주세요!");
		}else if (reqListener == "lp") {
			$(".sg-modal-fade").show();
			$(".sg-text-alert").text("로그인을 해주시기 바랍니다.");
		}else if (reqListener == "g") {
			$(".sg-modal-fade").show();
			$(".sg-text-alert").text("권한이 없습니다.");
		}
		}
		
		$(".sg-modal-box").on("mouseenter", function() {
			$(this).addClass("in");
		})
		$(".sg-modal-box").on("mouseleave", function() {
			$(this).removeClass("in");
		})
		$(".sg-modal-fade").on("click", function() {
			if (!$(".sg-modal-box").hasClass("in")) {
				$(this).fadeOut();
			}
		})
		$(".login-in").click(function() {
			$(".sg-modal-fade").fadeIn();
		});

		$("#form-login").submit(function() {
			var userId = $("#input-login-id");
			var userPwd = $("#input-login-pwd");

			if ("" == userId.val()) {
				shake();
				$(".sg-text-alert").text("아이디를 입력하세요!");
				return false;
			}

			if ("" == userPwd.val()) {
				shake();
				$(".sg-text-alert").text("비밀번호를 입력하세요!");
				return false;
			}
			$.ajax({
				type : "post",
				url : "/user/login.do",
				dataType : "json",
				data : {
					id : userId.val(),
					password : userPwd.val()
				},
				success : function(result) {
					console.log(result);
					$(".sg-text-alert").text(result);
				}
			})
		})
	</script>
	<!--유저 헤더 끝~~-->