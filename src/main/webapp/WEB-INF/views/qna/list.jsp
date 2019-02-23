<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
  <style>
    .table>thead>tr>th,td{
      border-bottom: none;
      text-align: center;
      font-size: 16px;
      color:gray;
    }
    .table>tbody>tr>td{
      padding:3px;
      border-top: 1px solid rgba(0, 150, 133, 0.16);
      font-size: 15px;
    }
    .table>tbody>tr>td a{
    	color:#464646;
    	font-weight:400;
    }
    .table>tbody>tr>td a:visited{
    	color:#a1a1a1;
    }
    .table>tbody>tr:last-child{
      border-bottom: 1px solid rgba(0, 150, 133, 0.16);
      margin-bottom: 10px;
    }
    .sort-link{
      border:none;
      background-color:white;
      display:inline;
    }
    .sort-link{
      border:none;
      background-color:white;
      display:inline;
      color:gray;
    }
    .sort-link:hover{
      color:rgb(22, 193, 151);
    }
    .sort-link.active{
      color:black;
      text-decoration: underline;
    }
    .sg-pn-item{
    display:inline-block;
    }
    .sg-pn-item a{
    padding: 0px 7px 0px 7px;
    border: 2px solid #40e0d0;
    border-radius: 3px;
    font-weight: 600;
    color: #289086;
    font-size: 13px;
    }
    .sg-pn-item a.active{
    background-color: #40e0d0;
    color:white;
    }
  </style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>



    <!--컨테이너-->
