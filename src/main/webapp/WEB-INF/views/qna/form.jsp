<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>


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
	</script>

    <!--컨테이너-->
<div class="container" style="max-width:70%">
    <h1>Q&A 질문하기</h1>
    <hr>
	<form action="add.do" method="post" id="frm">
		<div class="row">
			<div class="col-xs-8">
			<label style="font-size:18px;width:85px;"><i class="fab fa-quora" style="background-color:#40e0d0;padding:5px;border-radius:100px;color:white"></i>질문</label>
			<input type="text" name="title" style="width:80%;border:2px solid #40e0d0;" autocomplete="off">
			<span>(0/80)자</span>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8">
			    <textarea id="summernote" name="contents"></textarea>
			    <input type="button"class="sg-btn sg-btn-primary history-back" value="취소" />
			    <input type="submit" class="sg-btn sg-btn-primary sg-nb" value="등록" />
			</div>
		</div>
	</form>
</div>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
	        placeholder: 'Hello bootstrap 4',
	        height: 400,
			callbacks: { // 콜백을 사용
                // 이미지를 업로드할 경우 이벤트를 발생
			    onImageUpload: function(files, editor, welEditable) {
				    sendFile(files[0], this);
				}
			}
	    });
	});

</script>
    <!--컨테이너 끝-->
<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>