$(function() {
  
    $(".section-top-box").on('click', function(event) {
        
        const flag = $(this).siblings('.section-lesson-list').css('display');
        
        if (flag === "none") {
            $(this).siblings('.section-lesson-list').css('display', 'block');
        } else {
            $(this).siblings('.section-lesson-list').css('display', 'none');
        }
    });
    
})