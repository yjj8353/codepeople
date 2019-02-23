$(function() {

	$('a').click(function(){
		console.log($(this).attr('href'),$(this).attr('href') != '',$(this).attr('href') != '#');
		if($(this).attr('href') && $(this).attr('href') != '' && $(this).attr('href') != '#'){
			$('.sg-loading-fade').show().css('opacity','0').animate({'opacity':1},300);
		}
	})
	
	$('.history-back').click(function(){
	  history.back()
	})
	
  //유저 메뉴 클릭
  $(".btn-sg-menu").click(function() {
    $(".sg-menu-info").slideToggle();
  })
  //헤더
  $(document).scroll(function() {
    if ($(document).scrollTop() >= 200) {
      $(".sg-header").addClass("sg-fixed");
      $(".sg-header").css("border-bottom", "1px solid #d5d5d5");
      $(".sg-menu>ul>li>a,.sg-header div>a,.sg-menu-login>*").css("color", "black");
      $("#cart-menu").attr("src","/resources/img/paid/cart-black.png");
      $(".sg-header input").css("border", "2px solid #ff7373")
    } else {
      $(".sg-header").removeClass("sg-fixed");
      $(".sg-header").css("border-bottom", "none");
      $(".sg-menu>ul>li>a,.sg-header div>a,.sg-menu-login>*").css("color", "white");
      $("#cart-menu").attr("src","/resources/img/paid/cart-white.png");
      $(".sg-header input").css("border", "none")
    }
  })

  //헤더 접기 버튼 쿠키 생성 
  var headerCookie = /header_show=([^;]*)/.test(document.cookie) ? unescape(RegExp.$1) : '';
  if(headerCookie == 'N'){
	  $('.sg-user-show').hide();
	  $('.btn-close-header i').removeClass('fa-caret-up').addClass('fa-caret-down');
  }
  
  $(".btn-close-header").click(function() {
	  headerCookie = /header_show=([^;]*)/.test(document.cookie) ? unescape(RegExp.$1) : '';
	  if(!headerCookie){
		  setCookie('header_show','Y',10);
		  $('.btn-close-header i').removeClass('fa-caret-up').addClass('fa-caret-down');
	  }else{
		  if(headerCookie == 'Y'){
			  setCookie('header_show','N',10);
			  $('.btn-close-header i').removeClass('fa-caret-up').addClass('fa-caret-down');
		  }else{
			  setCookie('header_show','Y',10);
			  $('.btn-close-header i').removeClass('fa-caret-down').addClass('fa-caret-up');
		  }
		  $(".sg-user-show").slideToggle();
	  }
  });
  
  function setCookie(cName, cValue, cDay){
      var expire = new Date();
      expire.setDate(expire.getDate() + cDay);
      cookies = cName + '=' + escape(cValue) + '; path=/ '; 
      if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
      document.cookie = cookies;
  }
  
  
  $('[data-toggle="tooltip"]').tooltip(); 

  $('.sg-modal-box a').click(function(){
	  $('.sg-loading-fade').fadeIn();
  })
  
    $('.my-video-container').on('mouseleave','.my-video-box',function(){
		$(this).find('.my-video-overlay').fadeOut(300);
	});
	
	$('.my-video-container').on('mouseover','.my-video-box',function(){
		$(this).find('.my-video-overlay').fadeIn(300);
	});

  
  
  // 숫자 카운트
  var timers = [];
    	$('.sg-count').each(function(index, item) {
    		var sgCount = $(item).text();
    		var count = 0;
    		var timer = setInterval(function() {
    			
    			if (timers[index].c == timers[index].s) {
    				clearTimeout(timers[index].t);
    			}
    			$(timers[index].e).text(timers[index].c++);
    		}, 30);
    		
    		timers.push({t:timer, s:sgCount, c:count, e:item});
    	})
  
  setTimeout(function(){
	  $('.sg-loading-fade').fadeOut();
  }, 100);
    
});