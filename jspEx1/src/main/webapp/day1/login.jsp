<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="login_result.jsp" method="get">
	<!--  method 디폴트값은 겟 -->
		<div>아이디 : <input type ="text" name="userId"></div>
		<div>비밀번호 : <input type ="password" name="pwd"></div>
		<input type="submit" value="로그인">
	</form>
</body>
</html>