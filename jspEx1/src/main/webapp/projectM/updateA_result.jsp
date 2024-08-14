<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone_number = request.getParameter("phone_number");
		String volunteer_region = request.getParameter("volunteer_region");
		String sessionId = (String) session.getAttribute("user_id");
		
		try{
			stmt = conn.createStatement();
			String querytext = "UPDATE users SET " 
			+ "email = '" + email + "', address = '" + address + "', phone_number = '" + phone_number + "', volunteer_region = '" + volunteer_region +"' WHERE user_id ='" + sessionId +"'";
			stmt.executeUpdate(querytext);	
			response.sendRedirect("mypage.jsp");
		
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
​<script>
</script>