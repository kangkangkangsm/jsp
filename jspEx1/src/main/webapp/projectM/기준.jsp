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
		
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("password");
				
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT * FROM users WHERE user_id = '" + id + "' AND password = '" + pwd + "'";
			System.out.println(querytext);
			rs = stmt.executeQuery(querytext);
			
			
			if(rs.next()){
			
			} else {
%>

				 <div class="container">
        		<div><h2>아이디 및 비밀번호를 확인해주세요.</h2></div>					
				<button id="btn" onclick="location.href='Mlogin.jsp'">로그인 페이지로 이동</button>
				</div>
<%
			}
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>
</html>