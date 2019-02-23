<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
 <style media="screen">
      .sg-input-text{
         width: 50%;
         padding-left: 20px;
         margin-bottom: 10px;
      }
      form label{
         width: 80px;
         text-align: right;
      }
      hr{
         border-top:1px solid #fed6d6;
      }
   </style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp" %>
	<div class="container" style="min-height:300px; padding:10px;">
         <div class="">
            <h1>회원가입</h1>
         </div>
         <hr>

         <div class="">
         <a href="/login/googleSignIn.do" style="margin-left: 120px;"><img alt="Connect with Google" src="https://d81pi4yofp37g.cloudfront.net/wp-content/plugins/wordpress-social-login/assets/img/32x32/wpzoom/google.png"></a>
			<a href="/login/naverSignIn.do"><img alt="Connect with Naver" src="http://static.nid.naver.com/oauth/small_g_in.PNG" height="60" width="195"></a>
					
            <form:form action="signup.do" method="POST" style="padding:30px;" modelAttribute="userform" id="form-signup">
               <div class="">
                  <label for="">아이디</label>
                  <form:input type="text" class="sg-input-text" path="id" id="reg-id"/>
                  <span id="alert-id"><form:errors path="id"></form:errors></span>
               </div>
               <div class="">
                  <label for="">비밀번호</label>
                  <form:input type="password" id="reg-password" class="sg-input-text" path="password" style="width:24%"/>
                  <input type="password" id="reg-password2" name="password2" class="sg-input-text" style="width:25%" placeholder="한번 더 입력해주세요."/>
                  <span id="alert-password"><form:errors path="password"></form:errors></span>
               </div>
               <div class="">
                  <label for="">이메일</label>
                  <form:input type="text" class="sg-input-text" path="email" id="reg-email"/>
                  <span id="alert-email"><form:errors path="email"></form:errors></span>
               </div>
               <div class="">
                  <label for="">이름</label>
                  <form:input type="name" class="sg-input-text" path="name"/>
                  <form:errors path="name"></form:errors>
               </div>

               <h3 style="margin-left: 80px">이용약관</h3>
               <div class="" style="margin-left: 80px;height:100px;width: 50%;overflow-y:scroll;">
                  <br>
                  ① 이용자는 다음 각 호의 행위를 하여서는 안됩니다.
                1. 회원가입신청 또는 변경시 허위내용을 등록하는 행위
                2. "개드립"에 게시된 정보를 변경하는 행위
                3. "개드립" 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위
                4. 다른 회원의 ID를 도용하는 행위
                5. 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지 ·화상·음성 등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는게시하는 행위.
                6. 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)의 전송 또는 게시하는 행위
                7. 개드립의 직원이나 개드립 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 모용하여 글을 게시하거나 메일을 발송하는 행위
                8. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전자우편으로 발송하는 행위
                9. 스토킹(stalking) 등 다른 이용자를 괴롭히는 행위
                10. 다른 이용자에 대한 개인정보를 그 동의 없이 수집,저장,공개하는 행위
                11. 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송하는 등의 방법으로 "개드립"의 서비스를 이용하여 영리목적의 활동을 하는 행위
                12. "개드립"에서 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위

                ② 제1항에 해당하는 행위를 한 이용자가 있을 경우 "개드립"은 본 약관 제6조 제2, 3항에서 정한 바에 따라 이용자의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.
                ③ 이용자는 그 귀책사유로 인하여 "개드립"이나 다른 이용자가 입은 손해를 배상할 책임이 있습니다.

                제12조(공개게시물의 삭제)

                이용자의 공개게시물의 내용이 다음 각 호에 해당하는 경우 "개드립"은 이용자에게 사전 통지 없이 해당 공개게시물을 삭제할 수 있고, 해당 이용자의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.
                1. 다른 이용자 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용
                2. 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용
                3. 범죄행위와 관련이 있다고 판단되는 내용
                4. 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용
                5. 기타 관계 법령에 위배된다고 판단되는 내용

                제13조(저작권의 귀속 및 이용제한)

                ① "개드립"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "개드립"에 귀속합니다.
                ② 이용자는 "개드립"을 이용함으로써 얻은 정보를 "개드립"의 사전승낙 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
                ③ 회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, 개드립은 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도의 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되게 합리적인 범위 내에서 다음과 같이 회원이 등록한 게시물을 사용할 수 있습니다.
                1. 서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물성을 해치지 않는 범위 내에서의 편집 저작물 작성
                2. 미디어, 통신사 등 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 전시 혹은 홍보하게 하는 것. 단, 이 경우 개드립은 별도의 동의 없이 회원의 이용자ID/닉네임 및 관련 IP 외에
                회원의 개인정보를 제공하지 않습니다.
                3. 개드립은 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다


                제14조(광고게재 및 광고주와의 거래)
                ① 개드립은 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다. 회원은 회원이 등록한 게시물의 내용을 활용한 광고게재 및 기타 서비스상에 노출되는 광고게재에 대해 동의합니다.
                ② 개드립은 서비스상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다

                제15조(약관의 개정)

                ① "개드립"은 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
                ② "개드립"이 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기화면에 그 적용일자 칠(7일) 이전부터 적용일자 전일까지 공지합니다.
                ③ "이용자"는 변경된 약관에 대해 거부할 권리가 있습니다. "이용자"는 변경된 약관이 공지된 후 십오(15)일 이내에 거부의사를 표명할 수 있습니다. "이용자"가 거부하는 경우 "개드립"은 당해 "이용자"와의 계약을 해지할 수 있습니다. 만약 "이용자"가 변경된 약관이 공지된 후 십오(15)일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.

                제16조(재판관할)

                "개드립"과 이용자간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다.


                부칙

                ①이 약관은 2011년 12월 2일부터 적용됩니다.
                ②2010년 6월 15일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.
               </div>

               <hr>
               <button type="button" class="sg-btn sg-btn-primary sg-btn-md sg-nb">취소</button>
               <button name="btn-reg-submit" class="sg-btn sg-btn-3rd sg-btn-md sg-nb">가입</button>
            </form:form>
         </div>


      </div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>

	<script type="text/javascript">
	
		var idAuth = false;
		var pwdAuth = false;
		var emailAuth = false;
	
		$("#form-signup").submit(function(){
			if(!idAuth){
				$("#reg-id").focus();
				return false;
			}
			if(!pwdAuth){
				$("#reg-password").focus();
				return false;
			}
			if(!emailAuth){
				$("#reg-email").focus();
				return false;
			}
			$(".sg-loading-fade").fadeIn();
		})
		
		$("#reg-id").keyup(function(event){
			var id = $(this).val();
			if(id == ""){$("#alert-id").text("");}
			else if(!/[A-za-z0-9]{6,15}/g.test(id)){
				$("#alert-id").text("아이디는 6글자 이상 15글자 이하,특수문자 없이 입력해주세요.");
							idAuth = false;
			}else{
				$.ajax({
					url:"joinValueCheck.do",
					type:"get",
					dataType:"json",
					data:{id:id},
					success:function(result){
						if(result){
							$("#alert-id").text("사용가능한 아이디입니다!");
							idAuth = true;
						}else{
							$("#alert-id").text("중복된 아이디입니다.");
							idAuth = false;
						}
					}
				})
			}
		});
		
		$("#reg-email").keyup(function(event){
			var email = $(this).val();
			if(email == ""){$("#alert-email").text("");}
			else if(!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(email)){
				$("#alert-email").text("이메일 형식이 올바르지 않습니다.");
							emailAuth = false;
			}else{
				$.ajax({
					url:"joinValueCheck.do",
					type:"get",
					dataType:"json",
					data:{email:email},
					success:function(result){
						if(result){
							$("#alert-email").text("사용가능한 이메일 입니다!");
							emailAuth = true;
						}else{
							$("#alert-email").text("중복된 이메일입니다.");
							emailAuth = false;
						}
					}
				})
			}
		});
		
		$("#form-signup").on("keyup","input[name^=password]",function(event){
			var pwd = $("#reg-password").val();
			var pwd2 = $("#reg-password2").val();
			if(pwd==""){
				$("#alert-password").text("비밀번호를 입력해주세요.");
				pwdAuth = false;
			}else if(pwd != pwd2 && pwd2.length > 1){
				$("#alert-password").text("비밀번호가 일치하지 않습니다.");
				pwdAuth = false;
			}else if(pwd == pwd2){
				$("#alert-password").text("비밀번호가 일치합니다!");
				pwdAuth = true;
			}
		})
	</script>
</body>
</html>