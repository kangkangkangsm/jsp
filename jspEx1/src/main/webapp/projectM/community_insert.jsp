<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤 추가하기</title>
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
     .container4 {
        	margin-top:360px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

    button:hover,
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #4cae4c;
    }

    .sbutton {
        width: 100%;
        padding: 10px;
        background-color: #5cb85c;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }
  
    .sbutton:hover {
        background-color: #4cae4c;
    }
            .footer {
            text-align: center;
            padding: 10px;
            background-color: #009688;
            color: #fff;
            margin-top: 20px;
            width:100%;
        }  
  </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="db.jsp" %>

<%
    String s = (String) session.getAttribute("user_grade");
    String user_id = (String) session.getAttribute("user_id");
	
    if(user_id == null){			
%>			
			<div class="container4">	
			<h2 style="margin-bottom: 70px; margin-top: 30px;">로그인 하세요</h2>
			<button class="sbutton" type="button" onclick="location.href='Mlogin.jsp'">로그인 하러 가기</button>
			</div>
<%
		} else {			
    
%>
<div class="container">
    <form action="community_insert_result.jsp" method="get" target="_blank">
        <h2>글쓰기</h2>

        <!-- First Row -->
        <div class="form-row">
            <label for="board_type">게시글 유형</label>
        </div>
        <div class="form-row">
            <select id="board_type" name="board_type" required>
                <option value="">전체포함</option>
                <option value="자유게시판">자유게시판</option>
                <option value="소식알리기">소식알리기</option>
                <option value="건의합니다">건의합니다</option>
                <option value="요청합니다">요청합니다</option>
<%    
            if ("관리자".equals(s)) {
%>
               <option value="공지사항">공지사항</option>
<%
            }
%>
            </select>
        </div>
        <div class="form-row">
            <label for="c_title">제목</label>
        </div>
        <div class="form-row">
            <input type="text" id="c_title" name="c_title" placeholder="제목" style="width:100%;">
        </div>    
        <div class="form-row">
            <label for="c_contents">내용</label>
        </div>
        <div class="form-row">
            <input type="text" id="c_contents" name="c_contents" placeholder="내용" style="width:100%; height:250px;">
        </div>    
        <button type="button" onclick="history.back()">취소</button>
        <input type="submit" value="저장">
        <%} %>
    </form>
</div>
</body>
</html>
  