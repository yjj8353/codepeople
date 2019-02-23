<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href='/resources/css/user/my.css?ver=<%=new Date()%>'>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
     
     <%@include file="/WEB-INF/views/user/my_header.jsp" %>
       <div class="user-info-body" style="margin-top:30px;padding-left:30px;">
            <div class="row info-container sg-background" style="background: url(/resources/img/user/background/${LOGIN_USER.avatar.bgImg eq 'Default' ? 'Productsp-Page-Header-1500x300.jpg':LOGIN_USER.avatar.bgImg}) 0% 30% / cover !important;">
               <div class="col-xs-6" style="background-color: rgba(255, 255, 255, 0.90);padding-bottom: 20px;">
                  <h3>내 정보</h3>
                  <div class="user-icon-box text-center">
				<a onclick="iconModify()" style="cursor:pointer;"><img class="sg-profile-img img" src="<c:url value='/resources/img/user/icon/'/>${LOGIN_USER.avatar.image eq 'Default' ? 'icon.png' : LOGIN_USER.avatar.image}" style="float:left;width:100px;height:100px;"></a>
				<div style="background-color:white;padding:10px;width:150px;position:absolute;border:1px solid lightgray;bottom:-58px;left:-130px;display:none;background-color:white;" class="alert-profile">
				<a onclick="iconModify()">프로필 변경</a>
				<form action="/user/my/iconmodify.do" id="form-icon-modify" method="post"  enctype="multipart/form-data">
				<input type="file" style="display:none" class="icon-modify" name="file" accept=".gif, .jpg, .png">
				</form>
				<c:if test="${LOGIN_USER.avatar.image != 'Default' }">
				<hr style="margin:3px;width:100%;">
				<a class="icon-del">프로필 삭제</a></c:if>
				</div>
               </div>
                  <dt>아이디</dt>
                  <dd>${LOGIN_USER.id }</dd>
                  <dt>이메일</dt>
                  <dd>${LOGIN_USER.email}</dd>
                  <dt>이름</dt>
                  <dd>${LOGIN_USER.name }</dd>
               </div>
               <div class="col-xs-6 text-center">
               		<div style="">
               			<p style="position: relative;color: #ff7373;top: 20px;font-weight: 600;background-color: rgba(255, 255, 255, 0.90);">사진 크기는 1500x300으로 등록해주세요.</p>
               			<button class="sg-btn sg-btn-3rd sg-nb" style="top: 35px;position: relative;" onclick="backgroundModify()">변경</button>
               			<c:if test="${LOGIN_USER.avatar.bgImg != 'Default' }">
	               			<a href="bgdel.do" class="sg-btn sg-btn-primary sg-nb background-del" style="top: 35px;position: relative;">삭제</a>
               			</c:if>
               		</div>
               		<form action="" id="form-background-modify">
               			<input type="file" accept=".gif, .jpg, .png" style="display:none" class="background-modify" name="file">
               		</form>
               </div>
            </div>
            <div class="row">

               <div class="col-xs-12 my-pay-item" style="border-top:1px solid lightgrey;margin-top:20px;">
                  <h3>결제 내역 <small>${fn:length(buyLectures)}개의 결제내역</small></h3><br>
                  <ul>
                  <c:forEach items="${buyLectures}"  var="buyLecture">
                     <li>
                        <img src="/resources/img/paid/lectureimg/${buyLecture.paidLecture.thumbnail}" alt="" style="width:100px;height: 100px;border-radius:100px;float:left;border:1px solid lightgray;padding:5px;"/>
                        <div class="pay-info" style="margin-left:150px;">
                           <p style="font-size:17px;">${buyLecture.paidLecture.title }</p>
                           <p>결제금액: <fmt:formatNumber value="${buyLecture.paidLecture.price }" type="number"/> 원</p>
                           <p>결제일: <fmt:formatDate value="${buyLecture.createDate}" pattern="yyyy-MM-dd"/></p>
                        </div>
                     </li>
                  </c:forEach>
                  </ul>
               </div>

            </div>
         </div>
      </div>
         
      <script>
      $(".sg-profile-img.img,.alert-profile").mouseover(function(){
    	  $(".alert-profile").show();
      });

      $(".sg-profile-img.img,.alert-profile").mouseout(function(){
    	  $(".alert-profile").hide();
      });
      function iconModify(){
    	  $(".icon-modify").click();
      };
      function backgroundModify(){
    	  $(".background-modify").click();
      };
      
      $(".background-modify").on("change",function(){
    	  var formData = new FormData($("#form-background-modify")[0]);
    	  $.ajax({
    		  url:"/user/my/bgmodify.do",
    		  type:"post",
    		  data: formData,
    		  processData:false,
    		  contentType:false,
    		  success:function(result){
  			  	window.location.reload();
    		  },
    		  error:function(err){
    			  console.log("에러")
    			  console.log(err);
    		  }
    	  })
      })
      
      $(".icon-modify").on("change",function(){
    	  var formData = new FormData($("#form-icon-modify")[0]);
    	  $.ajax({
    		  url:"/user/my/iconmodify.do",
    		  type:"post",
    		  data: formData,
    		  processData:false,
    		  contentType:false,
    		  success:function(result){
    			  console.log("업로드 되었습니다.");
    			  $(".sg-profile-img").attr("src","<c:url value='/resources/img/user/icon/'/>"+result);
    		  },
    		  error:function(err){
    			  console.log("에러")
    			  console.log(err);
    		  }
    	  })
      })
       $(".icon-del").on("click",function(){
    	  var formData = new FormData($("#form-icon-modify")[0]);
    	  $.ajax({
    		  url:"/user/my/icondel.do",
    		  type:"get",
    		  success:function(){
    			  $(".sg-profile-img").attr("src","<c:url value='/resources/img/user/icon/icon.png'/>");
    		  }
    	  })
      })
      
      </script>
<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>