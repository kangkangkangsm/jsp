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
					"DELETE FROM customer_support WHERE id = '" + id + "'";
			stmt.executeUpdate(querytext);
				out.println("삭제완료.");	
				response.sendRedirect("mypage4.jsp");
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>
</html>