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
		ResultSet rs = null; /* 데이터베이스에서 SELECT 한 결과 집합을 저장할 변수 선언 */ /* INSERT,DELETE,UPDATE는 RS객체가 필요없음 */
		Statement stmt = null; /* SQL 문을 실행하기 위한 Statement 객체 선언 */
		String id = request.getParameter("userId");
		stmt = conn.createStatement(); /* Statement 객체 생성 */
		String query = "SELECT * FROM TBL_USER WHERE userId ='" + id + "'";
		rs = stmt.executeQuery(query);
		
	    if(rs.next()){
	        out.println("중복된 아이디");
	    } else {
	        out.println("사용 가능");
	    }
	%>
	

</body>
</html>
<script>
</script>