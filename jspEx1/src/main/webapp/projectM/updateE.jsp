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

    .container {
        margin: 150px auto; /* Adjusted margin-top to account for header */
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

    .form-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        align-items: center;
    }

     .form-row input[type="text"],
    .form-row input[type="date"]
 	   {
        width: calc(95% - 100px); /* Adjust width to fit next to button */
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        height:41px;
    }
    
    .form-row select {
        width: 200px; /* Adjust width to fit next to button */
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        height:41px;
    }

    button {
        width: 120px; /* Adjust button width */
        padding: 10px;
        background-color: #5cb85c;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        
    }
    
    button:hover {
        background-color: #4cae4c;
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

    .button-group {
        text-align: right;
    }

    .button-group button {
        width: 120px; /* Set width to auto for dynamic width based on text */
       
    }

</style>
</head>
<body>
<header>
    <%@ include file="header.jsp" %>
</header>
<div class="container">
    <form action="updateE_result.jsp" method="get" target="_blank">
        <%@include file="db.jsp"%>
        <%
            ResultSet rs = null;
            Statement stmt = null;
            String c_id = (String)request.getParameter("c_id");
            String s = (String) session.getAttribute("user_grade");
            try {
                stmt = conn.createStatement();
                String querytext = "SELECT * FROM community WHERE c_id ='" + c_id + "'";
                rs = stmt.executeQuery(querytext);
                if(rs.next()){
          %>      
	<div class="form-row">
            <label for="board_type">게시글 유형</label>
        </div>
        <div class="form-row">
            <select id="board_type" name="board_type">
                <option value="<%= rs.getString("board_type") %>"><%= rs.getString("board_type") %></option>
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
 		<input type="hidden" name ="c_id" value="<%= rs.getString("c_id") %>">
	   <div class="form-row">
            <label for="c_title" >제목</label>
        </div>
          <div class="form-row">
        <input type="text" id="c_title" name="c_title" placeholder="제목" style="width:100%;" value="<%= rs.getString("c_title") %>">
        </div>    
          <div class="form-row">
            <label for="c_contents" >내용</label>
        </div>
          <div class="form-row">
        <input type="text" id="c_contents" name="c_contents" placeholder="내용" style="width:100%; height:250px;" value="<%= rs.getString("c_contents") %>" >
       	</div>
         <div class="button-group">
            <button type="submit" value="저장">저장</button>           
            <button type="button" onclick="Back()">취소</button>
        </div>         
                
        <%
                }
            } catch (SQLException ex) {
                out.println("SQLException : " + ex.getMessage());
            }
        %>
        </div>
    </form>
</div>

<script>
function Back() {
    window.history.back();
}
</script>
</body>
</html>