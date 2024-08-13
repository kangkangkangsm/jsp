<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
        	
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
        }
  h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
 button{
            
            width: 45%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
          	margin: 0 auto;
        }
        .form-row {
        
           
            margin-bottom: 15px;
        }
        
        .form-row label {
            margin-bottom: 5px;
            color: #555;
            width: 100%;
            text-align: left;
        }
        
        .form-row input[type="text"],
        .form-row input[type="password"],
        .form-row input[type="email"],
        .form-row select {
            width: 87%;
            padding: 10px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .form-row .input-group {
            display: flex;
            width: 48%;
        }
        
        .form-row .input-group input[type="text"] {
            width: 70%;
            margin-right: 10px;
        }
        
        .form-row .input-group button {
            width: 30%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
        }
        
        .form-row .input-group button:hover {
            background-color: #4cae4c;
        }
</style>
</head>
<body>
<form action="" name="user">
<%@include file="db.jsp"%>
	<%
		ResultSet rs = null; /* 데이터베이스에서 SELECT 한 결과 집합을 저장할 변수 선언 */ /* INSERT,DELETE,UPDATE는 RS객체가 필요없음 */
		Statement stmt = null; /* SQL 문을 실행하기 위한 Statement 객체 선언 */
		String id = request.getParameter("userId");
		stmt = conn.createStatement(); /* Statement 객체 생성 */
		String query = "SELECT * FROM users WHERE user_id ='" + id + "'";
		rs = stmt.executeQuery(query);
		String pw = request.getParameter("password");
%>		
		<div class="container">
       <div class="form-row">
            <h2>비밀번호 확인</h2>
            <input type="password" id="password" name="password" placeholder="비밀번호 확인">
       </div>
			<button type ="button" onclick="fnUpdateB2('<%= pw %>')">확인</button>
			<button type ="button" onclick="fnclose()">닫기</button>
		</div>
	
</form>
</body>
</html>
<script>
function fnclose() {
	window.close();
	window.opener.fnReload();
}
function fnUpdateB2(password){
	var f = document.user;
	if(f.password.value === password) {{
        window.open("updateB2.jsp?password=" + password, "reset", "width=500,height=230");
    } else {
    	alert("비밀번호 틀렸다");
    	return;
    }
}


</script>