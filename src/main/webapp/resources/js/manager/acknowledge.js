$(function() {
	
	$('button[id*="paid-lecture-approve"]').click(function () {
		
		$.ajax({
			url:'acknowledge/ajax.do',
			method:'POST',
			data:{
				'functionName':'approvePaidLecture',
				'postNo':$(this).closest('tr').children().eq(0).text()
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/acknowledge.do');
			},
			error:function() {
				console.log('에러');
			}
		});
	});
	
	$('button[id*="paid-lecture-deny"]').click(function () {
		
		$.ajax({
			url:'acknowledge/ajax.do',
			method:'POST',
			data:{
				'functionName':'denyPaidLecture',
				'postNo':$(this).closest('tr').children().eq(0).text()
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/acknowledge.do');
			},
			error:function() {
				console.log('에러');
			}
		});
	});
	
	$('button[id*="paid-lecture-delete"]').click(function () {
		
		$.ajax({
			url:'acknowledge/ajax.do',
			method:'POST',
			data:{
				'functionName':'deletePaidLecture',
				'postNo':$(this).closest('tr').children().eq(0).text()
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/acknowledge.do');
			},
			error:function() {
				console.log('에러');
			}
		});
	});

	$('button[id*="paid-lecture-recover"]').click(function () {
		
		$.ajax({
			url:'acknowledge/ajax.do',
			method:'POST',
			data:{
				'functionName':'recoverPaidLecture',
				'postNo':$(this).closest('tr').children().eq(0).text()
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/acknowledge.do');
			},
			error:function() {
				console.log('에러');
			}
		});
	});
	
	$(document).on('click', 'button[id*="free-lecture-delete"]',function() {
		
		freeLectureNo = $(this).parents().eq(1).children().eq(0).text();
		
		$.ajax({
			url:'acknowledge/ajax.do',
			method:'POST',
			data:{
					'functionName':'deleteFreeLectureByNo',
					'postNo':freeLectureNo
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/acknowledge.do');
			},
			error:function(request, status, error) {
				console.log('에러');
			}
		});
	});
	
	$(document).on('click', 'button[id*="free-lecture-recover"]',function() {
		
		freeLectureNo = $(this).parents().eq(1).children().eq(0).text();
		
		$.ajax({
			url:'acknowledge/ajax.do',
			method:'POST',
			data:{
				'functionName':'recoverFreeLectureByNo',
				'postNo':freeLectureNo
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/acknowledge.do');
			},
			error:function(request, status, error) {
				console.log('에러');
			}
		});
	});
	
	$('a[id*="paid-lecture-sample-video"]').click(function() {
		$('a[href^="/approveLessonVideo.do"]').attr({'target' : '_blank'});
	});
});