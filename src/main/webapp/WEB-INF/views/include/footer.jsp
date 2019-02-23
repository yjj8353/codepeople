<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--네비게이션 바~~-->
        <!--푸터 시작-->
      <div class="sg-footer">
         <div class="container">
            <div class="col-sm-8">
               <span>
                  (JHTA)FinalProject | 조장:손상기 | 부조장:김동원 | 조원:| 김영범 | 김승용 | 양재준 | <br>
                  손상기: 로그인, 회원가입, 메인 페이지, 마이페이지, 채팅, 알림, Q&A게시판, 화면 구성 및 퍼블리싱 <br>
                  김동원: 강사 관련, 유료 강좌 관련, 강좌 비디오 플레이어 제작, 화면 디자인<br>
                  김영범: 무료 강좌 관련<br>
                  양재준: 관리자 관련<br>
               </span>
            </div>
            <div class="" style="font-weight:bold">
               <a href="#">모두들</a>
               <a href="#">파이팅</a>
               <a href="#">합시다</a>
            </div>
         </div>
      </div>
   </div>
   <!-- 알림창 -->
	<div class="sg-alert">
		<c:if test="${LOGIN_USER != null }">
			<c:if test="${!empty followMe}">
				<c:forEach items="${followMe }" var="follow">
					<div class="sg-alert-box">
						<p>${follow.following.name }님에게 친구요청이 왔습니다.</p>
						<p>
							<button class='sg-btn sg-btn-primary sg-btn-primary sg-btn-xs follow-btn add' value='${follow.following.id }'>수락</button>
							<button class='sg-btn sg-btn-primary sg-btn-3rd sg-btn-xs sg-nb follow-btn del' value="${follow.following.id }">거절</button>
						</p>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${chatCount > 0}">
				<div class="sg-alert-box">
					<p>읽지 않은 메세지가 ${chatCount }개 있습니다.</p>
					<p class="text-center"><a href="/user/my/chat.do">확인하기</a></p>
				</div>
			</c:if>
		</c:if>
	</div>

<c:if test="${LOGIN_USER != null }">
   <chat>
   <a class="sg-none chat-btn"><i class="fas fa-comment" style="font-size:20px;background-color:#c9545c;border-radius:100px;padding:20px;cursor:pointer"><small class="sg-text-white">COPE TALK</small></i></a>
   <div class="chat-container">
     <div class="chat-header">
       <img src="/resources/img/user/icon/${LOGIN_USER.avatar.image eq 'Default' ? 'icon.png' : LOGIN_USER.avatar.image}" class="chat-icon" style="width:50px;height:50px;">
       <span style="color:white;font-size:17px;font-weight:bold;">${LOGIN_USER.name }</span>
       <a style="width:20px;height:20px;display:inline-block;color:white;float:right;font-size:20px;cursor:pointer" class="chat-close">x</a>
       <div class="t-r" style="margin-right:30px;">
		   <button class="chat-back sg-none" style="color:white;font-size:20px;"><i class="fas fa-home"></i></button>
       </div>
     </div>
     <div class="chat-body">
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
            
			<div class="chat-sg" style="display:none;position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: white;overflow: auto;">
			
			</div>
		</div>
     <div class="chat-footer" style="background:#c9545c;">
       
     </div>
   </div>
  </chat>
  
<script type="text/javascript">

function addAlert(contents,ms){
	var temp = new Date().getMilliseconds();
	var text = "<div class='sg-alert-box "+temp+"'>"+contents+"</div>";
	$(".sg-alert").prepend(text);
	if(ms){
		setTimeout(function(){
			$('.'+temp).animate({'opacity':'0'},500,function(){$(this).remove()})
		},ms);
	}
   }
   
