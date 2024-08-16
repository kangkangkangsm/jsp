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
		
		String id = request.getParameter("id");

		try{
			stmt = conn.createStatement();
			String querytext = 
					"UPDATE customer_support SET status = '답변완료' WHERE id = '" + id + "'";
			stmt.executeUpdate(querytext);
				out.println("변경완료.");	
				response.sendRedirect("admin_service.jsp");
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>