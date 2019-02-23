<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">

<head>
	<title>CODE PEOPLE :: video player</title>
	
	<meta charset="utf-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/css/paid/video-contents.css?ver=<%=new Date() %>">
	<link rel="stylesheet" href="/resources/css/paid/video-player.css?ver=<%=new Date() %>">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/resources/js/paid/video-player.js?ver=<%=new Date() %>"></script>
	<script src="/resources/js/paid/video-contents.js?ver=<%=new Date() %>"></script>
	
	<!-- summernote 플러그인 모듈 -->
	<link href="/resources/plugins/summernote/summernote.css" rel="stylesheet">
	<script src="/resources/plugins/summernote/summernote.js"></script>
	<script src="/resources/plugins/summernote/lang/summernote-ko-KR.js"></script>

</head>

<body>

	<div class="container-fluid">

		<input type="hidden" id="bookmarkLength" name="bookmarkLength" value="${bookmark }">

		<div class="video-note-page">
			<div class="col-xs-3 video-in-notelist">
				<p class="video-in-notelist-label">NOTE LIST</p>
				<div class="col-xs-12 video-note-list-wrapper">
					<div class="video-each-note" id="new-note-generator" style="border : 1px solid green !important;">
						<input type="hidden" value="" name="videoNoteNo" class="videoNoteNo"/>
						<div class="paid-note-toparea">
							<h4 class="video-each-note-title">이 곳을 클릭해서 새 노트를 입력하세요</h4>
						</div>
						<div class="video-note-hidden-content">
							내용을 입력하세요
						</div>
					</div>
						
						
					<div class="note-status">
					 <c:forEach var="note" varStatus="status" items="${notes }">
							<div class="video-each-note">
								<input type="hidden" value="${note.no }" name="videoNoteNo" class="videoNoteNo"/>
								<div class="paid-note-toparea">
									<span class="video-section-info-wrapper"><span class="glyphicon glyphicon-pencil"></span><span id="paid-each-section-name">${note.buyLecture.paidLecture.title }</span></span>
		
									<h3 class="video-each-note-title">${note.title}</h3>
								</div>
								<div class="video-note-hidden-content">
									${note.content }						
								</div>
							</div>
					</c:forEach>
					</div>
				</div>
			</div>


			<div class="col-xs-7 col-xs-offset-4 video-in-note">
				<div class="video-note-section-wrapper">
				</div>
				<div class="video-note-contents">
				        <div class="col-xs-12" style="margin-bottom: 20px; padding-left: 0px;">
				        	<div style="display:inline-block;">
								<p style="color: lightgray; font-size: 10px;">SMART COPY</p>
								<canvas id="myCanvas" width="400" height="240" style="border:1px solid #d3d3d3;">
								</canvas>
				        	</div>
						        <input type="hidden" name="selectedNoteNo" id="selectedNoteNo"/>
					        <div id="video-note-btn-wrapper" style="display:inline-block;">
					          	<input type="button" class="btn sg-btn-primary video-create-note-save" value="노트 저장하기" style="float: right; margin-bottom: 100px;"/>       
					          	<input type="button"class="btn video-create-note-cancel" value="동영상으로 돌아가기" style="float: right; margin-right: 10px; margin-left: 40px;"/>
					        </div>
				        </div>
					      
					      <div>
						      <hr>
					      </div>
					      
					      
					      <div>
							  <input type="text" placeholder="" name="title" id="title-box" >
					          <input type="hidden" id="buyLectureNo" name="buyLectureNo" value="${buyLecture.no }">
					      </div>
					      
					      
					      <div style="margin-top: 10px;">
					          <textarea name="content" id="content" class="summernote">
					          </textarea>
					      </div>
					      
					     
			 
					      					      
				</div>
			</div>
		</div>


		<div id='media-player'>
			<div id="mySidenav" class="sidenav">
				<span href="javascript:void(0)" class="closebtn">&times;</span>
				<div class="video-content-list">

					<c:forEach var="result" varStatus="status" items="${lectureWrapper}">
						<c:set var = "sum" value = "0" />
							<div class="col-xs-10 col-xs-offset-1 video-section-whole-box" id="group-${status.count }">
								<div class="row video-section-top-box">
									<div class="row" style="margin-top: 20px;">
										<div class="col-xs-10 video-top-section-wrapper">
											<span class="video-section-no-box"><span>SECTION </span><span id="video-section-no"> ${result.get(0).sectionNo}</span></span>
										</div>
										<div class="col-xs-2 video-section-complete-box">
											<span id="video-section-lesson-complete" class="${status.count }"> 
											
												<c:forEach var="history" varStatus="status" items="${recentLectureHistories}">
													<c:choose>
														<c:when test="${history.pass eq 'Y' && history.paidLectureDetail.sectionNo eq result.get(0).sectionNo}">
															<c:set var= "sum" value="${sum + 1}"/>
														</c:when>
													</c:choose>
												</c:forEach>
														<c:out value="${sum}"/>
											</span>
											<span> / </span>
											<span id="video-section-lesson-list">${fn:length(result) } </span>
										</div>
									</div>
									<div class="row">
										<h3 id="video-section-name">${result.get(0).sectionName}</h3>
									</div>
								</div>
							<c:forEach var="list" varStatus="number" items="${result }">
								
								<div class="row video-section-lesson-list">
									<div class="col-xs-1"></div>
									<div class="col-xs-10 video-section-lessonbox">
										<div class="video-lesson-per-one">
										<a href="/paid/video.do?fileName=${list.filePath }&detailNo=${list.no}"> 
											<div class="col-xs-10 video-identify-wrapper">
												<span id="video-lesson-no">${number.count}</span><span>. </span><span
													id="video-lesson-name"> ${list.lessonName}</span>
											</div>
										</a>
											<div class="col-xs-2 complete-section" style="text-align: right;">
											
											
								<c:forEach var="sectionFlag" varStatus="flagNum" items="${lectureHistories }">
									<c:if test="${sectionFlag.paidLectureDetail.sectionNo eq list.sectionNo}">
										<c:choose>
											<c:when test="${sectionFlag.paidLectureDetail.lessonNo eq list.lessonNo}">
												<c:choose>
												<c:when test="${sectionFlag.pass eq 'Y' }">
													<span id="video-complete-symbol">●</span>
												</c:when>
												<c:when test="${sectionFlag.pass eq 'N' }">
												</c:when>
												</c:choose>
											</c:when>
										</c:choose>
									</c:if>	
								</c:forEach>
											
											</div>
										</div>
									</div>
									<div class="col-xs-1"></div>
								</div>
							</c:forEach>
							</div>
					</c:forEach>
				</div>


			</div>
			<div class="toolbar">
				<div class="video-header">
					<div>
						<div class="col-xs-2 video-header-left">
							<span class="glyphicon glyphicon-menu-hamburger" id="video-lesson-menu"></span>
						</div>
						<div class="col-xs-10 video-header-right">
							<button class="sg-btn-primary" id="video-smart-copy">SMART COPY</button>
							<button class="sg-btn-secondary" id="video-myNote">MY NOTE</button>
							<a href="/paid/detail.do?no=${lectureDetails.get(0).getPaidLecture().getNo() }">
							<span id="potal-dashboard">대시보드로 가기</span></a>
						</div>
					</div>
				</div>
				<div class="speed-dropup">
					<div class="speed-option">
						<a id="0.5">0.5 x</a>
						<a id="0.75">0.75 x</a>
						<a id="1.0" style="background-color : #afeeee">1 x</a>
						<a id="1.25">1.25 x</a>
						<a id="1.5">1.5 x</a>
						<a id="2.0">2 x</a>
					</div>
				</div>

				<div class="bookmark-input-area">
					<input type="hidden" name="historyNo" id="lectureHistoryNo" value="${lectureHistory.no }">
				</div>

				<div class="mark-area">
					<c:forEach var="bookmark" varStatus="status" items="${bookmarks }" >
						<img class="mark-image" style="position:relative; left:'${bookmark.length}';"
						width="20px" id="mark-${bookmark.length}" src="/resources/img/paid/bookmark-video.png" alt="${bookmark.content }"/>
					</c:forEach>
				</div>
				<div class="caption-storage" style="display: none;">
					<c:forEach var="bookmark" varStatus="status" items="${bookmarks }" >
						<span class="caption-list" id="caption-${bookmark.length}" style="position:relative; color:white; background-color:black;">${bookmark.content }</span>
					</c:forEach>
				</div>
				
				<div class="caption">
					
				</div>
				
				
				
				

				<div class="video-footer">
					<div class="video-controller">
						<div id="backBar">
							<div id="progressBar">
							</div>
						</div>

						<div class="buttons">

							<span class="footer-left-buttons" style="margin-left: 20px;">
								<span class="glyphicon glyphicon-pause" id="playPause"></span>
								<span class="glyphicon glyphicon-forward" id="plusCurrentTime"></span>
								<button id="speedSetting" class="label sg-btn-primary"> speed 1.0 x</button>
								<span class="glyphicon glyphicon-backward" id="minusCurrentTime"></span>
								<span id="currenttime" style="color:white">00:00</span>
								<span style="color: aliceblue"> / </span>
								<span id="duration" style="color:white">00:00</span>
							</span>



							<span class="footer-center-buttons">
								<span id="video-link-exposure">
									<span class="glyphicon glyphicon-bookmark"></span>
									<span>북마크 보기</span>
								</span>
								<span id="video-link-bookmark">
									<span class="glyphicon glyphicon-plus-sign"></span>
									<span>북마크 추가</span>
								</span>
							</span>

							<span class="footer-right-buttons">
								<!-- 
                            <button id="volumeUp">volumeUp + 0.1</button>
                            <button id="volumeDown">volumeDown - 0.1</button>
                            -->
								<span class="glyphicon glyphicon-volume-up" id="mute"></span>
								<span class="glyphicon glyphicon-modal-window" id="pip"></span>
								<span class="glyphicon glyphicon-fullscreen" id="fullscreen"></span>
							</span>
						</div>

					</div>
				</div>
			</div>


			<c:choose>
				<c:when test="${!empty LOGIN_USER}">
				
			<div>
				<input type="hidden" name="historyNo" id="lectureHistoryNo" value="${lectureHistory.no }">
				<input type="hidden" name="historyLength" id="lectureHistoryLength" value="${lectureHistory.historyLength }">
				
				<video onchange='getBarSize()' id='media-video' autoplay poster="data:/resources/img/paid/video/loading.gif" >
	                <source src='http://www.codepeople.com:3000/video?fileName=${fileName }' type='video/mp4'>
	                <source src='http://www.codepeople.com:3000/video?fileName=${fileName }' type='video/webm'>
				</video>
			</div>
				
				</c:when>			
				<c:otherwise>
				<p style="color: white;"> 로그인이 필요한 서비스입니다 </p>
				</c:otherwise>
			</c:choose>


		</div>


		<div class="alert" style="position:absolute;display:block;width:200px;height:200px;right:10px;top:50%;background-color:white;display:none;">
		</div>
	
	</div>
	
	<script type="text/javascript">
    
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
	 	      height: 500,          // 기본 높이값
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
	
	$(".video-each-note").on('click', function(event) {
    	
        $(this).css("background-color", "#40e0d0");
        $(this).siblings().css("background-color", "");
        $("#new-note-generator").css("background-color", "");
        
    	
    	let noteContent = $(this).children(".video-note-hidden-content").html();
    	let noteTitle = $(this).children().children(".video-each-note-title").text();
    	let noteNo = $(this).children(".videoNoteNo").val();
    	
    	console.log(noteContent);
    	console.log(noteTitle);
    	console.log("노트 넘버", noteNo);
    	
    	$("#selectedNoteNo").val(noteNo);
    	$(".note-editable").html(noteContent);
    	$("#title-box").val(noteTitle);
    	
    	console.log("마지막 노트 번호", $("#selectedNoteNo").val());
    });
	
	function postNote() {
		var title = $("#title-box").val();
		var buyLectureNo = $("#buyLectureNo").val();
		var content = $("#content").val();
		var selectedNoteNo = $("#selectedNoteNo").val();
		
		console.log(title);
		console.log(buyLectureNo);
		console.log(content);
		console.log(selectedNoteNo);
		
		
		var updateComment = "노트 업데이트 완료!";
		var appendComment = "새로운 노트 작성 완료!";

		if (selectedNoteNo != null || selectedNoteNo != "") {
	 	    
			$.ajax({
	 	        data : {"title" : title, "buyLectureNo" : buyLectureNo, "content" : content, "selectedNoteNo" : selectedNoteNo},
	 	        type : "POST",
	 	        url : "detail/addVideoNote.do",
		    	error : function(error) {
		    		alert("error");
		    	},
	 	        success : function(data) {
		 	        	alert(updateComment);
		 	        	NotePageUpdateAjax();
	 	        }
	 	    });
	 	    
		} else {
			$.ajax({
	 	        data : {"title" : title, "buyLectureNo" : buyLectureNo, "content" : content},
	 	        type : "POST",
	 	        url : "detail/addVideoNote.do",
		    	error : function(error) {
		    		alert("error");
		    	},
	 	        success : function(data) {
		 	        	alert(appendComment);
		 	        	NotePageUpdateAjax();

	 	        }
	 	    });
		}
	}

	
	function NotePageUpdateAjax() {

		var buyLectureNo = $("#buyLectureNo").val();
		
		$.ajax({
 	        data : {buyLectureNo : buyLectureNo},
 	        type : "POST",
 	        url : "detail/NotePageUpdateAjax.do",
	    	error : function(error) {
	    		alert("error");
	    	},
 	        success : function(data) {
 	        	
				if(data.length > 0){
						var text = '';
					$(data).each(function(index,result){
						text += '<div class="video-each-note">'
						text +=  '<input type="hidden" value="' + result.no + '" name="videoNoteNo" class="videoNoteNo"/>'
						text += '<div class="paid-note-toparea">'
						text += '<span class="video-section-info-wrapper">'
						text += '<span class="glyphicon glyphicon-pencil"></span>'
						text += '<span id="paid-each-section-name">'
						text +=  result.buyLecture.paidLecture.title
						text += '</span></span>'
						text += '<h3 class="video-each-note-title">'
						text +=  result.title
						text += '</h3>'
						text += '</div><div class="video-note-hidden-content">'
						text +=  result.content
						text += '</div></div>'
					})
						$('.note-status').html('');
						$('.note-status').html(text);
							

						$(".video-each-note").on('click', function(event) {
					    	
					        $(this).css("background-color", "#40e0d0");
					        $(this).siblings().css("background-color", "");
					    	
					    	let noteContent = $(this).children(".video-note-hidden-content").html();
					    	let noteTitle = $(this).children().children(".video-each-note-title").text();
					    	let noteNo = $(this).children(".videoNoteNo").val();
					    	
					    	console.log(noteContent);
					    	console.log(noteTitle);
					    	console.log("노트 넘버", noteNo);
					    	
					    	$("#selectedNoteNo").val(noteNo);
					    	$(".note-editable").html(noteContent);
					    	$("#title-box").val(noteTitle);
					    	
					    	console.log("마지막 노트 번호", $("#selectedNoteNo").val());
					    });
				}
 	        }
 	    });
	}
	
	
	$(".video-create-note-save").on("click", function() {
		postNote();
	})
	
	var ws = new WebSocket("ws://www.codepeople.com/chat.do");
	ws.onmessage = function(event) {
		var onAudio = new Audio('/resources/sound/on.mp3');
		var items = event.data.split("/");
		var protocol = items[0];
		if("BADGE" == protocol){
			$('.alert').fadeIn();
			$('.alert').append("<div style='font-size:18px;font-weight:bold;'>새로운 뱃지를<br>획득하셨습니다!</div>");
			onAudio.play();
			setTimeout(function() {
				$('.alert').fadeOut();
			}, 5000);
		}
	}
	
	
	$("#new-note-generator").on("click", function() {
		$("#new-note-generator").css("background-color", "#ff7373");
		$(".video-each-note").css("background-color", "");
	})
	
	
	
	var completeCount = 0; 
	
	$(".complete-section").each(function(inext, item) {
		var complete = $(this).children("#video-complete-symbol").text();
		console.log(complete);
		
		if (!complete) {
			var $span = $('<span id="video-complete-symbol">○</span>');
			$(this).append($span);
		}
		
		if (complete == "●") {
			completeCount++;
		}
	})

	
	
	</script>
</body>
</html>
