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
		
		String c_id = request.getParameter("c_id");
		
				
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"UPDATE community SET c_hidden ='Y' WHERE c_id = '" + c_id + "'";
			stmt.executeUpdate(querytext);
				out.println("숨기기완료.");	
				response.sendRedirect("community.jsp");
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>
</html>