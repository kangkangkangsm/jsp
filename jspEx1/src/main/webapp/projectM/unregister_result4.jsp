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
		
		String user_id = request.getParameter("user_id");
		
				
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"DELETE FROM users WHERE user_id = '" + user_id + "'";
			stmt.executeUpdate(querytext);
				out.println("삭제완료.");	
				response.sendRedirect("admin_Member.jsp");
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>