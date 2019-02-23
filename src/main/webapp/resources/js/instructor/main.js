$(function() {
	
	
	$(".instructor-home-top-menu").children().children().on("click", function() {
		$(this).siblings().removeClass("selected");
		$(this).addClass("selected");
	});
	
	
})


