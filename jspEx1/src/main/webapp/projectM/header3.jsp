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
        margin-top: 100px; /* Adjust top margin */
        background-color: #ffffff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%; /* Adjust width as needed */
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .form-row {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        gap: 10px; /* Adds space between elements */
    }

    .form-row select,
    .form-row input[type="text"] {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-row select {
        flex: 1; /* Allows select to grow and fill available space */
    }

    .form-row input[type="text"] {
        flex: 2; /* Allows text inputs to grow more than select */
    }

    .form-buttons {
        display: flex;
        justify-content: flex-end; /* Align buttons to the right */
        gap: 10px; /* Space between buttons */
    }

    button,
    input[type="submit"],
    input[type="reset"] {
        width: 100px; /* Fixed width for consistency */
        padding: 10px;
        background-color: #5cb85c;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }


    button:hover,
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #4cae4c;
    }

    input[type="reset"]:hover {
        background-color: #4cae4c;
    }
</style>
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container">
    <form action="community.jsp" method="get"> <!-- action부분 화인해  -->
        <h2>게시판 조회</h2>
	<hr>
        <div class="form-row">
           <select id="board_type" name="board_type">
                <option value="">전체포함</option>
                <option value="자유게시판">자유게시판</option>
                <option value="소식알리기">소식알리기</option>
                <option value="건의합니다">건의합니다</option>
                <option value="요청합니다">요청합니다</option>
            </select>
            <input type="text" id="user_id" name="user_id" placeholder="아이디 검색">
            <input type="text" id="search" name="search" placeholder="통합 검색">
            <input type="submit" value="검색" >
            <input type="reset" value="초기화">
            <button type="button" onclick="fnmove()" value="글쓰기">글쓰기</button>
        </div>
 
    </form>
    </div>
</body>
</html>
<script>

function fnmove(){
	location.href="community_insert.jsp";
}

</script>
  