<div class="container" style="max-width:70%">
    <h1><a href="/qna/list.do?sort=new" style="font-size:20px;color:black;"><img alt="QNA 게시판" src="/resources/img/qna/QNA_LOGO.png" width="100" style="margin-right:30px;">무엇이든 물어보세요!</a></h1>
    <hr>
    <div style="height: 37px;line-height: 37px;margin-left: 27px;">
	    <form action="list.do" id="qna-search-form">
    		<div style="display:inline-block;">
    			<button class="sort-link ${param.sort eq 'new' ? 'active':''}" value="new">최신순</button>
    			<button class="sort-link ${param.sort eq 'rep' ? 'active':''}" value="rep">답변순</button>
    			<button class="sort-link ${param.sort eq 'view' ? 'active':''}" value="view">조회순</button>
	    		<input type="hidden" name="sort" id="sort-value" value="${param.sort }">
	    		<input type="hidden" name="cp" id="cp-value" value="${param.cp }">
	    		<select name="rows" style="border:none;margin-left:20px;" id="rows-value">
		    		<option value="10" ${param.rows == 10 ? 'selected':'' }>10개씩 보기</option>
		    		<option value="20" ${param.rows == 20 ? 'selected':'' }>20개씩 보기</option>
		    		<option value="30" ${param.rows == 30 ? 'selected':'' }>30개씩 보기</option>
		    		<option value="50" ${param.rows == 50 ? 'selected':'' }>50개씩 보기</option>
		    	</select>
	    	</div>
		    <div style="text-align: center;display: inline-block;float: right;">
		    	
		    	<select name="searchType" style="border:2px solid rgb(76, 254, 210);border-radius:3px;height:37px;position:absolute;right:196px;">
		    		<option value="all" ${param.searchType eq 'all' ? 'selected' : ''}>전체</option>
		    		<option value="title" ${param.searchType eq 'title' ? 'selected' : ''}>제목</option>
		    		<option value="contents" ${param.searchType eq 'contents' ? 'selected' : ''}>내용</option>
		    	</select>
			    <input type="text" name="keyword" style="border:2px solid rgb(76, 254, 210);border-radius:3px;text-align:center;width:200px;height:37px;" placeholder="검색" value="${param.keyword }">
			</div>
		</form>
	</div>
    <table class="table table-hover">
      <colgroup>
        <col width="100px;">
        <col width="*">
        <col width="10%">
        <col width="15%">
        <col width="10%">
        <col width="15%">
      </colgroup>
      <thead>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>답변</th>
          <th>작성자</th>
          <th>조회수</th>
          <th>게시일</th>
        </tr>
      </thead>
      <tbody>
      <c:choose>
      	<c:when test="${empty qnas}">
     	 	<tr>
      			<td colspan="6">질문이 존재하지 않습니다.</td>
      		</tr>
      	</c:when>
      	<c:otherwise>
	      <c:forEach items="${qnas }" var="qna" varStatus="status">
		        <tr id="${qna.no }">
		          <td>${pagination.totalRows - qna.rn  + 1}</td>
		          <td style="text-align:left;"><a href="detail.do?qnaNo=${qna.no}">${qna.title }</a></td>
		          <td>${fn:length(qna.answers)}</td>
		          
		          <c:choose>
			          <c:when test="${LOGIN_USER.id != qna.writer.id and LOGIN_USER != null}">
			          	<td style="text-align:left;"><button class="sg-none follow-me" data-toggle="tooltip" title="친구신청 보내기" value="${qna.writer.id }"><img alt="${qna.writer.name}님의 프로필사진" src="/resources/img/user/icon/${qna.writer.avatar.image eq 'Default' ? 'icon.png' : qna.writer.avatar.image}" style="width: 30px;height: 30px;border-radius: 100px;"> ${fn:substring(qna.writer.name,0,6)}<small>(${fn:substring(qna.writer.id,0,3) }***)</small></button></td>
			          </c:when>
			          <c:otherwise>
			          	<td style="color:#337ab7;text-align:left;"><img alt="${qna.writer.name }님의 프로필사진" src="/resources/img/user/icon/${qna.writer.avatar.image eq 'Default' ? 'icon.png' : qna.writer.avatar.image}" style="width: 30px;height: 30px;border-radius: 100px;"> ${fn:substring(qna.writer.name,0,9)}<small>(${fn:substring(qna.writer.id,0,3) }***)</small></td>
			          </c:otherwise>
		          </c:choose>
		          <td>${qna.views }</td>
		          <td><small><fmt:formatDate value="${qna.createDate }" pattern="yyyy-MM-dd"/></small></td>
	        	</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
      </tbody>
    </table>
    <div class="text-center">
    	<ul style="display: inline-block;">
    		<c:if test="${pagination.currentBlock gt 1 }">
				<li class="sg-pn-item"><a href="javascript:searchQna(${pagination.prevBlock })">&laquo;</a></li>
			</c:if>
    		<c:forEach var="pnum" begin="${pagination.beginPage }" end="${pagination.endPage }">
    			<li class="sg-pn-item"><a class="${pnum eq param.cp ? 'active':'' }" href="javascript:searchQna(${pnum })">${pnum }</a></li>
    		</c:forEach>
    		<c:if test="${pagination.currentBlock lt pagination.totalBlocks }">
				<li class="sg-pn-item"><a href="javascript:searchQna(${pagination.nextBlock })">&raquo;</a></li>
			</c:if>
    	</ul>
    	 <div style="float:right;">
		    <a class="sg-btn sg-btn-3rd sg-nb" href="add.do">질문하기</a>
	    </div>
    </div>
  </div>
    <!--컨테이너 끝-->


	<script>
		if(!$('.sort-link').hasClass("active")){
			$('.sort-link[value=new]').addClass('active');
		}
		$('.sort-link').click(function() {
			$("#sort-value").val($(this).val());
		});
		
		function searchQna(cp){
			$("#cp-value").val(cp);
			$('#qna-search-form').submit();
		}
		
		$('#rows-value').change(function(){
			searchQna(1);
		})
		
		//봤던 글 액티브
		var qnaCookie = /qnaSeq=([^;]*)/.test(document.cookie) ? unescape(RegExp.$1) : '';
		var qnaSeqArray = qnaCookie.split('|');
		for(var i in qnaSeqArray){
			$('#'+qnaSeqArray[i]).css('background','#f1f1f1');
		}
	</script>
	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>