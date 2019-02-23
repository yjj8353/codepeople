<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href='<c:url value="/resources/css/user/my.css?ver=0"/>'>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
     
     <%@include file="/WEB-INF/views/user/my_header.jsp" %>
     
         <div class="user-info-body" style="min-height:300px;margin-top:30px;padding-left:30px;">
        <div class="row">

          <div class="col-xs-6" style="border-right:1px solid lightgray">
            <h3>강의 현황</h3>

            <div class="my-cource-box">
              <span>실전 JSP</span>
              <div class="my-graph">
                <div style="width:10%;"></div>
              </div>
              <div class="my-graph-info">
                <span>10개 강의 중 1개</span>
                <span>5%</span>
              </div>
              <div class="my-cource-item" style="padding:20px;font-size:13px;width:80%">
                <ul>
                  <li><a href="#">jsp 맛보기(2)</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">jsp 맛보기(3)</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">jsp 맛보기(4)</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">jsp 맛보기(5)</a><span style="float:right;color:grey">10분30초</span></li>
                </ul>
              </div>
            </div>

            <div class="my-cource-box">
              <span>스프링으로 BOOT!</span>
              <div class="my-graph">
                <div style="width:100%;"></div>
              </div>
              <div class="my-graph-info">
                <span>10개 강의 중 10개</span>
                <span>100%</span>
              </div>
              <div class="my-cource-item" style="padding:20px;font-size:13px;width:80%">
                <ul>
                  <li><a href="#">스프링 맛보기(1)</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">스프링 맛보기(2)</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">스프링 맛보기(3)</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">스프링 맛보기(4)</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">스프링 맛보기(5)</a><span style="float:right;color:grey">10분30초</span></li>
                </ul>
              </div>
            </div>

            <div class="my-cource-box">
              <span>자바 파해치기</span>
              <div class="my-graph">
                <div style="width:50%;"></div>
              </div>
              <div class="my-graph-info">
                <span>10개 강의 중 5개</span>
                <span>50%</span>
              </div>
              <div class="my-cource-item" style="padding:20px;font-size:13px;width:80%">
                <ul>
                  <li><a href="#">오버라이딩,오버로딩</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">링크드리스트 설명 및 배열과 차이</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">OOP란</a><span style="float:right;color:grey">10분30초</span></li>
                  <li><a href="#">추상클래스와 인터페이스의 차이</a><span style="float:right;color:grey">10분30초</span></li>
                </ul>
              </div>
            </div>

          </div>

          <!--clear-->
          <div class="col-xs-1"></div>


          <div class="col-xs-6">
            <div class="">
              <h3>수강 완료 강의</h3>

              <ul>
                <li>자바를 잡아 ───────<span class="sg-text-sub">1000xp</span></li>
                <li>스프링으로 BOOT! ────<span class="sg-text-sub">1000xp</span></li>
                <li>자바를 잡아 ───────<span class="sg-text-sub">1000xp</span></li>
                <li>자바를 잡아 ───────<span class="sg-text-sub">1000xp</span></li>
              </ul>
            </div>
            <hr>
            <div class="">
              <h3>최근 나의 활동</h3>
              <ul style="border-left:1px solid lightgray;padding:10px;">
                <li style="margin-bottom:10px;">
                  <i class="sg-li"></i>
                  <span class="sg-text-sub">오늘</span>
                  <div class="">
                    자바를 잡아 완강 완료! <span class="sg-text-sub">3000xp ++</span>
                  </div>
                </li>
                <li style="margin-bottom:10px;">
                  <i class="sg-li"></i>
                  <span class="sg-text-sub">오늘</span>
                  <div class="">
                    자바를 잡아 완강 완료! <span class="sg-text-sub">3000xp ++</span>
                  </div>
                </li>
                <li style="margin-bottom:10px;">
                  <i class="sg-li"></i>
                  <span class="sg-text-sub">오늘</span>
                  <div class="">
                    자바를 잡아 완강 완료! <span class="sg-text-sub">3000xp ++</span>
                  </div>
                </li>
                <li style="margin-bottom:10px;">
                  <i class="sg-li"></i>
                  <span class="sg-text-sub">오늘</span>
                  <div class="">
                    자바를 잡아 완강 완료! <span class="sg-text-sub">3000xp ++</span>
                  </div>
                </li>

              </ul>
            </div>
          </div>
        </div>
      </div>
      
      
    </div>
    

<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>