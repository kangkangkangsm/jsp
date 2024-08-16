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
        background-color: #ffffff;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
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

    .content {
        margin-top: 60px; /* Adjust based on header height */
        width: 100%;
        display: flex;
        justify-content: center;
        padding: 20px;
    }

    .container {
        border-radius: 8px;
        margin-top: 150px;
        background-color: #ffffff;
        padding: 20px 5%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%; /* Adjust width as needed */
    }

    h2 {
        text-align: center;
        margin-bottom: 20px; /* Adjust as needed */
        color: #333;
    }

    .form-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        align-items: center;
    }

    .form-row label {
        width: 19%;
        color: #555;
        text-align: left;
        margin-left: 5px;
    }

    .form-row input[type="text"],
    .form-row input[type="date"],
    .form-row select {
        width: 18%;
        padding: 10px;
        margin-right: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-row input[type="checkbox"],
    .form-row input[type="radio"] {
        margin-right: 5px;
    }

    .form-row label.inline {
        width: auto;
        margin-left: 10px;
    }

       button,
    input[type="submit"],
    input[type="reset"] {
   		float:right;
        justify-content: space-between;
        width: 8%;
        padding: 10px;
        background-color: #5cb85c;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        margin-left:10px;
    }

    button:hover,
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #4cae4c;
    }

   
  </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
 <form action="updateD_result.jsp" name="board">
    <div class="details">
    <%@include file="db.jsp"%>
    <%
        ResultSet rs = null;
        Statement stmt = null;
        String id = request.getParameter("id");
        
        stmt = conn.createStatement();
        String querytext = "SELECT * FROM customer_support WHERE id = '" + id + "'";
        rs = stmt.executeQuery(querytext);
%>
                
 <h2>문의 수정하기</h2>
    <%
        if (rs.next()) {
    %>
		<input type="hidden" name="id" value="<%= rs.getString("id") %>" >
        <!-- First Row -->
        <div class="form-row">
            <label for="board_type">게시글 유형</label>
        </div>
        <div class="form-row">
            <select id="board_type" name="service_type" required>
                <option value="<%= rs.getString("service_type") %>"><%= rs.getString("service_type") %></option>
                <option value="정지 해제">정지 해제</option>
                <option value="봉사 요청">봉사 요청</option>
                <option value="봉사 확인">봉사 확인</option>
                <option value="봉사 취소">봉사 취소</option>
                <option value="문의합니다">문의합니다</option>
            </select>
        </div>
        <div class="form-row">
            <label for="service_title">제목</label>
        </div>
        <div class="form-row">
            <input type="text" value="<%= rs.getString("service_title") %>" id="service_title" name="service_title" placeholder="제목" style="width:100%;">
        </div>    
        <div class="form-row">
            <label for="service_contents">내용</label>
        </div>
        <div class="form-row">
            <input type="text" value="<%= rs.getString("service_contents") %>" id="service_contents" name="service_contents" placeholder="로그인  본인 id 꼭 입력해주세요." style="width:100%; height:250px;">
        </div>   
 <% } %>        
        <button type="button" onclick="history.back()">취소</button>
        <input type="submit" value="수정하기">
    </form>
</div>
</body>
</html>
<script>
</script>