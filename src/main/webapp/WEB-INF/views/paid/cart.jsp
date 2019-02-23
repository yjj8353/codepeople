<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet" href="/resources/css/paid/cart.css?ver=1">
<!-- 아임포트 결제모듈 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/js/paid/cart.js?ver=2"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">

		<div class="paid-cart-banner col-xs-12">
			<h1 id="paid-cart-category">MY CART</h1>
			<p id="paid-cart-description">PAY AND GROW WITH CODEPEOPLE</p>
		</div>

		<h4>ORDER LIST</h4>




	<c:forEach var="result" varStatus="status" items="${carts }">
		<div class="paid-cart-orderlists">
			<div class="col-xs-12 paid-cart-content">
			<input type="hidden" class="paid-lecture-for-payment" value="${result.paidLecture.no }">
			<input type="hidden" class="paid-cartNo-for-payment" value="${result.no }">
			
				<button type="button" class="close" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

				<div class="col-xs-2 cart-photo">
					<img id="paid-cart-photo" src="/resources/img/paid/lectureimg/${result.paidLecture.thumbnail}"
						align="center" />
				</div>
				<div class="col-xs-7">
					<div>
						<h3 id="paid-cart-title">${result.paidLecture.title }</h3>
					</div>
					<div>
						<p id="paid-cart-content-description">
							${result.paidLecture.description }
						</p>
					</div>
				</div>
				<div class="col-xs-2 col-xs-offset-10" style="text-align: right;">
					<span class="paid-cart-priceform"><span id="paid-cart-price">
					<fmt:formatNumber value="${result.paidLecture.price }" pattern="#,###.##"/>
					</span>
					<span>원</span>
					</span>
				</div>
			</div>
		</div>
	</c:forEach>


		<div class="col-xs-8"></div>
		<div class="col-xs-4" style="padding-right: 0px">
			<hr class="cart">
		</div>


		<div class="col-xs-9"></div>
		<div class="col-xs-3"
			style="padding-right: 0px; text-align: right; margin-top: 15px; margin-bottom: 15px;">
			<span style="font-size: 20px; margin-right: 30px;">합계</span><span
				class="paid-cart-totalpriceform"><span
				id="paid-cart-totalprice"><fmt:formatNumber value="${totalPrice }" pattern="#,###.##"/></span><span>원</span></span>
		</div>

		<div class="col-xs-12" style="text-align: right; padding-right: 0px;">
			<input type="checkbox" name="policy" value="policy" id="poliyChecked"> <span
				style="color: red;"> 요금 및 환불정책 </span>에 동의합니다 <br>
		</div>

		<div>
			<button class="sg-btn-primary" id="paid-cart-btn">결 제 하 기</button>
		</div>

	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>