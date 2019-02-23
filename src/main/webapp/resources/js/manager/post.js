$(function() {
	//Q&A 글을 클릭할 시 해당 정보창을 새 창으로 여는 스크립트
	$(document).on('click', 'a[id*="post-info"]', function() {
		$('a[href^="/qna/detail.do"]').attr({'target' : '_blank'});
	});
	
	//Q&A 답글을 클릭할 시 해당 정보창을 모달창으로 띄우는 스크립트
	$(document).on('click', 'a[id*="qna-answer-modal"]', function() {
		
		answerNo = $(this).closest('tr').children('td').first().text();
		postNo = $(this).closest('td').children('input').first().val();
		
		$.ajax({
			url:'post/ajax.do',
			method:'POST',
			traditional:true,
			data:{
				'functionName':'findQnaAnswerInfoByNo',
				'postNo':postNo
			},
			dataType:'json',
			success:function(qna) {
				// 해당 Qna 글에서 검색한 답글을 찾는 기능과, html 태그를 제거하는 기능
				for (i=0; i<qna.qna.answers.length; i++) {
					if (qna.qna.answers[i].no == answerNo) {
						var htmlLessContents = (qna.qna.answers[i].contents).replace(/(<([^>]+)>)/ig,'');
					}
				}
				
				var html  = '<td>'+qna.qna.no+'</td>' +
							'<td>'+qna.qna.writer.name+'</td>' +
							'<td>'+htmlLessContents+'</td>' +
							'<td><a id="post-info-'+postNo+'" href="/qna/detail.do?qnaNo='+postNo+'">'+qna.qna.title+'</a></td>' +
							'<td></td>';
	
				$('#qna-answer-info-ajax').html(html);
			},
			beforeSend:function() {
				$('#qna-answer-info-ajax').empty();
				$('#loading-img').show();
			},
			complete:function() {
				$('#loading-img').hide();
			},
			error:function(request, status, error) {
				$('#qna-answer-info-ajax').html('데이터를 불러오는데 실패했습니다');
			}
		});
	});

	//Q&A 마지막
	$(document).on('click', '#qna-final', function() {
		$.ajax({
			url:'post/ajax.do',
			method:'POST',
			traditional:true,
			data:{
					'boardName':'QNA',
					'qnaPage':$("#qna-final .sr-only").text()
				 },
			dataType:'json',
			success:function(qna) {
				var htmlTableString = '';
				for (i=0; i<qna.qnaPosts.length; i++) {
					htmlTableString += '<tr>' +
								        	'<td>'+qna.qnaPosts[i].no+'</td>' + 
		                			  		'<td>'+qna.qnaPosts[i].writer.name+'</td>' +
		                			 		'<td><a id="post-info-'+qna.qnaPosts[i].no+'" href="/qna/detail.do?qnaNo='+qna.qnaPosts[i].no+'">'+qna.qnaPosts[i].title+'</a></td>';
										if (qna.qnaPosts[i].available == 1) {
						 htmlTableString += '<td><button type="button" id="btn-delete-post-'+qna.qnaPosts[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
										} else if (qna.qnaPosts[i].available == 0) {
						 htmlTableString += '<td><button type="button" id="btn-recover-post-'+qna.qnaPosts[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
										}
					htmlTableString += '</tr>';
				}
								
				var htmlNavString = '';
				if (1 != qna.qnaPageInfo.curPage) {
					htmlNavString += '<li class="page-item"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				}
				
				for (i=qna.qnaPageInfo.startPage; i<=qna.qnaPageInfo.endPage; i++) {
					if (i == qna.qnaPageInfo.curPage) {
						htmlNavString += '<li class="active"><a id="qna-page-'+i+'">'+i+'</a></li>'
					} else {
						htmlNavString += '<li><a id="qna-page-'+i+'">'+i+'</a></li>'					
					}
				}
				
				if (qna.qnaPageInfo.endPage != qna.qnaPageInfo.curPage) {
					htmlNavString += '<li><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
				}
				
				$('#qna-tbody').html(htmlTableString);
				$('#qna-pagination').html(htmlNavString);
			},
			beforeSend:function() {
				$('#loading-img').removeClass('display-none');
			},
			complete:function() {
				$('#loading-img').addClass('display-none');
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 처음
	$(document).on('click', '#qna-first', function() {
		$.ajax({
			url:'post/ajax.do',
			method:'POST',
			traditional:true,
			data:{
				'boardName':'QNA',
				'qnaPage':$("#qna-first .sr-only").text()
			},
			dataType:'json',
			success:function(qna) {
				var htmlTableString = '';
				for (i=0; i<qna.qnaPosts.length; i++) {
					htmlTableString += '<tr>' +
								        	'<td>'+qna.qnaPosts[i].no+'</td>' + 
		                			  		'<td>'+qna.qnaPosts[i].writer.name+'</td>' +
		                			 		'<td><a id="post-info-'+qna.qnaPosts[i].no+'" href="/qna/detail.do?qnaNo='+qna.qnaPosts[i].no+'">'+qna.qnaPosts[i].title+'</a></td>';
										if (qna.qnaPosts[i].available == 1) {
						 htmlTableString += '<td><button type="button" id="btn-delete-post-'+qna.qnaPosts[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
										} else if (qna.qnaPosts[i].available == 0) {
						 htmlTableString += '<td><button type="button" id="btn-recover-post-'+qna.qnaPosts[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
										}
					htmlTableString += '</tr>';
				}
				var htmlNavString = '';
				if (1 != qna.qnaPageInfo.curPage) {
					htmlNavString += '<li class="page-item"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				}
				
				for (i=qna.qnaPageInfo.startPage; i<=qna.qnaPageInfo.endPage; i++) {
					if (i == qna.qnaPageInfo.curPage) {
						htmlNavString += '<li class="active"><a id="qna-page-'+i+'">'+i+'</a></li>'
					} else {
						htmlNavString += '<li><a id="qna-page-'+i+'">'+i+'</a></li>'					
					}
				}
				
				if (qna.qnaPageInfo.endPage != qna.qnaPageInfo.curPage) {
					htmlNavString += '<li><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
				}
				
				$('#qna-tbody').html(htmlTableString);
				$('#qna-pagination').html(htmlNavString);
			},
			beforeSend:function() {
				$('#loading-img').removeClass('display-none');
			},
			complete:function() {
				$('#loading-img').addClass('display-none');
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 페이징 처리
	$(document).on('click', 'a[id*="qna-page"]', function() {
		$.ajax({
			url:'post/ajax.do',
			method:'POST',
			traditional:true,
			data:{
				'boardName':'QNA',
				'qnaPage':$(this).text()
			},
			dataType:'json',
			success:function(qna) {
			
				var htmlTableString = '';
				for (i=0; i<qna.qnaPosts.length; i++) {
					htmlTableString += '<tr>' +
								        	'<td>'+qna.qnaPosts[i].no+'</td>' + 
		                			  		'<td>'+qna.qnaPosts[i].writer.name+'</td>' +
		                			 		'<td><a id="post-info-'+qna.qnaPosts[i].no+'" href="/qna/detail.do?qnaNo='+qna.qnaPosts[i].no+'">'+qna.qnaPosts[i].title+'</a></td>';
					if (qna.qnaPosts[i].available == 1) {
	    				 htmlTableString += '<td><button type="button" id="btn-delete-post-'+qna.qnaPosts[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
					} else if (qna.qnaPosts[i].available == 0) {
						 htmlTableString += '<td><button type="button" id="btn-recover-post-'+qna.qnaPosts[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
					}
					htmlTableString += '</tr>';
				}
								
				var htmlNavString = '';
				if (qna.qnaPageInfo.startPage != qna.qnaPageInfo.curPage) {
					htmlNavString += '<li class="page-item"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				}
				
				for (i=qna.qnaPageInfo.startPage; i<=qna.qnaPageInfo.endPage; i++) {
					if (i == qna.qnaPageInfo.curPage) {
						htmlNavString += '<li class="active"><a id="qna-page-'+i+'">'+i+'</a></li>'
					} else {
						htmlNavString += '<li><a id="qna-page-'+i+'">'+i+'</a></li>'
					}
				}				
				
				if (qna.qnaPageInfo.endPage != qna.qnaPageInfo.curPage) {
					htmlNavString += '<li class="page-item"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
				}
				
				$('#qna-tbody').html(htmlTableString);
				$('#qna-pagination').html(htmlNavString);
			},
			beforeSend:function() {
				$('#loading-img').removeClass('display-none');
			},
			complete:function() {
				$('#loading-img').addClass('display-none');
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 글 삭제 및 갱신
	$(document).on('click', 'button[id*="btn-delete-post"]', function() {
		
		$.ajax({
			url:'post/ajax.do',
			type:'POST',
			traditional:true,
			data:{
				'functionName':'delQna',
				'postNo':$(this).closest('tr').children('td:first').text()
				},
			success:function() {
				$.ajax({
					url:'post/ajax.do',
					method:'POST',
					traditional:true,
					data:{
						'boardName':'QNA',
						'qnaPage':$('#qna-pagination .active').text()
						},
					dataType:'json',
					success:function(qna) {
					
						var htmlTableString = '';
						for (i=0; i<qna.qnaPosts.length; i++) {
							htmlTableString += '<tr>' +
										        	'<td>'+qna.qnaPosts[i].no+'</td>' + 
				                			  		'<td>'+qna.qnaPosts[i].writer.name+'</td>' +
				                			 		'<td><a id="post-info-'+qna.qnaPosts[i].no+'" href="/qna/detail.do?qnaNo='+qna.qnaPosts[i].no+'">'+qna.qnaPosts[i].title+'</a></td>';
												if (qna.qnaPosts[i].available == 1) {
								 htmlTableString += '<td><button type="button" id="btn-delete-post-'+qna.qnaPosts[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
												} else if (qna.qnaPosts[i].available == 0) {
								 htmlTableString += '<td><button type="button" id="btn-recover-post-'+qna.qnaPosts[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
												}
							htmlTableString += '</tr>';
						}
						
						var htmlNavString = '';
						if (qna.qnaPageInfo.startPage != qna.qnaPageInfo.curPage) {
							htmlNavString += '<li class="page-item"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
						} else {
							htmlNavString += '<li class="page-item disabled"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
						}
						
						for (i=qna.qnaPageInfo.startPage; i<=qna.qnaPageInfo.endPage; i++) {
							if (i == qna.qnaPageInfo.curPage) {
								htmlNavString += '<li class="active"><a id="qna-page-'+i+'">'+i+'</a></li>'
							} else {
								htmlNavString += '<li><a id="qna-page-'+i+'">'+i+'</a></li>'
							}
						}				
						
						if (qna.qnaPageInfo.endPage != qna.qnaPageInfo.curPage) {
							htmlNavString += '<li class="page-item"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
						} else {
							htmlNavString += '<li class="page-item disabled"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
						}
						
						$('#qna-tbody').html(htmlTableString);
						$('#qna-pagination').html(htmlNavString);
					},
					error:function(request, status, error) {
						console.log('오류');
					}
				});
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 글 복구 및 갱신
	$(document).on('click', 'button[id*="btn-recover-post"]', function() {
		
		$.ajax({
			url:'post/ajax.do',
			type:'POST',
			traditional:true,
			data:{
				'functionName':'recoverQna',
				'postNo':$(this).closest('tr').children('td:first').text()
			},
			success:function() {
				$.ajax({
					url:'post/ajax.do',
					method:'POST',
					traditional:true,
					data:{
						'boardName':'QNA',
						'qnaPage':$('#qna-pagination .active').text()
					},
					dataType:'json',
					success:function(qna) {
						
						var htmlTableString = '';
						for (i=0; i<qna.qnaPosts.length; i++) {
							htmlTableString += '<tr>' +
							'<td>'+qna.qnaPosts[i].no+'</td>' + 
							'<td>'+qna.qnaPosts[i].writer.name+'</td>' +
							'<td><a id="post-info-'+qna.qnaPosts[i].no+'" href="/qna/detail.do?qnaNo='+qna.qnaPosts[i].no+'">'+qna.qnaPosts[i].title+'</a></td>';
							if (qna.qnaPosts[i].available == 1) {
								htmlTableString += '<td><button type="button" id="btn-delete-post-'+qna.qnaPosts[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
							} else if (qna.qnaPosts[i].available == 0) {
								htmlTableString += '<td><button type="button" id="btn-recover-post-'+qna.qnaPosts[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
							}
							htmlTableString += '</tr>';
						}
						
						var htmlNavString = '';
						if (qna.qnaPageInfo.startPage != qna.qnaPageInfo.curPage) {
							htmlNavString += '<li class="page-item"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
						} else {
							htmlNavString += '<li class="page-item disabled"><a id="qna-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
						}
						
						for (i=qna.qnaPageInfo.startPage; i<=qna.qnaPageInfo.endPage; i++) {
							if (i == qna.qnaPageInfo.curPage) {
								htmlNavString += '<li class="active"><a id="qna-page-'+i+'">'+i+'</a></li>'
							} else {
								htmlNavString += '<li><a id="qna-page-'+i+'">'+i+'</a></li>'
							}
						}				
						
						if (qna.qnaPageInfo.endPage != qna.qnaPageInfo.curPage) {
							htmlNavString += '<li class="page-item"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
						} else {
							htmlNavString += '<li class="page-item disabled"><a id="qna-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaPageInfo.totalPages+'</span></a></li>'
						}
						
						$('#qna-tbody').html(htmlTableString);
						$('#qna-pagination').html(htmlNavString);
					},
					error:function(request, status, error) {
						console.log('오류');
					}
				});
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 답글 마지막
	$(document).on('click', '#qna-answer-final', function() {
		$.ajax({
			url:'post/ajax.do',
			method:'POST',
			traditional:true,
			data:{
					'boardName':'QNA Answer',
					'qnaAnswerPage':$("#qna-answer-final .sr-only").text()
				 },
			dataType:'json',
			success:function(qna) {
				var htmlTableString = '';
				for (i=0; i<qna.qnaAnswers.length; i++) {
					htmlTableString += '<tr>' +
		        	'<td>'+qna.qnaAnswers[i].no+'</td>' + 
			  		'<td>'+qna.qnaAnswers[i].writer.name+'</td>' +
			 		'<td><input type="hidden" id="qna-number-'+qna.qnaAnswers[i].qnaNo+'" value="'+qna.qnaAnswers[i].qnaNo+'"/><a id="qna-answer-modal-'+qna.qnaAnswers[i].qnaNo+'" data-toggle="modal" data-target="#qna-answer-info">'+qna.qnaAnswers[i].contents+'</a></td>';
					  	if (qna.qnaAnswers[i].available == 1) {
		 htmlTableString += '<td><button type="button" id="btn-delete-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
					  	} else if (qna.qnaAnswers[i].available == 0) {
		 htmlTableString +=	'<td><button type="button" id="btn-recover-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
					  	}
		htmlTableString += '</tr>';
				}
				var htmlNavString = '';
				if (1 != qna.qnaAnswerPageInfo.curPage) {
					htmlNavString += '<li class="page-item"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				}
				
				for (i=qna.qnaAnswerPageInfo.startPage; i<=qna.qnaAnswerPageInfo.endPage; i++) {
					if (i == qna.qnaAnswerPageInfo.curPage) {
						htmlNavString += '<li class="active"><a id="qna-answer-page-'+i+'">'+i+'</a></li>'
					} else {
						htmlNavString += '<li><a id="qna-answer-page-'+i+'">'+i+'</a></li>'					
					}
				}
				
				if (qna.qnaAnswerPageInfo.endPage != qna.qnaAnswerPageInfo.curPage) {
					htmlNavString += '<li><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
				}
				
				$('#qna-answer-tbody').html(htmlTableString);
				$('#qna-answer-pagination').html(htmlNavString);
			},
			beforeSend:function() {
				$('#loading-img').removeClass('display-none');
			},
			complete:function() {
				$('#loading-img').addClass('display-none');
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 답글 처음
	$(document).on('click', '#qna-answer-first', function() {
		$.ajax({
			url:'post/ajax.do',
			method:'POST',
			traditional:true,
			data:{
				'boardName':'QNA Answer',
				'qnaAnswerPage':$("#qna-answer-first .sr-only").text()
			},
			dataType:'json',
			success:function(qna) {
				var htmlTableString = '';
				for (i=0; i<qna.qnaAnswers.length; i++) {
					htmlTableString += '<tr>' +
		        	'<td>'+qna.qnaAnswers[i].no+'</td>' + 
			  		'<td>'+qna.qnaAnswers[i].writer.name+'</td>' +
			 		'<td><input type="hidden" id="qna-number-'+qna.qnaAnswers[i].qnaNo+'" value="'+qna.qnaAnswers[i].qnaNo+'"/><a id="qna-answer-modal-'+qna.qnaAnswers[i].qnaNo+'" data-toggle="modal" data-target="#qna-answer-info">'+qna.qnaAnswers[i].contents+'</a></td>';
					  	if (qna.qnaAnswers[i].available == 1) {
		 htmlTableString += '<td><button type="button" id="btn-delete-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
					  	} else if (qna.qnaAnswers[i].available == 0) {
		 htmlTableString +=	'<td><button type="button" id="btn-recover-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
					  	}
		htmlTableString += '</tr>';
				}
				var htmlNavString = '';
				if (1 != qna.qnaAnswerPageInfo.curPage) {
					htmlNavString += '<li class="page-item"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				}
				
				for (i=qna.qnaAnswerPageInfo.startPage; i<=qna.qnaAnswerPageInfo.endPage; i++) {
					if (i == qna.qnaAnswerPageInfo.curPage) {
						htmlNavString += '<li class="active"><a id="qna-answer-page-'+i+'">'+i+'</a></li>'
					} else {
						htmlNavString += '<li><a id="qna-answer-page-'+i+'">'+i+'</a></li>'					
					}
				}
				
				if (qna.qnaAnswerPageInfo.endPage != qna.qnaAnswerPageInfo.curPage) {
					htmlNavString += '<li><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
				}
				
				$('#qna-answer-tbody').html(htmlTableString);
				$('#qna-answer-pagination').html(htmlNavString);
			},
			beforeSend:function() {
				$('#loading-img').removeClass('display-none');
			},
			complete:function() {
				$('#loading-img').addClass('display-none');
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 답글 페이징 처리
	$(document).on('click', 'a[id*="qna-answer-page"]', function() {
		$.ajax({
			url:'post/ajax.do',
			method:'POST',
			traditional:true,
			data:{
					'boardName':'QNA Answer',
					'qnaAnswerPage':$(this).text()
				 },
			dataType:'json',
			success:function(qna) {
				var htmlTableString = '';
				for (i=0; i<qna.qnaAnswers.length; i++) {
					htmlTableString += '<tr>' +
		        	'<td>'+qna.qnaAnswers[i].no+'</td>' + 
			  		'<td>'+qna.qnaAnswers[i].writer.name+'</td>' +
			 		'<td><input type="hidden" id="qna-number-'+qna.qnaAnswers[i].qnaNo+'" value="'+qna.qnaAnswers[i].qnaNo+'"/><a id="qna-answer-modal-'+qna.qnaAnswers[i].no+'" data-toggle="modal" data-target="#qna-answer-info">'+qna.qnaAnswers[i].contents+'</a></td>';
					  	if (qna.qnaAnswers[i].available == 1) {
		 htmlTableString += '<td><button type="button" id="btn-delete-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
					  	} else if (qna.qnaAnswers[i].available == 0) {
		 htmlTableString +=	'<td><button type="button" id="btn-recover-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
					  	}
		htmlTableString += '</tr>';
				}
				var htmlNavString = '';
				if (1 != qna.qnaAnswerPageInfo.curPage) {
					htmlNavString += '<li class="page-item"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
				}
				
				for (i=qna.qnaAnswerPageInfo.startPage; i<=qna.qnaAnswerPageInfo.endPage; i++) {
					if (i == qna.qnaAnswerPageInfo.curPage) {
						htmlNavString += '<li class="active"><a id="qna-answer-page-'+i+'">'+i+'</a></li>'
					} else {
						htmlNavString += '<li><a id="qna-answer-page-'+i+'">'+i+'</a></li>'					
					}
				}
				
				if (qna.qnaAnswerPageInfo.endPage != qna.qnaAnswerPageInfo.curPage) {
					htmlNavString += '<li><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
				} else {
					htmlNavString += '<li class="page-item disabled"><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
				}
				
				$('#qna-answer-tbody').html(htmlTableString);
				$('#qna-answer-pagination').html(htmlNavString);
			},
			beforeSend:function() {
				$('#loading-img').removeClass('display-none');
			},
			complete:function() {
				$('#loading-img').addClass('display-none');
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 답글 삭제 및 갱신
	$(document).on('click', 'button[id*="btn-delete-answer"]', function() {
		
		var qnaAnswerNo = $(this).closest('tr').children('td:first').text();
		
		$.ajax({
			type:'POST',
			url:'post/ajax.do',
			traditional:true,
			data:{
				'functionName':'delQnaAnswer',
				'postNo':qnaAnswerNo
				},
			success:function() {
				$.ajax({
					url:'post/ajax.do',
					method:'POST',
					traditional:true,
					data:{
						'boardName':'QNA Answer',
						'qnaAnswerPage':$('#qna-answer-pagination .active').text()
						},
					dataType:'json',
					success:function(qna) {
					
						var htmlTableString = '';
						for (i=0; i<qna.qnaAnswers.length; i++) {
							htmlTableString += '<tr>' +
										        	'<td>'+qna.qnaAnswers[i].no+'</td>' + 
				                			  		'<td>'+qna.qnaAnswers[i].writer.name+'</td>' +
				                			 		'<td><input type="hidden" id="qna-number-'+qna.qnaAnswers[i].qnaNo+'" value="'+qna.qnaAnswers[i].qnaNo+'"/><a id="qna-answer-modal-'+qna.qnaAnswers[i].qnaNo+'" data-toggle="modal" data-target="#qna-answer-info">'+qna.qnaAnswers[i].contents+'</a></td>';
				                			  	if (qna.qnaAnswers[i].available == 1) {
				                 htmlTableString += '<td><button type="button" id="btn-delete-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
				                			  	} else if (qna.qnaAnswers[i].available == 0) {
				                 htmlTableString +=	'<td><button type="button" id="btn-recover-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
				                			  	}
				            htmlTableString += '</tr>';
						}
						var htmlNavString = '';
						if (qna.qnaAnswerPageInfo.startPage != qna.qnaAnswerPageInfo.curPage) {
							htmlNavString += '<li class="page-item"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
						} else {
							htmlNavString += '<li class="page-item disabled"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
						}
						
						for (i=qna.qnaAnswerPageInfo.startPage; i<=qna.qnaAnswerPageInfo.endPage; i++) {
							if (i == qna.qnaAnswerPageInfo.curPage) {
								htmlNavString += '<li class="active"><a id="qna-answer-page-'+i+'">'+i+'</a></li>'
							} else {
								htmlNavString += '<li><a id="qna-answer-page-'+i+'">'+i+'</a></li>'
							}
						}				
						
						if (qna.qnaAnswerPageInfo.endPage != qna.qnaAnswerPageInfo.curPage) {
							htmlNavString += '<li class="page-item"><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
						} else {
							htmlNavString += '<li class="page-item disabled"><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
						}
						
						$('#qna-answer-tbody').html(htmlTableString);
						$('#qna-answer-pagination').html(htmlNavString);
					},
					error:function(request, status, error) {
						console.log('오류');
					}
				});
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
	
	//Q&A 답글 복구 및 갱신
	$(document).on('click', 'button[id*="btn-recover-answer"]', function() {
		
		var qnaAnswerNo = $(this).closest('tr').children('td:first').text();
		
		$.ajax({
			url:'post/ajax.do',
			type:'POST',
			traditional:true,
			data:{
				'functionName':'recoverQnaAnswer',
				'postNo':qnaAnswerNo
			},
			success:function() {
				$.ajax({
					url:'post/ajax.do',
					method:'POST',
					traditional:true,
					data:{
						'boardName':'QNA Answer',
						'qnaAnswerPage':$('#qna-answer-pagination .active').text()
					},
					dataType:'json',
					success:function(qna) {
						
						var htmlTableString = '';
						for (i=0; i<qna.qnaAnswers.length; i++) {
							htmlTableString += '<tr>' +
							'<td>'+qna.qnaAnswers[i].no+'</td>' + 
							'<td>'+qna.qnaAnswers[i].writer.name+'</td>' +
							'<td><input type="hidden" id="qna-number-'+qna.qnaAnswers[i].qnaNo+'" value="'+qna.qnaAnswers[i].qnaNo+'"/><a id="qna-answer-modal-'+qna.qnaAnswers[i].qnaNo+'" data-toggle="modal" data-target="#qna-answer-info">'+qna.qnaAnswers[i].contents+'</a></td>';
							if (qna.qnaAnswers[i].available == 1) {
								htmlTableString += '<td><button type="button" id="btn-delete-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-danger btn-xs">삭제</button></td>';
							} else if (qna.qnaAnswers[i].available == 0) {
								htmlTableString +=	'<td><button type="button" id="btn-recover-answer-'+qna.qnaAnswers[i].no+'" class="btn btn-warning btn-xs">복구</button></td>';
							}
							htmlTableString += '</tr>';
						}
						var htmlNavString = '';
						if (qna.qnaAnswerPageInfo.startPage != qna.qnaAnswerPageInfo.curPage) {
							htmlNavString += '<li class="page-item"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
						} else {
							htmlNavString += '<li class="page-item disabled"><a id="qna-answer-first"><span aria-hidden="true">«</span><span class="sr-only">1</span></a></li>'
						}
						
						for (i=qna.qnaAnswerPageInfo.startPage; i<=qna.qnaAnswerPageInfo.endPage; i++) {
							if (i == qna.qnaAnswerPageInfo.curPage) {
								htmlNavString += '<li class="active"><a id="qna-answer-page-'+i+'">'+i+'</a></li>'
							} else {
								htmlNavString += '<li><a id="qna-answer-page-'+i+'">'+i+'</a></li>'
							}
						}				
						
						if (qna.qnaAnswerPageInfo.endPage != qna.qnaAnswerPageInfo.curPage) {
							htmlNavString += '<li class="page-item"><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
						} else {
							htmlNavString += '<li class="page-item disabled"><a id="qna-answer-final"><span aria-hidden="true">»</span><span class="sr-only">'+qna.qnaAnswerPageInfo.totalPages+'</span></a></li>'
						}
						
						$('#qna-answer-tbody').html(htmlTableString);
						$('#qna-answer-pagination').html(htmlNavString);
					},
					error:function(request, status, error) {
						console.log('오류');
					}
				});
			},
			error:function(request, status, error) {
				console.log('오류');
			}
		});
	});
});