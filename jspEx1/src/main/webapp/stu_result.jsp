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
		String id = request.getParameter("userId");
		ResultSet rs = null; /* 결과값 반환을 받을 객체 */
		Statement stmt = null; /* db연결 객체 */
	/* 	boolean flg = true; */		
		try{
			stmt = conn.createStatement();
			/* String querytext = "select * from student"; */
			String querytext = "select * from student where stu_no = " + id ;
			rs = stmt.executeQuery(querytext);
			if(rs.next()){
				out.println(rs.getString("stu_name") + "\t" + rs.getString("stu_no") + "\t" + rs.getString("stu_dept") + "\t" + rs.getString("stu_gender") + "<br>");
			} else {
				out.println("해당 학생이 존재하지 않습니다.");
			}
	/* 		while (rs.next()) {
				if(rs.getString("stu_no").equals(id)){
				out.println(rs.getString("stu_name") + "\t" + rs.getString("stu_no") + "\t" + rs.getString("stu_dept") + "\t" + rs.getString("stu_gender") + "<br>");
				flg=false;
				break;
				} 
			}
			if(flg){
				out.println("해당 학생이 존재하지 않습니다.");
			}
	 */
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>