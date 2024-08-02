<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("userId");
		String[] hobby = request.getParameterValues("hobby");
		for(String h : hobby){
		out.println(h + "<br>");
		}
		
		for(int i=0; i<hobby.length; i++){
			out.println(hobby[i] + "<br>");
		}

		out.println(Arrays.toString(hobby) + "<br>");
		
		out.println(id + "님 환영합니다!");	
	%>
</body>
</html>