<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
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
			out.println("회원가입 완료되었습니다!");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>