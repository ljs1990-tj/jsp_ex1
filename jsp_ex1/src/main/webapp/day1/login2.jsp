<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="login" action="login-result.jsp" method="get">
		<div>
			아이디 : <input name="id">
		</div>
		<div>
			패스워드 : <input type="password" name="pwd">
		</div>
		<input type="button" value="로그인" onclick="fnLogin()">
	</form>
</body>
</html>
<script>
	function fnLogin(){
		let login = document.login;
		if(login.id.value == ""){
			alert("아이디를 입력해주세요!");
			login.id.focus();
			return;
		}
		
		if(login.pwd.value == ""){
			alert("비밀번호를 입력해주세요!");
			login.pwd.focus();
			return;
		}
		
		login.submit();
		
	}
</script>





