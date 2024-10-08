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

    .form-row input[type="text"] {
        width: calc(95% - 100px); /* Adjust width to fit next to button */
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
        width: 100%; /* Set width to auto for dynamic width based on text */
       
    }

</style>
</head>
<body>
<header>
    <%@ include file="header.jsp" %>
</header>
<div class="container">
    <form action="" name="board">
        <%@include file="db.jsp"%>
        <%
            ResultSet rs = null;
            Statement stmt = null;
            String c_id = (String)request.getParameter("c_id");
            String sessionId = (String)session.getAttribute("user_id");
            
            try {
                stmt = conn.createStatement();
                String querytext = "SELECT * FROM community WHERE c_id ='" + c_id + "'";
                rs = stmt.executeQuery(querytext);
        %>
        <%
            if (rs.next()) {
        %>
        <h2><%= rs.getString("c_title") %></h2>
        <div class="details">
            <p><strong>작성자:</strong> <%= rs.getString("user_id") %></p>
            <p><strong>유형:</strong> <%= rs.getString("board_type") %></p>
            <p><strong>제목:</strong> <%= rs.getString("c_title") %></p>
            <p><strong>내용:</strong> <%= rs.getString("c_contents") %></p>
            <p><strong>게시일:</strong> <%= rs.getString("c_cdatetime") %></p>    
        </div>
        
        
        
        <div class="form-row">
<%
				if(sessionId == null){			
%>				
					<input type="text" placeholder="로그인 하셔야 글쓰기 가능!" disabled  >
<%
				} else {
%>
            <input type="text" id="dat" name="dat" placeholder="<%= sessionId %> 님의 댓글">
<% 
				}
%>            

            <button type="button" onclick="fnComment('<%= c_id %>')">등록하기</button>
        </div>
        
        
        <%
            querytext = "SELECT * FROM comment WHERE c_id = " + c_id;
            rs = stmt.executeQuery(querytext);
            while(rs.next()) {
			if(sessionId == null){			
%>				
					<div class="comment">
            <p><strong>익명 :</strong> <%= rs.getString("com_contents") %></p>
        </div>
<%
				} else {
%>
        <div class="comment">
            <p><strong><%= rs.getString("session_id") %>님 :</strong> <%= rs.getString("com_contents") %></p>
        </div>
        
<% 
				}
%>            
        
        <%
            }
        %>
        
      
        <div class="button-group">
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
<script>
function fnReload(){ /* 페이지 새로고침 함수 */
	location.reload(); /* 페이지를 새로 고침 */
}
function fnComment(c_id) {
    var dat = document.getElementById('dat').value;
    if (confirm("댓글을 달까요?")) {
        var url = "comment_result.jsp?dat=" + dat + "&c_id=" + c_id;
        window.open(url, "reset", "width=0, height=0");
      
    }
}

</script>
</body>
</html>