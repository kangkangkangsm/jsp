<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	static int sum(int a, int b){
		return a+b;
	}
	void message(){
		System.out.println("안녕!");
	}
	%>
	
	<%
		int a = sum(2,3); // 
		out.println(a);
		message();
	%>
	
	
</body>
</html>