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
		
		String f_id = request.getParameter("f_id");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"UPDATE applications SET clear = 'Y', clear_date = now() WHERE f_id = '" + f_id + "'";
			stmt.executeUpdate(querytext);
				out.println("승인완료.");	
				response.sendRedirect("admin_status_check.jsp");
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>