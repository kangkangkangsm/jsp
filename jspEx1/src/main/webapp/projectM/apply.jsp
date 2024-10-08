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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .container {
        	margin-top:60px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 70px;
            color: #333;
        }
        
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        
        .form-row label {
            margin-bottom: 5px;
            color: #555;
            width: 48%;
            text-align: left;
        }
        
        .form-row input[type="text"],
        .form-row input[type="password"],
        .form-row input[type="email"],
        .form-row select {
            width: 48%;
            padding: 10px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .form-row .input-group {
            display: flex;
            width: 48%;
        }
        
        .form-row .input-group input[type="text"] {
            width: 70%;
            margin-right: 10px;
        }
        
        .form-row .input-group button {
            width: 30%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
        }
        
        .form-row .input-group button:hover {
            background-color: #4cae4c;
        }
        
        .Joinbtn {
            width: 49%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        
        .Joinbtn:hover {
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
    
     .container4 {
        	margin-top:-40px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        
        .sJoinbtn {
            width: 99%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        
        .sJoinbtn:hover {
            background-color: #4cae4c;
        }
        
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@include file="db.jsp"%>	
<%
String user_id = (String) session.getAttribute("user_id");
String id = request.getParameter("id");
ResultSet rs2 = null;
Statement stmt2 = null;

    stmt2 = conn.createStatement();
    String querytext2 = "SELECT * FROM applications WHERE user_id ='" + user_id +"' AND volunteering_id = '" + id +"' AND clear = 'N'";
    rs2 = stmt2.executeQuery(querytext2);

    if(rs2.next()){
%>
	<div class="container4">	
		<h2>이미 신청한 활동 입니다.</h2>
		<button type="button" class="sJoinbtn" onclick="location.href='participate.jsp'">돌아가기</button>
		</div>
		
<%    	
	return;
    }

if(user_id == null){			
%>			
		<div class="container4">	
		<h2>로그인 하세요</h2>
		<button type="button" class="sJoinbtn" onclick="location.href='Mlogin2.jsp'">로그인 하러 가기</button>
		</div>
<%
	} else {	
		ResultSet rs = null;
		Statement stmt = null;
		
		String sessionId = (String) session.getAttribute("user_id");
		try{
			stmt = conn.createStatement();
			String querytext = 
			 		"INSERT INTO applications(user_id,volunteering_id,application_date) VALUES('" + sessionId + "', '" + id + "', now())";
 			stmt.executeUpdate(querytext);
%>
			<div class="container">
			<h2>신청이 완료되었습니다.</h2>
			<button class="Joinbtn" onclick="location.href='participate.jsp'">계속 보기</button>
			<button class="Joinbtn" onclick="location.href='mypage2.jsp'">마이페이지 에서 확인</button>
		</div>
<%				
		} catch(SQLException ex) {
			System.out.println(sessionId);	

		}}
		
	%>
</body>
</html>
