



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	div {
		margin-top : 5px;
	}
</style>
</head>
<body>
	<div>
		<button onclick="location.href='board-list2.jsp'">게시판으로 이동</button>
	</div>
		<table>
		<tr>
			<th> 아이디 </th>
			<th> 이름 </th>
			<th> 권한 </th>
			<th> 초기화 </th>
		</tr>
		
	<%@include file="db.jsp"%>	
<%
	ResultSet rs = null;
	Statement stmt = null;
	System.out.println(session.getAttribute("userId"));
	try{
		stmt = conn.createStatement();
		String querytext = 
				"SELECT * FROM TBL_USER";
		rs = stmt.executeQuery(querytext);
		
		while(rs.next()){
			String status = rs.getString("status").equals("A") ? "관리자" : "일반회원" ;
%>

		<tr>
			<td><%= rs.getString("userID")%></td>
			<td><%= rs.getString("name")%></td>
			<td><%= status %></td>
			<td>
<%			
				if(rs.getInt("cnt") >=5){
%>
			<button onclick ="fnReset('<%= rs.getString("userId") %>')">초기화</button>
<%				
				}
%>			
			</td>
		</tr>
<%
		}
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
%>	
</table>
</body>
</html>
<script>
			function fnReset(userId){
			/* location.href="cnt-reset.jsp?userId="+userId; */
				window.open("cnt-reset.jsp?userId="+userId,"reset","width=500, height=200");
			}
			
			function fnReload(){
				location.reload();
			}
</script>