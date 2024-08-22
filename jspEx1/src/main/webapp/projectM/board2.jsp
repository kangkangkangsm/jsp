<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        * {
            box-sizing: border-box;
        }
        
        body {
        	
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        .container {
            margin: 150px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
        }
        
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        
        .details {
            margin-bottom: 20px;
        }
        
        .details p {
            margin: 10px 0;
            font-size: 16px;
            color: #555;
        }
        
        .details strong {
            display: inline-block;
            width: 150px;
            color: #333;
        }
        
       
        
        button {
            
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        
        button:hover {
            background-color: #4cae4c;
        }
        
        header {
            width: 100%;
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
 <form action="" name="board">
    <%@include file="db.jsp"%>
    <%
        ResultSet rs = null;
        Statement stmt = null;
        String f_id = request.getParameter("f_id");
        
        try {
            stmt = conn.createStatement();
            String querytext = "SELECT * FROM users U "
                    + "INNER JOIN applications A ON U.user_id = A.user_id "
                    + "INNER JOIN volunteering V ON A.volunteering_id = V.id "
                    + "WHERE f_id = '" + f_id + "'";
            rs = stmt.executeQuery(querytext);
    %>
    <%
        if (rs.next()) {
    %>
    <h2><%= rs.getString("field") %></h2>
    <div class="details">
        <p><strong>봉사지역:</strong> <%= rs.getString("region") %></p>
        <p><strong>활동구분:</strong> <%= rs.getString("activity_type") %></p>
        <p><strong>봉사분야:</strong> <%= rs.getString("field") %></p>
        <p><strong>봉사대상:</strong> <%= rs.getString("target_group") %></p>
        <p><strong>봉사시작일:</strong> <%= rs.getString("start_date") %></p>
        <p><strong>봉사종료일:</strong> <%= rs.getString("end_date") %></p>
        <p><strong>모집상태:</strong> <%= rs.getString("recruitment_status") %></p>
        <p><strong>제목:</strong> <%= rs.getString("title") %></p>
        <p><strong>내용:</strong> <%= rs.getString("contents") %></p>
    
    <%
ResultSet rs4 = null;
Statement stmt4 = null;
stmt4 = conn.createStatement();
String querytext4 = "SELECT * FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id "
+ "WHERE V.id = '" + rs.getString("id") + "' AND A.user_id = '" + rs.getString("user_id") + "' AND clear = 'Y'";
System.out.println(querytext4);
rs4 = stmt4.executeQuery(querytext4);


while(rs4.next()) {
%>	
<p><strong>봉사 완료일 : </strong>  <strong><%= rs4.getString("clear_date") %></strong> </p>
<%	
}
%>
</div>
<div>
    <button type="button" onclick="history.back()">돌아가기</button>
    </div>
    <%
        } else {
            out.println("게시글을 찾을 수 없습니다.");
        }
    %>
    <%
        } catch (SQLException ex) {
            out.println("SQLException : " + ex.getMessage());
        }
    %>
    </form>
</div>
</body>
</html>
<script>
	function fnapply(id){
		 window.location.href = "apply.jsp?id=" + id;
	}
</script>