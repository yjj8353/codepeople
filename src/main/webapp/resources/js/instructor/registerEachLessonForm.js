/**
 * 
 */

$(function() {
	

	$(".replace").click(function(event) {
		event.preventDefault();
		filePath.click(); 
	})

	
	
	$("#filePath").on('change', function(event) {
		
		var file = event.target.files[0];
		var fileReader = new FileReader();
    
		fileReader.onload = function() {
			var blob = new Blob([fileReader.result], {type: file.type});
			var url = URL.createObjectURL(blob);
			var video = document.getElementById("holderVideo");
			video.src = url;
			video.preload = 'metadata';
			
			
	       video.onloadedmetadata = function() {
	    	   const duration = Math.round(video.duration);
		       $("#lessonLength").val(duration);
	       };
		};
			
		fileReader.readAsArrayBuffer(file);
		$("#holderVideoWrapper").not("#holderVideo").css("border", "10px solid green");
		$("#holderVideo").css("display", "inline-block");

	});
	
	
	
	function lessonUpload() {
		  var video = document.getElementById('filePath');
			
		  var videoFile = video.files[0];
  		  var videoExt = $("#filePath").val().split('.').pop().toLowerCase();
		  
    		videoData = new FormData();
	 	    videoData.append("videoFile", videoFile);

	   	  $.ajax({
	 	        data : videoData,
	 	        type : "POST",
				url:"/instructor/addLessonVideo.do?ext=" + videoExt,
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
	 	        	$("#uploadFilePath").val(data);
	 	        	$("form").submit();
	 	        },
		        error : function() {
			          alert('error!');
		        }

	 	    });
	}
	
	
	
	$(".create-lecture-save").on("click", function(event) {
		
		  event.preventDefault();
		  var lectureNo = $("#lectureNo").val()
		  var lessonNo = $("#lessonNo").val()
		  var sectionNo = $("#sectionNo").val()
		  
		  console.log(lectureNo, lessonNo, sectionNo);
		  
		  
	   	  $.ajax({
	 	        data : {lectureNo : lectureNo, sectionNo : sectionNo, lessonNo : lessonNo},
	 	        type : "POST",
				url:"/instructor/addLessonFlag.do",
	 	        success : function(data) { // 처리가 성공할 경우
	 	        	if (data == "false") {
	 	        		alert("같은 섹션에 중복된 강좌 번호가 있습니다");
	 	        	} else {
	 	        		lessonUpload();
	 	        		alert("강좌 등록이 완료되었습니다");
	 	        	}

	 	        },
		        error : function() {
			          alert('다시 시도해 주세요');
		        }

	 	    });
	   	  
	})
	
	
	
	
	

})