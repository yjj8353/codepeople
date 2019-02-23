<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://momentjs.com/downloads/moment.js"></script>
<style type="text/css">
	.comment-contents{
		margin:10px 0px 10px 0px;border-bottom:1px solid lightgray;padding-bottom:10px;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>



    <!--컨테이너-->
    <div class="" style="max-width:70%;padding:0px 0px 50px 20%;">
    <h1><a href="/qna/list.do?sort=new" style="font-size:20px;color:black;"><img alt="QNA 게시판" src="/resources/img/qna/QNA_LOGO.png" width="100" style="margin-right:30px;">무엇이든 물어보세요!</a></h1>
    <hr>
      <div class="" style="">
        <h4 style="font-size:20px;padding-bottom:20px;"><i class="fab fa-quora" style="font-size:44px;color:rgb(69, 196, 171)"></i>${qna.title }</h4>
        <p style="font-size:16px;">${qna.contents}</p>
        <hr>
        <div class="">
          <img class="f-i" alt="${qna.writer.name }님의 프로필사진" src="/resources/img/user/icon/${qna.writer.avatar.image eq 'Default' ? 'icon.png' : qna.writer.avatar.image}" style="width: 50px;height: 50px;border-radius: 100px;">
				<c:choose>
					<c:when test="${LOGIN_USER.id != qna.writer.id }">
						<button class="sg-none follow-me" data-toggle="tooltip" title="" value="${qna.writer.id }" data-original-title="친구신청 보내기">
							<span style="font-weight:bold;font-size:17px;margin-left:10px;">${qna.writer.name }</span>
						</button>
							<small><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${qna.createDate }"/></small>
					</c:when>
					<c:otherwise>
				<span style="font-weight:bold;font-size:17px;margin-left:10px;">${qna.writer.name }</span><span style="color: #337ab7; font-size: 12px;">(나)</span> <small><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${qna.createDate }"/></small>
					</c:otherwise>
				</c:choose>
	          <div style="float:right;">
				<button type="button" class="sg-btn sg-nb sg-btn-xs history-back" style="border:2px solid #009eb7;"><i class="fas fa-align-justify" style="color:#009eb7"></i> 목록</button>
		        <c:if test="${LOGIN_USER != null and LOGIN_USER.no == qna.writer.no }">
			       	<button type="button" class="btn-modify-qna sg-btn sg-btn-3rd sg-nb sg-btn-xs" value="${qna.no}"><i class="fas fa-pencil-alt" style="color:#229085;"></i>수정</button>
			       	<button type="button" class="btn-del-qna sg-btn sg-btn-primary sg-nb sg-btn-xs" value="${qna.no }"><i class="fas fa-times" style="color:red;"></i>삭제</button>
		        </c:if>
	          </div>
        </div>
      </div>
    </div>
    
    <div class="" style="background-color:#f5f5f5;padding:20px 0px 50px 20%;">
	<c:choose>
		<c:when test="${empty qna.answers and LOGIN_USER != null}">
			<div style="max-width: 70%;text-align: center;" class="answer-box">
				<h2>아직 답변이 없습니다! 답변을 등록해보세요!</h2>
				<br>
				<button type="button" class="sg-btn sg-btn-3rd sg-nb btn-answer">답변하기</button>
			</div>
		</c:when>
		<c:otherwise>
		    <c:forEach items="${qna.answers }" var="answer">
		      <div class="" style="max-width:70%;background-color:white;padding:30px;border-radius:10px;margin-top:15px;margin-bottom:15px;">
		        <h3>
				<img class="f-i" alt="${answer.writer.name }님의 프로필사진" src="/resources/img/user/icon/${answer.writer.avatar.image eq 'Default' ? 'icon.png' : answer.writer.avatar.image}" style="width: 50px;height: 50px;border-radius: 100px;">
					<c:choose>
						<c:when test="${LOGIN_USER.id != answer.writer.id }">
							<button class="sg-none follow-me" data-toggle="tooltip"
								title="" value="${answer.writer.id}"
								data-original-title="친구신청 보내기">${answer.writer.name }
							</button>
						</c:when>
						<c:otherwise>
							${answer.writer.name } <span
								style="color: #337ab7; font-size: 12px;">(나)</span>
						</c:otherwise>
					</c:choose>
				님의 답변입니다.<small style="font-size:12px;">(<fmt:formatDate value="${answer.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</small></h3>
		        <hr>
		
		        <div class="answer-contents">
		        	${answer.contents }
		        </div>
		
		        <hr>
		        <div class="qna-footer" style="padding:0px 20px 0px 20px;">
		          <div class="comment-top" style="padding:10px;">
		            <button class="sg-none btn-comment-show">
		              <i class="far fa-comment-dots" style="font-size:25px;"></i>
		              <span class="badge" id="count-${answer.no }" style="position: absolute;top: 0;">${fn:length(answer.comments) }</span>
		            </button>
		          </div>
		
		          <div class="comment-container" style="display:none;">
		
		            <div>
		              <form class="comment-form">
		              	<input type="hidden" value="${answer.no}" name="answerNo">
			            <textarea class="board-comment" placeholder="댓글을 입력하세요." style="resize: none;width:100%;height:100px;margin-bottom:30px;"></textarea>
			              <div class="board-comment-footer" style="position:absolute;bottom:0px;border:1px solid gray;border-top: none;width:100%;">
			                <div style="color:gray;padding:10px;"><span class="char-count">0</span>/1000 <small>댓글은 1000자 이내로 작성해주세요.</small>
			                </div>
			              </div>
			              <button style="position:absolute;bottom:0px;right:0px;height:35px;width:80px;" class="comment-send">등록</button>
		              </form>
		            </div>
					<div id="comment-box-${answer.no }">
						<c:forEach items="${answer.comments }" var="comment">
				            <div class="comment-contents" >
				            <img class="f-i" alt="${answer.writer.name }님의 프로필사진" src="/resources/img/user/icon/${comment.writer.avatar.image eq 'Default' ? 'icon.png' : comment.writer.avatar.image}" style="width: 23px;height: 23px;border-radius: 100px;">
				              <c:choose>
				              	<c:when test="${LOGIN_USER.id != comment.writer.id }">
				              	<button class="sg-none follow-me" data-toggle="tooltip" title="" value="${comment.writer.id }" data-original-title="친구신청 보내기">
					              	 ${comment.writer.name }
				              	 </button>
				              	</c:when>
				              	<c:otherwise>
				           	   		<span style="color:gray">${comment.writer.name } <span style="color:#337ab7;font-size:12px;">(나)</span></span>
				              	</c:otherwise>
				              </c:choose>
				              <p>${comment.contents }</p>
				              <small><fmt:formatDate value="${comment.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></small>
				            </div>
			            </c:forEach>
		            </div>
		          </div>
		        </div>
		      </div>
			</c:forEach>
			<c:if test="${LOGIN_USER != null }">
				<div style="max-width: 70%;text-align: center;" class="answer-box">
					<h2>답변이 부족하신가요? 직접 답변해보세요!</h2>
					<br>
					<button type="button" class="sg-btn sg-btn-3rd sg-nb btn-answer">답변하기</button>
				</div>
			</c:if>
		</c:otherwise>
	</c:choose>
	
	<div style="max-width: 70%; display:none;" class="summer-box" >
			<form action="addAns.do" method="post">
				<input type="hidden" value="${qna.no }" name="qnaNo">
				<textarea id="summernote" name="contents"></textarea>
				<div style="float:right">
					<button type="button" class="sg-btn sg-btn-primary sg-nb btn-answer-close">취소</button>
					<button class="sg-btn sg-btn-primary">등록</button>
				</div>
			</form>
		</div>
    </div>

    <!--컨테이너 끝-->



<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
<script type="text/javascript">
	/* summernote에서 이미지 업로드시 실행할 함수 */
	function sendFile(file, editor) {
		// 파일 전송을 위한 폼생성
		data = new FormData();
		data.append("uploadFile", file);
		$.ajax({ // ajax를 통해 파일 업로드 처리
			data : data,
			type : "POST",
			url : "upload.do",
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) { // 처리가 성공할 경우
				// 에디터에 이미지 출력
				$(editor).summernote('editor.insertImage', data);
			}
		});
	}

	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'Hello bootstrap 4',
			height : 400,
			callbacks : { // 콜백을 사용
				// 이미지를 업로드할 경우 이벤트를 발생
				onImageUpload : function(files, editor, welEditable) {
					sendFile(files[0], this);
				}
			}
		});
	});
	$(function(){
		$('.board-comment').keyup(function(event) {
			$(this).next().find('.char-count').text($(this).val().length);
			if ($(this).val().length > 999) {
				$(this).val($(this).val().substr(0, 999));
			}
		})
		$('.btn-comment-show').on('click', function(event) {
			$(this).parents('.comment-top').next().slideToggle();
		})
		
		$('.note-editor').hide();
		$('.btn-answer').click(function(){
			$('.answer-box').hide();
			$('.note-editor').show();
			$('.summer-box').show();
		})
		$('.btn-answer-close').click(function(){
			$('.answer-box').show();
			$('.note-editor').hide();
			$('.summer-box').hide();
		});
		
		$(".comment-form").submit(function(event){
			event.preventDefault();
			var answerNo = $(this).find('input[name=answerNo]').val();
			var comment = $(this).find('.board-comment');
			$.ajax({
				url:'comment.do',
				type:'post',
				dataType:'json',
				data:{answerNo:answerNo,contents:comment.val()},
				success:function(data){
					html = ' <div class="comment-contents" >';
					html += '<img class="f-i" alt="${answer.writer.name }님의 프로필사진" src="/resources/img/user/icon/';
					(data.writer.avatar.image == 'Default') ? html += 'icon.png' : html += data.writer.avatar.image;
					html += '" style="width: 23px;height: 23px;border-radius: 100px;">';
			        html += '<span color="gray">'+data.writer.name+'<span style="color:#337ab7;font-size:12px;">(나)</span></span>';
			        html += '<p>'+data.contents+'</p>';
			        html += '<small>'+moment().format('YYYY-MM-DD HH:mm:ss');+'</small>';
			        html += '</div>';
					comment.val("");
					$("#comment-box-"+answerNo).append(html);
					$("#count-"+answerNo).text(parseInt($("#count-"+answerNo).text())+1);
				}
			})
		});
		

	//QNA 삭제
		$('.btn-del-qna').click(function() {
			var qnaNo = $(this).val();
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href="/qna/delQna.do?qnaNo="+qnaNo;
			}
		})
		//QNA 수정
		$('.btn-modify-qna').click(function(){
			var qnaNo = $(this).val();
			if(confirm("수정 페이지로 이동하시겠습니까?")){
				location.href="/qna/modifyQna.do?qnaNo="+qnaNo;
			}
		})
	})
</script>
</html>