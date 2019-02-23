$(function() {
	
	var upload = document.getElementById('lectureThumb');
	var holder = document.getElementById('holder');

	$(".replace").click(function(event) {
		event.preventDefault();
	})
	
	function prevSelectBox() {
		var prevLang = $("#prevLang").val();
		var prevLevel = $("#prevLevel").val();
		prevLevel = prevLevel.toLowerCase();
		
		console.log(prevLevel);
		
		$("select option").each(function() {
			
			console.log($(this).val());
			
			if (prevLang === $(this).val()) {
				 $(this).attr("selected","selected");
			}
			
			if (prevLevel === $(this).val()) {
				 $(this).attr("selected","selected");
			}
		});
		
		
	}
	
	function prevThumbnailViewer() {
		
		var img = new Image();
		var path = $("#uploadThumb").val();
		img.src = path;
		img.width = 400;
		img.height = 266;
		holder.innerHTML = '';
		holder.appendChild(img);
		
	}
	
	function init() {
		prevThumbnailViewer();
		prevSelectBox();
	}
	
	init();

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
	
	  
	  var lectureThumb = upload.files[0];
	  var ext = $('#lectureThumb').val().split('.').pop().toLowerCase();
	  
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
 	        	$("#uploadThumb").val(data);
 	        	console.log($("#uploadThumb").val());
 	        	console.log("이미지 업로드 성공")
 	        },
	        error : function() {
		          alert('error!');
	        }

 	    });

	};
	
	
	$(".create-lecture-next").on("click", function(event) {
     	$("form").submit();
     	alert("강좌 수정이 완료되었습니다");

	})

})
