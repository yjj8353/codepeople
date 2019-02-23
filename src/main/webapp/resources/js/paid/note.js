$(function() {
	// naver smart editor
	
	
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

});