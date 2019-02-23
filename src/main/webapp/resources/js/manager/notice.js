$(function() {
	$('#submit-btn').click(function() {
		$.ajax({
			url:'notice/ajax.do',
			type:'POST',
			traditional:true,
			data:{
				'functionName':'saveNotice',
				'title':$('#notice-title').val(),
				'contents':CKEDITOR.instances.noticeeditor.getData()
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/notice.do');
			},
			error:function() {
				console.log('에러');
			}
		});
	});
	
	$('button[id*="notice-delete"]').click(function() {
		$.ajax({
			url:'notice/ajax.do',
			type:'POST',
			traditional:true,
			data:{
				'functionName':'deleteNotice',
				'postNo':$(this).closest('tr').children().eq(0).text()
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/notice.do');
			},
			error:function() {
				console.log('에러');
			}
		});
	});
	
	$('button[id*="notice-recover"]').click(function() {
		$.ajax({
			url:'notice/ajax.do',
			type:'POST',
			traditional:true,
			data:{
				'functionName':'recoverNotice',
				'postNo':$(this).closest('tr').children().eq(0).text()
			},
			success:function() {
				location.replace('http://www.codepeople.com/manager/notice.do');
			},
			error:function() {
				console.log('에러');
			}
		});
	});
});