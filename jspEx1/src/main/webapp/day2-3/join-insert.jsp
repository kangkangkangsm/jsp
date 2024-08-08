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
		Statement stmt = null; /* SQL 문을 실행하기 위한 Statement 객체 선언 */
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
	 	
		stmt = conn.createStatement(); /* Statement 객체 생성 */
		String query = "INSERT INTO TBL_USER(userId,pwd,name) VALUES('"+ id + "','" + pwd + "','" + name + "');";
		stmt.executeUpdate(query);
			if(id.equals("") || pwd.equals("") || name.equals("") ){
				out.println("입력 안한곳 있음!");
			}else{
				out.println("성공!");
			}
%>
		
			
		
</body>
</html>