<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			String id = request.getParameter("userId");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("userName");
		 
			if(id.equals("test") && pwd.equals("1234")){
				out.println("회원가입 성공!");
			}else{
				out.println("실패!");
			}
		%>
		
			
		
</body>
</html>