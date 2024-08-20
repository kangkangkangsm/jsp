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
		String c_id = request.getParameter("c_id");
		String board_type = request.getParameter("board_type");
		String c_title = request.getParameter("c_title");
		String c_contents = request.getParameter("c_contents");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"UPDATE community SET " 
					+ "board_type = '" + board_type + "', c_title = '" + c_title + "', c_contents = '" + c_contents + "' WHERE c_id ='" + c_id +"'";
			stmt.executeUpdate(querytext);
			response.sendRedirect("community_board.jsp?c_id=" + c_id);
		
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
​<script>
</script>