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
        	ol:hover {
    background-color: #ddd; /* 행에 마우스 오버 시 배경색 */
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
        	 ResultSet rs11 = null;
 	        Statement stmt11 = null;
 	        stmt11 = conn.createStatement();
 	        String querytext11 = "SELECT COUNT(*) AS CNT FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id WHERE V.id = '" + rs.getString("id") + "'";
 	        rs11 = stmt11.executeQuery(querytext11);
 	     
 	        if (rs11.next()) {
    %>
    <h2><%= rs.getString("field") %></h2>
    <div class="details">
        <p><strong>봉사지역:</strong> <%= rs.getString("region") %></p>
        <p><strong>활동구분:</strong> <%= rs.getString("activity_type") %></p>
        <p><strong>봉사분야:</strong> <%= rs.getString("field") %></p>
        <p><strong>봉사대상:</strong> <%= rs.getString("target_group") %></p>
        <p><strong>봉사시작일:</strong> <%= rs.getString("start_date") %></p>
        <p><strong>봉사종료일:</strong> <%= rs.getString("end_date") %></p>
       <%        
       if(rs11.getInt("CNT") == rs.getInt("mn_people")){
%>        
        <p><strong>모집상태:</strong>모집완료</p>
<% } else { %>
		<p><strong>모집상태:</strong> <%= rs.getString("recruitment_status") %></p>
<%} %>
        <p><strong>제목:</strong> <%= rs.getString("title") %></p>
        <p><strong>내용:</strong> <%= rs.getString("contents") %></p>
<%
ResultSet rs2 = null;
Statement stmt2 = null;
stmt2 = conn.createStatement();
String querytext2 = "SELECT * FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id WHERE V.id = '" + rs.getString("id") + "' AND clear = 'N'";
rs2 = stmt2.executeQuery(querytext2);
%>
<%
  ResultSet rs3 = null;
        Statement stmt3 = null;
        stmt3 = conn.createStatement();
        String querytext3 = "SELECT COUNT(*) AS CNT FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id WHERE V.id = '" + rs.getString("id") + "' AND clear = 'N'";
        rs3 = stmt3.executeQuery(querytext3);
%>    
<%
ResultSet rs4 = null;
Statement stmt4 = null;
stmt4 = conn.createStatement();
String querytext4 = "SELECT * FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id WHERE V.id = '" + rs.getString("id") + "' AND clear = 'Y'";
rs4 = stmt4.executeQuery(querytext4);
%>
<%
  ResultSet rs5 = null;
        Statement stmt5 = null;
        stmt5 = conn.createStatement();
        String querytext5 = "SELECT COUNT(*) AS CNT FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id WHERE V.id = '" + rs.getString("id") + "' AND clear = 'Y'";
        rs5 = stmt5.executeQuery(querytext5);
%>        
<hr>
<%
  if(rs3.next()){
%>            
	<p><strong>참여희망(<%= rs3.getString("CNT") %>명)</strong></p>
<%
  }
while(rs2.next()) {
%>	
<ol><p><a href="My_information.jsp?id=<%= rs2.getString("user_id") %>"><strong><%= rs2.getString("user_id") %> : </strong><%= rs2.getString("status") %> [ 신청일 : <%= rs2.getString("application_date") %> ] </a></p></ol>
<%	
}
%>  
<hr>
    
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
        }} catch (SQLException ex) {
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