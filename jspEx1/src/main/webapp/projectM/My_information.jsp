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
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }
    .Jbutton {
        width: 8%;
        padding: 10px;
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        float:right;
        margin-left:5px;
        margin-top:-50px;
        margin-bottom:0px;
    }

    button:hover {
        background-color: #1E90FF;
    }
            .footer {
            text-align: center;
            padding: 10px;
            background-color: #009688;
            color: #fff;
            margin-top: 20px;
            width:100%;
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
         a {
            text-decoration: none; /* 밑줄 제거 */
            color: black; /* 링크 색상 검정으로 설정 */
        }
        a:hover {
            text-decoration: none; /* 마우스 오버 시 밑줄 제거 */
            color: black; /* 마우스 오버 시 링크 색상 검정으로 유지 */
        }
        a:visited {
            color: black; /* 방문한 링크 색상 검정으로 유지 */
        }
        
         .disabled {
        color: #a9a9a9; /* 회색 텍스트 색상 */
        text-decoration: none; /* 밑줄 제거 */
        cursor: not-allowed; /* 비활성화된 커서 */
        pointer-events: none; /* 클릭 이벤트 차단 */
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
        String user_id = request.getParameter("id");
        
        
        
        ResultSet rs5 = null;
        Statement stmt5 = null;
    
            stmt5 = conn.createStatement();
            String querytext5 = "SELECT COUNT(*) CNT FROM applications A "
                    + "INNER JOIN volunteering V ON A.volunteering_id = V.id "
                    + "WHERE A.user_id ='" + user_id + "' AND clear = 'N'";
            rs5 = stmt5.executeQuery(querytext5);

        ResultSet rs6 = null;
        Statement stmt6 = null;
    
            stmt6 = conn.createStatement();
            String querytext6 = "SELECT COUNT(*) CNT FROM applications A "
                    + "INNER JOIN volunteering V ON A.volunteering_id = V.id "
                    + "WHERE A.user_id ='" + user_id + "' AND clear = 'Y'";
            rs6 = stmt6.executeQuery(querytext6);

        ResultSet rs7 = null;
        Statement stmt7 = null;
    
            stmt7 = conn.createStatement();
            String querytext7 = "SELECT COUNT(*) CNT FROM community WHERE user_id = '" + user_id +"'";
            rs7 = stmt7.executeQuery(querytext7);
            
         ResultSet rs8 = null;
         Statement stmt8 = null;
        
             stmt8 = conn.createStatement();
             String querytext8 = "SELECT COUNT(*) CNT FROM customer_support WHERE user_id = '" + user_id +"'";
             rs8 = stmt8.executeQuery(querytext8);
             
             ResultSet rs9 = null;
             Statement stmt9 = null;
         
                 stmt9 = conn.createStatement();
                 String querytext9 = "SELECT * FROM applications A "
                         + "INNER JOIN volunteering V ON A.volunteering_id = V.id "
                         + "WHERE A.user_id ='" + user_id + "' AND clear = 'N'";
                 rs9 = stmt9.executeQuery(querytext9);

             ResultSet rs10 = null;
             Statement stmt10 = null;
         
                 stmt10 = conn.createStatement();
                 String querytext10 = "SELECT * FROM applications A "
                         + "INNER JOIN volunteering V ON A.volunteering_id = V.id "
                         + "WHERE A.user_id ='" + user_id + "' AND clear = 'Y'";
                 rs10 = stmt10.executeQuery(querytext10);
        
             ResultSet rs11 = null;
             Statement stmt11 = null;
                 
                 stmt11 = conn.createStatement();
                 String querytext11 = "SELECT * FROM customer_support WHERE user_id = '" + user_id + "'";
                 rs11 = stmt11.executeQuery(querytext11);
                 
                 ResultSet rs12 = null;
                 Statement stmt12 = null;
             
                     stmt12 = conn.createStatement();
                     String querytext12 = "SELECT * FROM community WHERE user_id = '" + user_id +"'";
                     rs12 = stmt12.executeQuery(querytext12);
                 
                 
        if (user_id == null || user_id.isEmpty()) {
            out.println("로그인부터 해주세요.");
            return;
        }
        
        try {
            stmt = conn.createStatement();
            String querytext = "SELECT * FROM users WHERE user_id = '" + user_id +"'";
            rs = stmt.executeQuery(querytext);
            ResultSet rs3 = null;
            Statement stmt3 = null;
        
           
            
    %>
    <%
        if (rs.next()) {
        	
    %>
    <h2>회원 정보</h2>
    <div class="details">
        <p><strong>이름 :</strong> <%= rs.getString("name") %></p>
        <p><strong>아이디 :</strong> <%= rs.getString("user_id") %></p>
        <p><strong>주민등록번호 :</strong> <%= rs.getString("resident_registration_number") %></p>
        <p><strong>이메일 :</strong> <%= rs.getString("email") %></p>
        <p><strong>주소 :</strong> <%= rs.getString("address") %></p>
        <p><strong>전화번호 :</strong> <%= rs.getString("phone_number") %></p>
        <p><strong>성별 :</strong> <%= rs.getString("gender") %></p>
        <p><strong>봉사 희망지역 :</strong> <%= rs.getString("volunteer_region") %></p>
        <p><strong>유저등급 :</strong> <%= rs.getString("user_grade") %></p>
        <p><strong>가입일 :</strong> <%= rs.getString("created_at") %></p>
    <hr>    

	<% } %>        
	<%if(rs5.next()){ %>
		<p><strong>봉사신청 (<%= rs5.getString("CNT") %>)</strong></p>
    <% } %> 
    <%while(rs9.next()){ %>
    	<ol>
    	<a href="admin_board.jsp?id=<%= rs9.getString("id") %>"><strong style="width: 250px"><%= rs9.getString("field") %></strong><%= rs9.getString("title") %></a>
    	</ol>
    <% } %>	
    <%if(rs7.next()){ %>
        <p><strong>게시글 (<%= rs7.getString("CNT") %>)</strong></p>
    <% } %>  
    <% while(rs12.next()){ %>
    	<ol>
    	<a href="admin_community_board.jsp?c_id=<%= rs12.getString("c_id") %>"><strong style="width: 250px"><%= rs12.getString("board_type") %></strong><%= rs12.getString("c_title") %></a>
    	</ol>
    <% } %>	
    <%if(rs8.next()){ %>
        <p><strong>문의 (<%= rs8.getString("CNT") %>)</strong></p>
    <% } %>
    <% while(rs11.next()){ %>
    	<ol>
    	<a href="board6.jsp?id=<%= rs11.getString("id") %>"><strong style="width: 250px"><%= rs11.getString("service_type") %></strong><%= rs11.getString("service_contents") %></a>
    	</ol>
    <% } %>	
    <%if(rs6.next()){ %>
        <p><strong>봉사완료 (<%= rs6.getString("CNT") %>)</strong></p>
    <% } %>
     <%while(rs10.next()){ %>
    	<ol>
    	<a href="admin_board.jsp?id=<%= rs10.getString("id") %>"><strong style="width: 250px"><%= rs10.getString("field") %></strong><%= rs10.getString("title") %></a>
    	</ol>
    <% } %>	
    </div>
        
 <button type="button" onclick="history.back()">돌아가기</button>

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
	
</script>