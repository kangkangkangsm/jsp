<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        
        h3 {
            text-align: center;
            color: #333;
            margin-bottom: -10px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        
        .form-row {
        
           
            margin-bottom: 15px;
        }
        
        .form-row label {
            margin-bottom: 5px;
            color: #555;
            width: 100%;
            text-align: left;
        }
        
        .form-row input[type="text"],
        .form-row input[type="password"],
        .form-row input[type="email"],
        .form-row select {
            width: 100%;
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
    </style>
</head>
<header>
 <%@ include file = "header.jsp" %>
</header>
<body>
<%@include file="db.jsp"%>	

     <div class="container">
     	<h3>[ 회원탈퇴 ]</h3>
        <h2>아이디 비밀번호 입력</h2>
        <form action="unregister_result.jsp" method="post">
    <div class="form-row">
        <input type="text" id="user_id" name="user_id" placeholder="아이디" required>
    </div>
    <div class="form-row">
        <input type="password" id="password" name="password" placeholder="비밀번호" required>
    </div>
    <button type="submit" class="Joinbtn">회원 탈퇴</button>
    <button class="Joinbtn" onclick="history.back()">아니요</button>
</form>
    </div>
</body>
</html>
<script>
	
function fnComment(c_id) {
    var dat = document.getElementById('dat').value;
    if (confirm("댓글을 달까요?")) {
        var url = "comment_result.jsp?dat=" + dat + "&c_id=" + c_id;
        window.open(url, "reset", "width=500, height=500");
      
    }	

</script>