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
	String user_id = (String) session.getAttribute("user_id");
	String password = (String) session.getAttribute("password");
	out.println(user_id + ", " + password);
 	%>
</body>
</html>