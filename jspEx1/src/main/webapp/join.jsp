<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="join_result.jsp" method="get" name="login">
	<!--  method 디폴트값은 겟 -->
		<div>아이디 : <input type ="text" name="userId"></div>
		<div>비밀번호 : <input type ="password" name="pwd"></div>
		<div>이름 : <input type ="text" name="userName"></div> 
		<div>
			<label><input type ="radio" value="M" name="gender">남자</label>
			<label><input type ="radio" value="F" name="gender">여자</label>
		</div>
		<div>
			<label>
			<input type="checkbox" value="coding" name="hobby">코딩
			</label>
			<label>
			<input type="checkbox" value="game" name="hobby">게임
			</label>
			<label>
			<input type="checkbox" value="soccer" name="hobby">축구
			</label>
		</div>
		<input type ="button" value="회원가입" onclick="fnJoin()">
		<!-- <input type="submit" value="보내"> -->
	</form>
</body>
</html>
<script>
	function fnJoin(){
		var form = document.login;
		/* console.log(form.userId); */
		if(form.userId.value ==="" || form.userId.value.length == undefined  ){
			alert("아이디를 입력해주세요.");
			form.userId.focus();
			/* focus() 테두리깜장색 */
			return;
		}
		form.submit();
		/* submit() 보내는거임 */
	}
</script>