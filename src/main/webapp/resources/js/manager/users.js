//강사 modal 창 ajax
$(function() {
	$('a[id*="teacher-modal"]').click(function() {

		$.ajax({
			url:'users/ajax.do',
			method:'POST',
			traditional:true,
			data:{
				'functionName':'findUserInfoByNo',
				'userNo':$(this).closest('tr').children('td').first().text()
			},
			dataType:'json',
			beforeSend:function() {
				$('#teacher-info-ajax').empty();
				$('#teacher-loading-img').show();
			},
			success:function(users) {
				$.each(users, function(index, user) {
					var html  = '<td>'+user.no+'</td>'
                		html +=	'<td>'+user.id+'</td>'
                		html +=	'<td>'+user.name+'</td>'
                		html +=	'<td>'+user.email+'</td>'
                		if (user.authStatus == 2 || user.authStatus == 1 || user.authStatus == 0) {
                    		html +=	'<td><button type="button" id="btn-delete-teacher" class="btn btn-danger btn-xs">삭제</button></td>';
                    	} else if (user.authStatus == -1 || user.authStatus == -2) {
                    		html +=	'<td><button type="button" id="btn-recover-teacher" class="btn btn-warning btn-xs">복구</button></td>';
                    	}
                		
					$('#teacher-info-ajax').html(html);						
				});
			},
			complete:function() {
				$('#teacher-loading-img').hide();
			},
			error: function(request, status, error) {
				$('#teacher-info-ajax').html('데이터를 불러오는데 실패했습니다');
			}
		});
	});
	
	//학생 modal 창 ajax
	$('a[id*="student-modal"]').click(function() {
		
		$.ajax({
			url:'users/ajax.do',
			method:'POST',
			traditional:true,
			data:{
				'functionName':'findUserInfoByNo',
				'userNo':$(this).closest('tr').children('td').first().text()
			},
			dataType:'json',
			beforeSend:function() {
				$('#student-info-ajax').empty();
				$('#student-loading-img').show();
			},
			success:function(users) {
				$.each(users, function(index, user) {
					var html  = '<td>'+user.no+'</td>'
                		html +=	'<td>'+user.id+'</td>'
                		html +=	'<td>'+user.name+'</td>'
                		html +=	'<td>'+user.email+'</td>'
                	if (user.authStatus == 2 || user.authStatus == 1 || user.authStatus == 0) {
                		html +=	'<td><button type="button" id="btn-delete-student" class="btn btn-danger btn-xs">삭제</button></td>';
                	} else if (user.authStatus == -1 || user.authStatus == -2) {
                		html +=	'<td><button type="button" id="btn-recover-student" class="btn btn-warning btn-xs">복구</button></td>';
                	}
					
					$('#student-info-ajax').html(html);						
				});
			},
			complete:function() {
				$('#student-loading-img').hide();
			},
			error: function(request, status, error) {
				$('#student-info-ajax').html('데이터를 불러오는데 실패했습니다');
			}
		});
	});
	
	//아이디 검색 바 ajax
	$('#search-bar').keyup(function() {
		if($('#search-bar').val() == '') {
			$('#preview-id').css('display', 'none')
		} else {
			$.ajax({
				url:'users/ajax.do',
				method:'POST',
				traditional:true,
				data:{
					functionName:'findUserInfoById',
					userId:$(this).val()
				},
				dataType:'json',
				success:function(lists) {
					var html = '';
					$.each(lists, function(index, list) {
						$('#preview-id').css('display', '');
						html += '<p><a id="user-info-'+list.no+'">'+list.id+'</a></p>';
						$('#preview-id .header').append().html(html);
					});
				},
				error:function(request, status, error) {
					$('#preview-id').css('display', 'none');
					$('#preview-id .header p').empty();
				}
			});
		}
	});
	
	$('#search-bar').blur(function() {
		setTimeout(function() {
			$('#preview-id').css('display', 'none')
		}, 300);
	});

	//동적으로 생성된 HTML을 제어하는 스크립트들
	$(document).on('click', 'a[id*="user-info"]', function() {
		$('#search-bar').val($(this).text());
	});
	
	$(document).on('click', '#btn-delete-student', function() {
		
		var studentNo = $(this).closest('tr').children().eq(0).text();
		
		$.ajax({
			url:'users/ajax.do',
			method:'POST',
			traditional:'true',
			data:{
				'functionName':'deleteUser',
				'studentNo':studentNo
			},
			datatype:'json',
			success:function() {
				location.replace('http://www.codepeople.com/manager/users.do');
			},
			error:function(request, status, error) {
				console.log('에러');
			}
		});
	});
	
	$(document).on('click', '#btn-delete-teacher', function() {
		
		var teacherNo = $(this).closest('tr').children().eq(0).text();
		
		$.ajax({
			url:'users/ajax.do',
			method:'POST',
			traditional:'true',
			data:{
				'functionName':'deleteUser',
				'teacherNo':teacherNo
			},
			datatype:'json',
			success:function() {
				location.replace('http://www.codepeople.com/manager/users.do');
			},
			error:function(request, status, error) {
				console.log('에러');
			}
		});
	});
	
	$(document).on('click', '#btn-recover-student', function() {
		
		var studentNo = $(this).closest('tr').children().eq(0).text();
		
		$.ajax({
			url:'users/ajax.do',
			method:'POST',
			traditional:'true',
			data:{
				'functionName':'recoverUser',
				'studentNo':studentNo
			},
			datatype:'json',
			success:function() {
				location.replace('http://www.codepeople.com/manager/users.do');
			},
			error:function(request, status, error) {
				console.log('에러');
			}
		});
	});
	
	$(document).on('click', '#btn-recover-teacher', function() {
		
		var teacherNo = $(this).closest('tr').children().eq(0).text();
		
		$.ajax({
			url:'users/ajax.do',
			method:'POST',
			traditional:'true',
			data:{
				'functionName':'recoverUser',
				'teacherNo':teacherNo
			},
			datatype:'json',
			success:function() {
				location.replace('http://www.codepeople.com/manager/users.do');
			},
			error:function(request, status, error) {
				console.log('에러');
			}
		});
	});
});