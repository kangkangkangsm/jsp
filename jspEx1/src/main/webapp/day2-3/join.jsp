<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 사용자 정보를 입력(page) ==> DB에 저장(page) -->
	<!-- 아이디, 패스워드, 이름 저장  -->
	<form action="join-insert.jsp" name="user">
		<div>
			아이디 : <input type="text" name="userId">
			<button type="button" onclick="fnCheck()">중복체크</button>
		</div>
		<div>
			패스워드 : <input type="password" name="pwd">
		</div>
		<div>
			이름 : <input type="text" name="userName">
		</div>
		<div>
			전화번호 : <input type="text" name="tel">
		</div>
		<div>
			<label><input type="radio" value="M" name="gender" checked>남</label>
			<label><input type="radio" value="F" name="gender">여</label>
		</div>
		<button>form action 저장</button>
		<button type="button" onclick="fnSave()">함수를 이용한 저장</button>
		<button type="button" onclick="fnSubmit()">action 수정 후 submit</button>
		<button type="button" onclick="fnReview()">복습!!</button>
	</form>
</body>
</html>
<script>
	function fnSave() {
		var f = document.user;
		var param = "userId="+f.userId.value + "&pwd=" + f.pwd.value + "&userName=" + f.userName.value
		location.href="join-insert.jsp?" + param;
	}
	function fnSubmit() {
		var f = document.user;
		f.action = "join-insert2.jsp";
		f.submit();
	}
	function fnReview() {
		var f = document.user;
		f.action = "user-insert.jsp";
		f.submit();
	}
	function fnCheck() {
		var f = document.user;
		f.action = "id-check.jsp";
		f.submit();
	}
</script>