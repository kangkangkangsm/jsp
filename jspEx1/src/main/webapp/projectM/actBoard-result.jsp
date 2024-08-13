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
		String region = request.getParameter("region");
		String activity_type = request.getParameter("activity_type");
		String field = request.getParameter("field");
		String target_group = request.getParameter("target_group");
		String recruitment_status = request.getParameter("recruitment_status");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
				
		try{
			stmt = conn.createStatement();
					String querytext = 
				    "INSERT INTO Volunteering "  
				    + "(region, activity_type, field, target_group, " 
				    + "recruitment_status, start_date, end_date, title, cdatetime, contents) "
				    + "VALUES ('" + region + "', '" + activity_type + "', '" + field + "', '" + target_group + "', '"
				    + recruitment_status + "', '" + start_date + "', '" + end_date + "', '" + title + "', NOW(), '" + contents + "')";
			stmt.executeUpdate(querytext);
%>
			<div class="container">
			<h2>추가 완료</h2>
			<button onclick="location.href='actBoard.jsp'">닫기</button>
		</div>
				
<%			
			} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
%>
</body>
</html>