<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<%
		session.removeAttribute("user_id");
		session.removeAttribute("password");
		session.removeAttribute("user_grade");
		response.sendRedirect("main.jsp");
	%>
</body>
</body>
</html>