<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}
	
</style>
</head>
<body>
	<table>
		<tr>
			<th>게시번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>아이디</th>
		</tr>
		<c:forEach var="user" items="${boardList}">
			<tr>
				<td>${user.boardNo}</td>
				<td>${user.title}</td>
				<td>${user.contents}</td>
				<td>${user.userId}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>