<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
<style>

  h2 {
            text-align: center;
            margin-bottom: 70px;
            color: #333;
        }
 button{
            display: block;
            width: 30%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
          	margin: 0 auto;
        }
</style>
</head>
<body>
	<%@include file="db.jsp"%>
	<%
		String name = request.getParameter("name");
		String user_id = request.getParameter("user_id");	
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String resident_registration_number = request.getParameter("resident_registration_number");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phone_number");
		String gender = request.getParameter("gender");
		String volunteer_region = request.getParameter("volunteer_region");
		String desired_activity = request.getParameter("desired_activity");
		String special_skills = request.getParameter("special_skills");
		
		ResultSet rs = null;
		Statement stmt = null;	
		
		try{
			stmt = conn.createStatement();
			String query = 
				    "INSERT INTO users(name, user_id, password, gender, resident_registration_number, address, phone_number, email, volunteer_region, desired_activity, special_skills) VALUES ("
				            + "'" + name + "'," 
				            + "'" + user_id + "'," 
				            + "'" + password + "'," 
				            + "'" + gender + "',"
				            + "'" + resident_registration_number + "'," 
				            + "'" + address + "'," 
				            + "'" + phone_number + "'," 
				            + "'" + email + "',"
				            + "'" + volunteer_region + "'," 
				            + "'" + desired_activity + "'," 
				            + "'" + special_skills + "')";
			stmt.executeUpdate(query);
%>
			<h2>축하축하!! 회원가입 완료!</h2>
			<button onclick="location.href='Mlogin.jsp'">로그인</button>
<% 			
		} catch(SQLException ex) {
			out.println("중복된 아이디로 가입하지 말라고");
		}
	        
	%>
</body>
</html>
<script>
</script>

