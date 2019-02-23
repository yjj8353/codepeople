<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="container">
      <div class="row text-center user-info-header" style="border-bottom:1px solid #ff7373">

        <div class="home sg-my-menu">
          <a href="home.do">HOME</a>
        </div>
        <div class="video sg-my-menu">
          <a href="video.do">내 강좌</a>
        </div>
         <div class="chat sg-my-menu">
          <a href="chat.do">채팅</a>
        </div>
        <div class="stat sg-my-menu">
          <a href="stat.do">뱃지</a>
        </div>
        <div class="write sg-my-menu">
          <a href="write.do" style="width:80px;">내 글</a>
        </div>
        <div class="info sg-my-menu">
          <a href="info.do">내 정보</a>
        </div>
      </div>
    </div>
    <script>
    	var menu = location.pathname.split("/");
    	$("."+menu[3].replace(".do","")).addClass("sg-menu-select");
    </script>