$(function(){
	var domain = window.location.pathname.split('/');
	domain = domain[domain.length - 1];
	
	var ws = new WebSocket("ws://www.codepeople.com/chat.do");
	ws.onmessage = function(event) {
		var onAudio = new Audio('/resources/sound/on.mp3');
		var failAudio = new Audio('/resources/sound/fail.mp3');
		var items = event.data.split("/");
		var protocol = items[0];
		var target = items[1];
		// 관리자 문의 알림
		if("ANSWER"==protocol){
			//관리자
			if(target == "ADMIN"){
			var user = JSON.parse(items[2]);
			var text = '<div class=""><img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" class="chat-icon">'+user.name+"("+user.id+')<div>'
			text += '<div class="chat-box t-d"><div class="chat-you"><span>' + items[3] + '</span></div></div>';
			$(".chat-body").append(text);
			}
			//유저
			else if(target == "USER"){
				var check = true;
					var chatAudio = new Audio('/resources/sound/chat.mp3');
					var user = JSON.parse(items[2]);
					var msg = items[3];
					var text = "<p>"+user.name+"님에게 메세지가 왔습니다.</p>";
					text += "<p>"+msg+"</p>"
					text += "<p><a href='/user/my/chat.do'>답장하러가기</a></p>";
				// 채팅일 경우 채팅창에 채팅 추가
					var checkId = $('.user-friends.active input[type=hidden]').val();
					if(checkId == user.id){
						check = false;
						var text = '<div class=""><img src="/resources/img/user/icon/'+user.avatar.image+'" class="chat-icon">'+user.name+'<div>';
						text += '<div class="chat-box t-d"><div class="chat-you"><span>' + msg + '</span></div></div>';
						$(".my-chat-body,.chat-sg").append(text);
						$(".my-chat-body,.chat-sg").scrollTop(1000000);
						$.get("chat/viewChat.do",{recvUserId:user.id});
					}
				if(check){
					addAlert(text,3000);
					chatAudio.play();
				}
			}
		}
		// 친구추가
		else if("FOLLOWING" == protocol){
			var sendUser =  JSON.parse(items[1]);
			var text = "<p>"+sendUser.name+"님에게 친구요청이 왔습니다.</p>";
			text += "<p><button class='sg-btn sg-btn-primary sg-btn-primary sg-btn-xs follow-btn add' value='"+sendUser.id+"'>수락</button><button class='sg-btn sg-btn-primary sg-btn-3rd sg-btn-xs sg-nb follow-btn del' value='"+sendUser.id+"'>거절</button></p>"
			addAlert(text);
			
			onAudio.play();
		}
		// 유저 접속 시 
		else if ("ONUSER" == protocol){
			var target = items[1];
				var onUser = JSON.parse(items[2]);
			if(target == "CHAT"){
				$("#on-user-"+onUser.id).addClass("label-success").removeClass("label-default").text("ON");
			}
			else if(target == "ALERT"){
				var text = '<p><img src="/resources/img/user/icon/';
				text += (onUser.avatar.image != 'Default') ? onUser.avatar.image : 'icon.png';
				text += '"class="chat-icon"/>'+onUser.name+"님이 접속했습니다.</p>";
				addAlert(text,3000);
				onAudio.play();
			}
		}
		// 유저 로그아웃 시 
		else if("OFFUSER" == protocol){
				var offUser = JSON.parse(items[1]);
				$("#on-user-"+offUser.id).addClass("label-default").removeClass("label-success").text("OFF");
		}
		// 친구 추가 수락 및 거절
		else if("FRIEND" == protocol){
			var target = items[1];
			var sendUserName = items[2];
			
			if(target == 'ACCEPT'){
				var onAudio = new Audio('/resources/sound/on.mp3');
				var failAudio = new Audio('/resources/sound/fail.mp3');
				var text = "<p>"+sendUserName+"님이 친구요청을 수락했습니다.</p>";
				text += "<p><a href='/user/my/chat.do'>채팅하러가기</a></p>";
				addAlert(text,5000);
				onAudio.play();
			}else if(target == 'REFUSE') {
				var text = "<p>"+sendUserName+"님이 친구요청을 거절했습니다.</p>";
				addAlert(text,5000);
				failAudio.play();
			}
			$("#on-user-"+offUser.id).addClass("label-default").removeClass("label-success").text("OFF");
		}
		// 뱃지 알림
		else if("BADGE" == protocol){
			var onAudio = new Audio('/resources/sound/on.mp3');
			var text = "<p style='font-size:18px;font-weight:bold;'>새로운 뱃지를 획득하셨습니다!</p>";
			addAlert(text,5000);
			onAudio.play();
		}
	}
	  
       ///#@!#@! 마이 페이지 채팅 #@!#@!#@!
		
       // 유저 클릭시 채팅 불러오기
       $(".user-info-body").on("click",".user-friends",function() {
          $(".user-info-body .user-friends").removeClass("active");
          $(this).addClass("active");
          $('.chat-friends-name').text($(this).find(".friends-name").text());
          $('.chat-header-icon').attr('src',$(this).find('.user-chat-img').attr('src'));
          $(".my-chat-body").text("");
          $(".my-chat-contents").show();
	    	var userId = $(this).find(".friends-id").val();
          $.ajax({
        	  type:"get",
        	  url:"/user/my/chat/getAll.do",
        	  dataType:"json",
        	  data:{recvUserId:userId},
        	  success:function(result){
        		  result.forEach(function(item,index){
        			  var text = '';
        			  if(item.sendUser.id == '${LOGIN_USER.id}'){
        			  	text += '<div class="my-chat-box t-r"><div class="my-chat-my"><span>' + item.contents + '</span></div></div>';
        			  }else{
        				  text += '<div class=""><img src="/resources/img/user/icon/';
        				  if(item.sendUser.avatar.image!='Default'){
        					  text+= item.sendUser.avatar.image;
        				  }else{
        					  text+= 'icon.png';
        				  }
        				  text+='" class="chat-icon">'+item.sendUser.name+'<div>';
        				  text += firstDiv + item.contents + lastDiv;
        			  }
        			  
        	           $(".my-chat-body").append(text);
        	           $(".my-chat-body").scrollTop(1000000);
        		  })
        	  },
        	  beforeSend:function(){
        		  $("")
        	  },complate:function(){
        		  
        	  }
          })
       })
       
       /* 푸터 채팅 !@#!!@ fixed */
       $(".chat-container").on("click",".user-friends",function() {
          $(".chat-container .user-friends").removeClass("active");
          $(this).addClass("active");
       });
       
       $('.chat-back').click(function(){
          $(".chat-body").css('overflow','auto');
          $('.chat-footer').css('background','#c9545c').html('');
          $('.user-friends').removeClass("active");
          $(".chat-sg").hide();
          $(".chat-sg").text("");
       });
       
       $(".chat-container").on("dblclick",".user-friends",function() {
          $(".chat-body").scrollTop(0);
          $(".chat-body").css('overflow','hidden');
          $(".chat-footer").css('background','white');
          $('.chat-friends-name').text($(this).find(".friends-name").text());
          $('.chat-header-icon').attr('src',$(this).find('.user-chat-img').attr('src'));
          $(".chat-sg").text("");
          $(".chat-sg").show();
	    	var userId = $(this).find(".friends-id").val();
          $.ajax({
        	  type:"get",
        	  url:"/user/my/chat/getAll.do",
        	  dataType:"json",
        	  data:{recvUserId:userId},
        	  success:function(result){
        		  result.forEach(function(item,index){
        			  var text = '';
        			  if(item.sendUser.id == '${LOGIN_USER.id}'){
        			  	text += '<div class="my-chat-box t-r"><div class="my-chat-my"><span>' + item.contents + '</span></div></div>';
        			  }else{
        				  text += '<div class=""><img src="/resources/img/user/icon/';
        				  if(item.sendUser.avatar.image!='Default'){
        					  text+= item.sendUser.avatar.image;
        				  }else{
        					  text+= 'icon.png';
        				  }
        				  text+='" class="chat-icon">'+item.sendUser.name+'<div>';
        				  text += firstDiv + item.contents + lastDiv;
        			  }
        			  
        	           $(".chat-sg").append(text);
        	           $(".chat-sg").scrollTop(1000000);
        		  })
        		  footerText = '<label class="fas fa-paperclip" for="chat-file"></label><input type="file" id="chat-file" />';
    			  footerText +='<input type="text" style="height:100%;border:none;" placeholder="메세지를 입력해주세요." autocomplete="off" id="chat-msg">';
    			  footerText +='<a class="chat-send"><i class="far fa-comment" style="margin-left:20px;"></i></a>';
    			  $(".chat-footer").append(footerText);
        	  },
        	  beforeSend:function(){
        		  $("")
        	  },complate:function(){
        		  
        	  }
          })
       })

		
   	// 푸터 채팅~!@!~@~!
   	  // 채팅 로드
   	  var firstDiv = '<div class="chat-box t-d"><div class="chat-you"><span>';
   	  var lastDiv = '</span></div></div>';
   	  var icon = '<div class=""><img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" class="chat-icon"><div>';

   	  //채팅 입력/출력 기능
	   	function userChatSubmit(userId){
	        var $msg = $("#chat-msg");
	        ws.send("USER:"+userId+":"+$msg.val());
	        var text = '<div class="t-r"><div class="my-chat-my"><span>' + $msg.val() + '</span></div></div>';
	        $(".chat-sg").append(text);
	        $msg.val("");
	        $(".chat-sg").scrollTop(100000)
	      }
   	  
   	  // 엔터키 누를시 표시
   	 $(".chat-footer").on('keydown','#chat-msg',function(event) {
   	      if (event.keyCode == 13 && $("#chat-msg").val()) {
   	    	  var userId = $(".user-friends.active").find(".friends-id").val();
   	    	userChatSubmit(userId);
   	      }
   	  });
   	  
   	  // 클릭시 표시
   	  $(".chat-footer").on('click','.chat-footer',function() {
   		  var userId = $(".user-friends.active").find(".friends-id").val();
   		userChatSubmit(userId);
   	  });

   	  // 채팅 버튼 클릭
   	  $(".chat-btn,.chat-close").on("click",function() {
   	    $(".chat-container").slideToggle();
	   	 $(".chat-body").css('overflow','auto');
	     $('.chat-footer').css('background','#c9545c').html('');
	     $('.user-friends').removeClass("active");
	     $(".chat-sg").hide();
	     $(".chat-sg").text("");
  });
       
       // 마이 페이지 채팅

        function chatSubmit(userId){
          var chatbar = $("#my-chat-msg");
          ws.send("USER:"+userId+":"+chatbar.val());
          var text = '<div class="my-chat-box t-r"><div class="my-chat-my"><span>' + chatbar.val() + '</span></div></div>';
          $(".my-chat-body").append(text);
          chatbar.val("");
          $(".my-chat-body").scrollTop(100000)
        }

        // 채팅 엔터키 누를시 표시
        $("#my-chat-msg").focus(function() {
          $(document).keydown(function(event) {
            if (event.keyCode == 13 && $("#my-chat-msg").val()) {
    	    	var userId = $(".user-friends.active").find(".friends-id").val();
    	    	console.log(userId);
              chatSubmit(userId);
            }
          });
        });

        // 채팅 전송 클릭시 표시
        $(".my-chat-send").click(function() {
	    	var userId = $(".user-friends.active").find(".friends-id").val();
          chatSubmit(userId);
        });
        
        // 친구 요청 수락/거절 클릭
        $(".follow-me").click(function(){
       	 var followerId =  $(this).val();
       	 var followerName = $(this).text();
       	 $.ajax({
       		 url:"/user/my/following.do",
       		 type:"get",
       		 dataType:"Json",
       		 data:{followerId:followerId},
       		 success:function(data){
       			 if(data.createDate == null){
       				 addAlert("<p>"+followerName+"님에게 친구 신청을 보냈습니다.</p>",2000);
       				 ws.send("FOLLOW:"+followerId+":${LOGIN_USER.name}");
       			 }else{
       				 addAlert("<p style='font-weight:bold;font-size:17px;'>"+followerName+"님과 이미 친구거나<br>친구 요청을 보낸상태입니다.</p>",2000);
       			 }
       		 }
       	 })
        })
         
          // 친구 요청 알림
 	$(".sg-alert").on('click','.follow-btn',function(){
	  var followerId = $(this).val();
		  if($(this).hasClass('add')){
		  $.get("/user/my/following.do",{followerId:followerId});
		  ws.send('FRIEND:ACCEPT:'+ followerId);
	  }else if($(this).hasClass('del')){
		  $.get("/user/my/delFollow.do",{followingId:followerId});
		  ws.send('FRIEND:REFUSE:'+ followerId);
	  }
	  $(this).parents('.sg-alert-box').remove();
  })
})
</script>
</c:if>