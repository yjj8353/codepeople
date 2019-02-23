<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="col-xs-12">
    
        <div class="col-xs-12 paid-note-list-wrapper">
            
           <c:forEach var="instructorNotice" varStatus="status" items="${instructorNotices }">
            <div class="paid-each-note">
	            <div class="paid-note-toparea">
					<div class="paid-each-section-date">
						<span class="glyphicon glyphicon-time"></span>
						<span>
						<fmt:formatDate pattern = "yyyy-MM-dd" value = "${instructorNotice.createDate }" />
						</span>
					</div>
					<h3 id="paid-each-note-title" style="margin-top: 30px;">${instructorNotice.title}</h3>
				</div>
				<div class="paid-note-content-wrapper">
					<div id="row paid-each-note-contents" style="margin-bottom: 50px; width: 85%;">
						${instructorNotice.contents }
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
	 			ajaxCreateNote();
	 		});
	  
    	</script>