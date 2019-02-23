<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<script type="text/javascript"
	src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
	#frm {
		margin-top: 40px;	
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		
		<!-- action : 에디터에 입력한 html 코드를 전달받을 Controller페이지 URL -->
		<form action="/free/submit.do" method="post" id="frm" enctype="multipart/form-data">
			<div class="form-group">
				<label>강의 제목</label>
				<input type="text" class="form-control" name="lectureTitle">
			</div>
			<div class="form-group">
				<a onclick="fileToggle()">이미지 파일 등록<i class="fas fa-paperclip"></i></a>
				<input type="file" name="lectureImgFile" style="display:none" class="form-control">
			</div> 
			<div class="form-group">
				<label>강의 내용</label>
				<textarea name="lectureContent" id="editor" rows="5" cols="100" style="width: 100%; height: 200px;"></textarea>	
			</div>
			<div class="form-group">
				<label>강의 시간</label>
				<input type="number" name="lectureTime" class="form-control">
			</div>
			<br>
			<div class="yb-lecture-level">
				<label>강의 레벨</label>
				<select name="lectureLevel" size="1" class="form-control">
					<option value="1" selected="selected">입문</option>
					<option value="2">초급</option>
					<option value="3">중급</option>
					<option value="4">고급</option>					
				</select>
			</div>
			<br>
			<div class="form-group">
				<label>강의 요약</label>
				<textarea name="lectureSummary" id="lecutre-summary" rows="5" class="form-control"></textarea>
			</div>
			
			<div id="section-box">
			
			</div>
			
			<div>
				<input type="button" id="btn-save" value="강의 등록"  class="sg-btn sg-btn-primary sg-btn-sm"/>
				<input type="button" id="btn-add-form" value="섹션 추가"  class="sg-btn sg-btn-3rd sg-btn-sm""/>
			</div>
		</form>
	</div>



	<script type="text/javascript">
		function fileToggle(){
			$("input[name='lectureImgFile']").click();
		}
		
			var editerItems = [];
			var sectionEditerItems = [];
			var formIndex = 0;
			
			function createEditor(el, item) {
				
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : item,
					elPlaceHolder : el,
					sSkinURI : "/resources/editor/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,
					}
				});
				
			}
			
			createEditor("editor", editerItems);
			
			$("#btn-add-form").click(function() {
				
				var html = '<div class="form-group">';
					html += '<label>섹션 제목</label>';
					html += '<input type="text" class="form-control" name="sectionTitles">';
					html += '</div>';
					html += '<div class="form-group">';
					html += '<label>섹션 내용</label>'
					html += '<textarea name="sectionContents" id="sectionEditer'+formIndex+'" rows="5" cols="100" style="width: 100%; height: 200px;"></textarea>';			
					html += '</div>';
					
				$("#section-box").append(html);
				sectionEditerItems.push([]);
				
				createEditor("sectionEditer" + formIndex, sectionEditerItems[formIndex]);
				formIndex++;
					
			});
			
			//전송버튼
			$("#btn-save").click(function() {
				
				if ($("input[name=lectureTitle]").val() == "") {
					alert("제목을 입력하세요")
					$("input[name=lectureTitle]").focus();
					return false;
				}
				
				if ($("input[name=lectureImgFile]").val() == "") {
					alert("이미지를 업로드 하세요")
					$("input[name=lectureImgFile]").focus();
					return false;
				}
				
				editerItems.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
			    	var editor = $("#editor").val();

			        if( editor == ""  || editor == null || editor == '&nbsp;' || editor == '<p>&nbsp;</p>')  {
			             alert("내용을 입력하세요.");
			             editerItems.getById["editor"].exec("FOCUS"); //포커싱
			             return false;
			        }
			        
				//id가 smarteditor인 textarea에 에디터에서 대입
				editerItems.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				for (var i=0; i<formIndex; i++) {
					sectionEditerItems[i].getById['sectionEditer' + i].exec("UPDATE_CONTENTS_FIELD", []);
				}				
				//폼 submit
				$("#frm").submit();
			})
	
	</script>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>