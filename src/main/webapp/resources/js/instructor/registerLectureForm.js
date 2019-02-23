$(function() {
	
	$(".replace").click(function(event) {
		event.preventDefault();
	})
	
	
	var upload = document.getElementById('lectureThumb');
    var holder = document.getElementById('holder');

	upload.onchange = function (e) {
	  e.preventDefault();
	
	  var file = upload.files[0],
	      reader = new FileReader();
	  reader.onload = function (event) {
	    var img = new Image();
	    img.src = event.target.result;
	      img.width = 400;
	      img.height = 266;
	    holder.innerHTML = '';
	    holder.appendChild(img);
	    $("#holder").css("border", "10px solid green");
	    
	  };
	  reader.readAsDataURL(file);
	
	  return false;
	};
	
	
	function optionFlag() {
		
		$("input").not(".create-lecture-save")
		.not(".create-lecture-cancel")
		.not(".create-lecture-next")
		.not(".create-lecture-prev")
		.not("#header-search")
		.each(function(index, item) {
			
			if ($(item).val() != "") {
				$(item).css("border", "6px solid green");
			} else {
				$(item).css("border", "6px solid #ff7373");
			}
		})
	};
	
	function selectFlag() {
		if ($(".lang-select").val() !== null) {
			$(".lang-select").css("border", "6px solid green");
		}
		if ($(".level-select").val() !== null) {
			$(".level-select").css("border", "6px solid green");
		}
	}

	function textareaFlag() {
		if ($("#lectureDescription").val() != "") {
			$("#lectureDescription").css("border", "6px solid green");
		}
		if ($("#instructorDescription").val() != "") {
			$("#instructorDescription").css("border", "6px solid green");
		}
		

	}
	
	
	$("#lectureTitle").on("keydown", function() {
		if ($("select").css("border") !== "6px solid rgb(0, 128, 0)") {
			$("select").css("border", "6px solid #ff7373");
		}
	})
	
	
	$("input").on("keydown", function() {
		optionFlag();
		selectFlag();
		textareaFlag();
	})
	
	$("textarea").on("keydown", function() {
		optionFlag();
		selectFlag();
		textareaFlag();
	})
	

	$("select").click(function() {
		selectFlag();
	})
	
	
	$(".create-lecture-next").on("click", function() {
		$(".form-secondPage").css("display", "block");
		$(".form-firstPage").css("display", "none");
	})
	
	$(".create-lecture-prev").on("click", function() {
		$(".form-secondPage").css("display", "none");
		$(".form-firstPage").css("display", "block");
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
	
	
	$(".create-lecture-save").on("click", function(event) {
			
		  event.preventDefault();

		  var video = document.getElementById('filePath');
		
		  var lectureThumb = upload.files[0];
		  var videoFile = video.files[0];
		  
		  var ext = $('#lectureThumb').val().split('.').pop().toLowerCase();
		  var videoExt = $("#filePath").val().split('.').pop().toLowerCase();
		  
		  console.log(videoExt);
		  
	 		data = new FormData();
	 	    data.append("lectureThumb", lectureThumb);

	   	  $.ajax({
	 	        data : data,
	 	        type : "POST",
				url:"/instructor/addlectureThumb.do?ext=" + ext,
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
	 	        	console.log(data);
	 	        	$("#uploadThumb").val(data);
	 	        	console.log($("#uploadThumb").val());
	 	        },
		        error : function() {
			          alert('error!');
		        }

	 	    });
	   	  
	   	  
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
	 	        	alert("강좌 등록이 완료되었습니다");
	 	        },
		        error : function() {
			          alert('error!');
		        }

	 	    });
	   	  
	})

})
