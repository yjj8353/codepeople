<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="col-xs-12">
    
            <div class="add-note-wrapper">
  
            <button class="sg-btn-3rd " id="btn-add-note"><span class="glyphicon glyphicon-plus"> </span>새 노트 추가</button>
  	  </div>       
        <div class="col-xs-12 paid-note-list-wrapper">
            
           <input type="hidden" class="buyLectureNo" name="buyLectureNo" value="${buyLecture.no }"/>
           <c:forEach var="note" varStatus="status" items="${notes }">
            <div class="paid-each-note">
	            <div class="paid-note-toparea">
	                <span class="paid-section-info-wrapper"><span class="glyphicon glyphicon-pencil"></span><span id="paid-each-section-name">${note.buyLecture.paidLecture.title }</span></span>
					
					<div class="paid-each-section-date">
						<span class="glyphicon glyphicon-time"></span>
						<span>
						<fmt:formatDate pattern = "yyyy-MM-dd" value = "${note.createDate }" />
						</span>
					</div>
					<h3 id="paid-each-note-title">${note.title}</h3>
				</div>
				<div class="paid-note-content-wrapper">
					<div id="row paid-each-note-contents">
						${note.content }
					</div>
					<div class="row modify-wrapper">
						<div class="col-xs-1 col-xs-offset-10" style="text-align: right;">
							<span><a href=# id="paid-each-note-modify">수정</a></span>
						</div>
	                	<div class="col-xs-1">
							<span><a href=# id="paid-each-note-delete">삭제</a></span>
	                	</div>
	                </div>
				</div>
        	</div>
           </c:forEach>
    	</div>
    	
    	</div>
    	<script>
    	
    	   var buyLectureNo = $(".buyLectureNo").val();
    	   console.log(buyLectureNo);
    		   
	 	   $(".paid-note-toparea").on("click", function() {
		   		const flag = $(this).siblings(".paid-note-content-wrapper").css("display");
			           
		        if (flag === "none") {
		            $(this).siblings('.paid-note-content-wrapper').css('display', 'block');
					$(this).parent().css("background-color", "#ffeaec")
		        } else {
					$(this).parent().css("background", "")
					$(this).siblings('.paid-note-content-wrapper').css('display', 'none');
		        }
		   });
	 	   
	 	   
	 	  function ajaxCreateNote() {
			  $.ajax({
				  type : "GET",
				  url : "detail/createNote.do?no=" + buyLectureNo,
				  dataType : "html",
				  error : function() {
					  alert('error!');
				  },
				  success : function(data) {
					  $('.paid-contents').html(data);
				  }
			  });
		  }
 	  
	 		$("#btn-add-note").on("click", function(event) {
	 			event.preventDefault();
		    	   var buyLectureNo = $(".buyLectureNo").val();
			 		  if (buyLectureNo  == undefined) {
			 			  alert("구매 유저만 노트를 등록할 수 있습니다");
			 			  return;
			 		  }

	 			ajaxCreateNote();
	 		});
	  
    	</script>