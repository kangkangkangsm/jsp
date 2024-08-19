<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}
header {
    width: 100%;
    background-color: #333;
    color: #fff;
    padding: 10px 0;
    text-align: center;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
}
.container {
    margin: 300px auto 20px auto; /* Adjusted margin-top to account for header */
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 80%;
    max-width: 400px;
}
h2 {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
}
button {
    width: 100%;
    padding: 10px;
    background-color: #00BFFF;
    border: none;
    border-radius: 4px;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    margin-top: 20px;
}
button:hover {
    background-color: #1E90FF;
}
</style>
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
		String mn_people = request.getParameter("mn_people");
		System.out.println(region +", " + contents);		
		try{
			stmt = conn.createStatement();
					String querytext = 
							 "INSERT INTO Volunteering(region, activity_type, field, target_group, recruitment_status, start_date, end_date, title, contents, mn_people, cdatetime)"
							 + " VALUES('"+ region +"','"+ activity_type +"','"+ field +"','"
							 + target_group +"','"+ recruitment_status +"','"+ start_date +"','"
							 + end_date +"','"+ title +"','"+ contents +"','"+ mn_people +"', NOW())";  
			stmt.executeUpdate(querytext);
%>
			<div class="container">
			<h2>추가 완료</h2>
			<button onclick="location.href='admin_participate.jsp'">닫기</button>
		</div>
				
<%			
			} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
%>
</body>
</html>