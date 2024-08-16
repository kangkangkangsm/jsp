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
		String service_type = request.getParameter("service_type");
		String id = request.getParameter("id");
		String service_title = request.getParameter("service_title");
		String service_contents = request.getParameter("service_contents");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"UPDATE customer_support SET " 
					+ "service_type = '" + service_type + "', service_title = '" + service_title + "', service_contents = '" + service_contents + "' WHERE id ='" + id +"'";
			stmt.executeUpdate(querytext);
			response.sendRedirect("mypage4.jsp");
		
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
​<script>
</script>