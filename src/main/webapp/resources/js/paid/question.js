$(function () {

	$("#search-box").on("click", function () {
		$(this).css("border", "3px solid #ff7373");
	});


	$(".each-question-top-wrapper").on("click", function () {
		
		
			  $.ajax({
			        type : "GET",
			        url : "detail/overview.do",
			        dataType : "html",
			        error : function() {
			          alert('error!');
			        },
			        success : function(data) {
			          $('.paid-contents').html(data);
			        }
			      });
		
		
		
		const flag = $(this).siblings(".each-question-contentsWrapper").css("display");

		console.log(flag);

		if (flag === "none") {
			$(this).siblings('.each-question-contentsWrapper').css('display', 'block');
			$(this).parent().css("background-color", "#ffeaec")

		} else {
			$(this).siblings('.each-question-contentsWrapper').css('display', 'none');
		}
	});

})
