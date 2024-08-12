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
	a:visited, a:link{
		color : black;
		text-decoration: none;
		font-weight : bold;
	}
}
	
</style>

</head>
<body>
	<%@include file="db.jsp"%>	
	<%
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    
    try {
        // 세션에서 user_id 가져오기
        String user_id = (String) session.getAttribute("user_id");
        
        if (user_id != null) {
            String querytext = "SELECT * FROM users WHERE user_id = '" + user_id +"'";
            pstmt = conn.prepareStatement(querytext);
            rs = pstmt.executeQuery();
 %>
            <table>
        		<tr>
        			<th> 번호 </th>
        			<th> 제목 </th>
        			<th> 작성자 </th>
        			<th> 조회수 </th>
        			<th> 작성일 </th>
        		</tr>			

<%
            while (rs.next()) {
%>
        		<tr>
        			<td> <%= rs.getString("user_id") %></td>
        			<td> <%= rs.getString("password") %></td>
        			<td> <%= rs.getString("resident_registration_number") %></td>
        			<td> <%= rs.getString("address") %></td>
        			<td> <%= rs.getString("email") %></td>
        			
        		</tr>
<%
            }
        } else {
            out.println("User ID not found in session.");
        }
            
	
%>
	
	</table>

	<%
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>

</body>
</html>

<script>
	function fnView(boardNo){
		location.href="board-view.jsp?boardNo="+boardNo;
	}
	
	function fnName(boardNo){
		location.href="user-info.jsp?boardNo="+boardNo;
	}
</script>