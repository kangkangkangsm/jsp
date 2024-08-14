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
            
            width: 49%;
            padding: 10px;
            background-color: #C0CECB;
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
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            out.println("잘못된 접근입니다.");
            return;
        }
        
        try {
            stmt = conn.createStatement();
            String querytext = "SELECT * FROM volunteering WHERE id = " + id;
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
    </div>
    <div>
   <% 
     if ("모집중".equals(rs.getString("recruitment_status"))) {
                    %>                        
    <button type="button" onclick="fnapply(<%= id %>)">신청하기</button>
                    <% 
                    }else{
                    %>	
    <button class="xbutton" onclick="return false;" disabled>모집완료</button>              	
                    <%
                    }
                    %>
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
		if (confirm("신청 하시나요?")) {
		 window.location.href = "apply.jsp?id=" + id;
	}
	}
</script>