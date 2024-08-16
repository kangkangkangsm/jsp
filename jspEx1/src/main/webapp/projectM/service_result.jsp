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
        
        .container {
            margin: 350px auto;
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
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        
        button:hover {
            background-color: #4cae4c;
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
</style>
</head>
<body>
<header>
<%@ include file="header.jsp" %>
</header>
<%@include file="db.jsp"%>	

	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		String service_type = request.getParameter("service_type");
		String service_title = request.getParameter("service_title");
		String service_contents = request.getParameter("service_contents");
		String sessionId = (String) session.getAttribute("user_id");
				
		try{
			stmt = conn.createStatement();
			String querytext = 
					 "INSERT INTO customer_support (user_id, service_type, service_title, service_contents) " +
							    "VALUES('" + sessionId + "', '" + service_type + "', '" + service_title + "', '" + service_contents + "')";
			stmt.executeUpdate(querytext);
%>			
			<div class="container">
			<h2>문의 완료</h2>
			<button class="Joinbtn" onclick="location.href='main.jsp'">메인페이지 이동</button>
<%	
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>
</html>
<script>
</script>