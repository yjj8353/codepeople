/**
 * 
 */
	$(".section-top-box").on('click', function() {

		const flag = $(this).siblings('.section-lesson-list').css('display');

		if (flag === "none") {
			$(this).siblings('.section-lesson-list').css('display', 'block');
		} else {
			$(this).siblings('.section-lesson-list').css('display', 'none');
		}
	});
	
	
	$("[id^=group]").each(function(index, item) {
		var id = $(item).attr("id");
		console.log(index+1);
		
	});