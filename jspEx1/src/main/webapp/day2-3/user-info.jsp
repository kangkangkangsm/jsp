
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
		String boardNo = request.getParameter("boardNo"); 
		
		stmt = conn.createStatement(); 
		String querytext = "SELECT * FROM TBL_BOARD B INNER JOIN TBL_USER U ON B.userId = U.userId WHERE BOARDNO = " + boardNo; 
		rs = stmt.executeQuery(querytext); 
		
		if(rs.next()){
%>		
			<div> 아이디 : [ <%= rs.getString("userId") %> ] 이름 : [ <%= rs.getString("name") %> ] 권한 : [ <%= rs.getString("status") %> ] </div>
<%	
		}
%>
</body>
</html>