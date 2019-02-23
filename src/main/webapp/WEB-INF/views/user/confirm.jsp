<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodePeople</title>
</head>
<body>

	<c:choose>
		<c:when test="${user.authStatus eq 0}">
			<script type="text/javascript">
				var userEmail = '${user.email}';
		
				alert(userEmail + '\n이메일 인증이 정상적으로 완료되었습니다.');
		
				window.open('', '_self', ''); 
				window.close(); 
			</script>
		</c:when>
		
		<c:when test="${user.authStatus eq 1}">
			<script type="text/javascript">
				alert('이미 인증된 아이디입니다.');
		
				window.open('', '_self', ''); 
				window.close(); 
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('유효하지않은 인증입니다.');
		
				window.open('', '_self', ''); 
				window.close();
			</script>
		</c:otherwise>
	</c:choose>
</html>