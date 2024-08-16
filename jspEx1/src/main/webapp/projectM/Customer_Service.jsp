<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고센...</title>
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
<%@ include file="db.jsp" %>

<%
    String s = (String) session.getAttribute("user_grade");
%>

<div class="container">
    <form action="service_result.jsp" method="get" target="_blank">
        <h2>고객센터</h2>

        <!-- First Row -->
        <div class="form-row">
            <label for="board_type">게시글 유형</label>
        </div>
        <div class="form-row">
            <select id="board_type" name="service_type" required>
                <option value="">::선택하세요::</option>
                <option value="아이디 정지 풀어주세요">아이디 정지 풀어주세요</option>
                <option value="봉사활동이 필요한곳이 있어요!">봉사활동이 필요한곳이 있어요!</option>
                <option value="봉사활동 신청한거 확정좀 해주세요!">봉사활동 신청한거 확정좀 해주세요!</option>
                <option value="문의합니다">문의합니다</option>
            </select>
        </div>
        <div class="form-row">
            <label for="service_title">제목</label>
        </div>
        <div class="form-row">
            <input type="text" id="service_title" name="service_title" placeholder="제목" style="width:100%;">
        </div>    
        <div class="form-row">
            <label for="service_contents">내용</label>
        </div>
        <div class="form-row">
            <input type="text" id="service_contents" name="service_contents" placeholder="로그인  본인 id 꼭 입력해주세요." style="width:100%; height:250px;">
        </div>    
        <button type="button" onclick="history.back()">취소</button>
        <input type="submit" value="문의하기">
    </form>
</div>
</body>
</html>
  