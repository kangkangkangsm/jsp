<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				out.println("로그인 성공.");
				session.setAttribute("user_id", rs.getString("user_id"));
				session.setAttribute("user_grade", rs.getString("user_grade"));
				response.sendRedirect("main.jsp");
			} else {
%>
					
<%
				out.println("아이디 및 비밀번호가 틀립니다.");
%>						
					<div><button onclick="location.href='Mlogin.jsp'">로그인 페이지로 이동</button></div>
				
<%
			}
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>
</html>