$(function() {
	
	// 숫자 1000단위 콤마 정규표현식
	function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
	}

	var values = [];
	$('.paid-lecture-for-payment').each(function(index, field) {
		values.push($(field).val());
	});
	
	
	var jsonData = JSON.stringify(values);
	console.log(jsonData);
	console.log($(".paid-cartNo-for-payment").val())
	

    $(".close").on('click', function(event) {
    	let cartNo = $(this).siblings(".paid-cartNo-for-payment")[0].value;
    	
	    $.ajax({
	    	type : "GET",
	    	url : "/paid/cart/delete.do",
	    	data : {"cartNo" : cartNo},
	    	error : function(error) {
	    		alert("error");
	    	},
	    	success : function(data) {
	    		
	    	}
	    });
	        	
    	let totalPrice = $("#paid-cart-totalprice").text();
		totalPrice = parseInt(totalPrice.replace(/,/g,""));
		
        let removePrice = $(this).siblings().children().children('#paid-cart-price').text();
        removePrice = parseInt(removePrice.replace(/,/g,""));
        totalPrice -= removePrice;
        
        totalPrice = addComma(totalPrice);
        $("#paid-cart-totalprice").text(totalPrice);
        $(this).parent().remove();
        
    });
    
    
    
	$("#paid-cart-btn").on("click", function() {
		
	    let price = $("#paid-cart-totalprice").text();
		price = parseInt(price.replace(/,/g,""));
		
		if (price === 0) {
			alert('상품을 선택해주세요');
			return;
		}
		
		if (!$("#poliyChecked").prop("checked")) {
			alert("요금 및 환불 정책 동의가 필요합니다");
			return;
		}

		var IMP = window.IMP;
		
		IMP.init('imp10706386');	// 가맹점 식별코드 넣기
	
		IMP.request_pay({
		    pg : 'html5_inicis',		// 이니시스 웹 표준 결제 (html5) -- 변경 X, 결제 모듈을 이니시스로 등록함 ㅇㅇ
		    pay_method : 'card',		// 결제 종류 - 신용카드
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '결제테스트',	// 결제창에서 보여질 상품 이름
		    amount : price,			// 상품 가격
		    buyer_email : 'next.ux.creator@gmail.com', // 고객 이메일
		    buyer_name : '김동원(테스트)',				// 고객 이름
		    buyer_tel : '010-1234-5678',				// 고객 전화번호
		    buyer_addr : '서울특별시 강남구 삼성동',	// 고객 주소
		    buyer_postcode : '123-456'					// 고객 우편번호
		
		}, function(rsp) {
			console.log(rsp);
		    if (rsp.success) {
		    	var flag = "success";
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		    } else {
		    	var flag = "fail";
		        var msg = '결제가 완료되었습니다.';
		    }
		    
		    alert(msg);
		    
		    if (flag === "fail") {
		    	$.ajax({
		    		type : "POST",
		    		url : "/paid/payment.do",
		    		data : {"values": jsonData},
		    		error : function(error) {
		    			alert(msg);
		    			return false;
		    		},
		    		success : function(data) {
		    			location.href = "/user/my/info.do";
		    		}
		    	});
		    }
		    
		    return false;
		    
		});
	});
	
	
});