$(function() {

	var toggleSwitch = $("#toggleSwitch").val();
	
	if (toggleSwitch == 'Y') {
		$("#course-status").css("background", "#d3e9ff");
	} else {
		$("#course-status").css("background", "#ff7373");
	}
	
	function toggleonfoff_init() {
	    $("div.input.toggle-onoff input:hidden").parent("div").children("i.fa").removeClass("fa-toggle-on").addClass("fa-toggle-off");
	    $("div.input.toggle-onoff input:hidden[value='Y']").parent("div").children("i.fa").removeClass("fa-toggle-off").addClass("fa-toggle-on");
	}
	
	toggleonfoff_init();

	function changeExposureStatus(value) {
		  
		var paidLectureNo = $("#paidLectureNo").val();
		
		$.ajax({
		    	data : {value : value, paidLectureNo : paidLectureNo},
		    	type : "POST",
		    	url : "/instructor/ExposureFlag.do",
		    	success : function(data) { // 처리가 성공할 경우
		    		alert("공개 여부가 변경되었습니다");
	 	        },
		        error : function() {
			          alert('다시 시도해 주세요');
		        }
		    	
		    });
	}
	
	
	$("div.input.toggle-onoff").click(function() {
		    console.log($(this).children("input:hidden").val());
		    var value = $(this).children("input:hidden").val();
		    if( value == "Y" ) {
		        $(this).children("input:hidden").val("N");
		        value = $(this).children("input:hidden").val();
		        changeExposureStatus(value);
		        
		        $(this).children("i.fa").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		        $(".selectable-status").text("비공개");
		        $("#course-status").css("background-color", "#ff7373")
		        $("#course-status").css("color", "white")
		    } else {
		        $(this).children("input:hidden").val("Y");
		        value = $(this).children("input:hidden").val();
		        changeExposureStatus(value);

		        $(this).children("i.fa").removeClass("fa-toggle-off").addClass("fa-toggle-on");
		        $(".selectable-status").text("공개");
		        $("#course-status").css("background-color", "#d3e9ff")
		        $("#course-status").css("color", "black")
		    }
	});
	
	
	$(".lecture-notice-register").on("click", function() {
		
		var paidLectureNo = $("#paidLectureNo").val();
		var title = $("#noticeTitle").val();
		var contents = $("#noticeContents").val();
		var instructorNo = $("#instructorNo").val();
		
		if (title == "" || contents == "") {
			return false;
		}

		console.log(instructorNo);
		
		
		$.ajax({
		    	data : {title : title, contents : contents, paidLectureNo : paidLectureNo, instructorNo : instructorNo},
		    	type : "POST",
		    	url : "/instructor/addNotice.do",
		    	success : function(data) { // 처리가 성공할 경우
		    		alert("성공");
	 	        },
		        error : function() {
			          alert('다시 시도해 주세요');
		        }
		    	
		    });

	})
	

	$(".lecture-notice-view").on("click", function() {
		$("#notice-table").css("display", "block");
		$("#notice-form").css("display", "none");
		
	})

	$(".lecture-notice-register").on("click", function() {
		$("#notice-table").css("display", "none");
		$("#notice-form").css("display", "block");
	})
	
	


})