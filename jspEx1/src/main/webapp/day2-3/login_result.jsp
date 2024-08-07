<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
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

}
	
</style>

</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
				
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT * FROM TBL_USER WHERE userId = '" + id + "' AND pwd = '" + pwd + "'";
			System.out.println(querytext);
			rs = stmt.executeQuery(querytext);
			
			
			if(rs.next()){
				//5번이상 실패 
				if(rs.getInt("cnt") >=5){
					out.println("5번이상 실패했으니깐 관리자한테 문의해여");
				} else {
				//로그인 성공
				session.setAttribute("userId", rs.getString("userId"));
				session.setAttribute("status", rs.getString("status"));
			
				if(rs.getString("status").equals("A")){
						response.sendRedirect("user-list.jsp");
					} else {
						response.sendRedirect("board-list2.jsp");
					}
				}
			} else {
				out.println("아이디/비밀번호 다시 확인하세요.");
				querytext = "SELECT * FROM TBL_USER WHERE userId = '" + id + "' ";
				rs = stmt.executeQuery(querytext);
				if(rs.next()){
					if(rs.getInt("cnt") >=5){
						out.println("5번이상 실패했으니까 관리자한테 문의하셈");
					}else{
						out.println("비밀번호 확인하셈!!");
						querytext = "UPDATE TBL_USER SET cnt = cnt+1 WHERE userId = '" + id + "'";
						stmt.executeUpdate(querytext);
					}
					
				}else{
					// 없는 id로 로그인 시도 
					out.println("아이디 확인하셈!");
				}
				
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
	<div>
	<button onclick="location.href='login.jsp'">로그인 페이지로 이동</button>
	</div>
</body>
</html>