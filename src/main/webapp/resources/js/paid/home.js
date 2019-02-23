$(function() {
	
	$(".paid-home-course-wrapper").on("mouseover", function() {
		$(this).children(".paid-home-info-overlay").fadeIn(100);
	})
	

	$(".paid-home-course-wrapper").on("mouseleave", function() {
		$(this).children(".paid-home-info-overlay").css("display", "none");
	})
	
	$(".paid-home-top-recommend").children().children().on("click", function() {
		$(this).siblings().removeClass("selected");
		$(this).addClass("selected");
	})
	
	
	$("#home-nonLogin-btn").on("click", function(event) {
			alert("로그인이 필요한 서비스입니다");
	})
	
	$(".home-cart-btn").on("click", function(event) {
		var lectureNo = $(this).siblings(".lectureNo").val();
		console.log(lectureNo);
		
		   $.ajax({
		        type : "POST",
		        url : "/paid/cart.do",
		        data : {"lectureNo" : lectureNo},
		        error : function() {
		          alert('error!');
		        },
		        success : function(data) {
		        	console.log(data);
		        	if (data == "P") {
		        		alert("이미 구매하신 강좌입니다");
		        	} else if (data == "N") {
		        		alert("이미 카트에 존재하는 강좌입니다");
		        	} else if (data == "failLogin") {
		        		alert("로그인이 필요한 서비스입니다");
		        	} else {
		        		alert("카트에 성공적으로 담았습니다");
		        		location.href="/paid/cart.do";
		        	}
		        }
	      });
		
	})

})