<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="col-xs-12">

	    <form action="detail/addNote.do" method="POST" class="form-horizontal">
		      <div class="form-group">
		      	  <p>title</p>
				  <input type="text" placeholder="노트 제목을 입력해주세요" name="title" id="title-box" >
		          <input type="hidden" id="buyLectureNo" name="buyLectureNo" value="${no }">
		      </div>
		      <div class="form-group" style="margin-top: 10px;">
		     	 <p>contents</p>
		          <textarea name="content" id="content" class="summernote">
		          </textarea>
		      </div>
		      <div class="form-group">
		        <div class="col-xs-12">
		          <input type="submit" class="btn sg-btn-primary create-note-save" value="등록" style="float: right;"/>       
		          <input type="button"class="btn sg-btn-primary create-note-cancel" value="취소" style="float: right; margin-right: 10px;"/>
		        </div>
		      </div>
	    </form>
    </div>
    
    
    
    
    	<script>
    	
    	var no = $("#buyLectureNo").val();
    	console.log(no);
    	
    	
  	  function ajaxNote() {
	      $.ajax({
	        type : "GET",
	        url : "detail/note.do",
	        dataType : "html",
	        error : function() {
	          alert('error!');
	        },
	        success : function(data) {
	          $('.paid-contents').html(data);
	        }
	      });
	    }

	  
 	   $(".create-note-cancel").on("click", function(event) {
 			event.preventDefault();
 		    ajaxNote();
	   });
 	   
	 	function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "detail/noteImage.do",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
	 	        	$(editor).summernote('editor.insertImage', data);
	 	        }
	 	    });
	 	}
 	  
 	    $('.summernote').summernote({
	 	      height: 400,          // 기본 높이값
	 	      minHeight: null,      // 최소 높이값(null은 제한 없음)
	 	      maxHeight: null,      // 최대 높이값(null은 제한 없음)
	 	      focus: true,          // 페이지가 열릴때 포커스를 지정함
	 	      lang: 'ko-KR',         // 한국어 지정(기본값은 en-US)
	 	      backColor : 'pink',
	 	      callbacks: {
				    onImageUpload: function(files, editor, welEditable) {
				    sendFile(files[0], this);
	 	      		}
	 	     }
 	    });
 	    
 	    </script>