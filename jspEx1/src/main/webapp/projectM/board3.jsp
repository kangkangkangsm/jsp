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
            
            width: 49%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        
         .xbutton {
            
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
        .xbutton:hover {
            background-color: #F4F4F4;
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
         .comment {
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 10px;
        margin-bottom: 10px;
        background-color: #fafafa;
    }
    
    .comment p {
        margin: 0;
        font-size: 14px;
        color: #333;
    }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
 <form action="" name="board">
    <div class="details">
    <%@include file="db.jsp"%>
    <%
        ResultSet rs = null;
        Statement stmt = null;
        String id = request.getParameter("id");
        
        stmt = conn.createStatement();
        String querytext = "SELECT * FROM customer_support WHERE id = '" + id + "'";
        rs = stmt.executeQuery(querytext);
          
        if (rs.next()) {
    %>
    <h2><%= rs.getString("service_type") %></h2>
        <p><strong>작성자:</strong> <%= rs.getString("user_id") %></p>
        <p><strong>문의 유형:</strong> <%= rs.getString("service_type") %></p>
        <p><strong>작성일:</strong> <%= rs.getString("submission_date") %></p>
        <p><strong>진행상황:</strong> <%= rs.getString("status") %></p>
        <p><strong>문의 제목:</strong> <%= rs.getString("service_title") %></p>
        <p><strong>문의 내용:</strong> <%= rs.getString("service_contents") %></p>

    </div>
   <% } %> 
   <%     
    querytext = "SELECT * FROM service_comment WHERE id = " + id;
            rs = stmt.executeQuery(querytext);
  while(rs.next()) {
	
	%>  
	<div class="comment">
            <p><strong>관리자 답변 :</strong> <%= rs.getString("com_contents") %></p>
        </div>
	<% } %>
   <button type="button" class="xbutton" onclick="history.back()">돌아가기</button>
    </form>
</div>
</body>
</html>
<script>
</script>