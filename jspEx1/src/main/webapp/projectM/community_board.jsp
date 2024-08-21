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
    
    .sbutton {
        width: 120px;
        padding: 10px;
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }
    .sbutton:hover {
        background-color: #1E90FF;
    }
    
        .csbutton {
        width: 60px;
        padding: 3px;
        background-color: #FF5733;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 13px;
        cursor: pointer;
        margin:-5px 0;
    }
         .csbutton:hover {
        background-color: #C70039;
    }
 
       .sbutton:hover {
        background-color: #1E90FF;
    }
    
        .cs2button {
        width: 60px;
        padding: 3px;
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 13px;
        cursor: pointer;
        margin:-5px 0;
    }
    
    .cs2button:hover {
        background-color: #1E90FF;
    }
    .dbutton {
    width: 120px;
    padding: 10px;
    background-color: #FF5733; /* Red color */
    border: none;
    border-radius: 4px;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
}

.dbutton:hover {
    background-color: #C70039; /* Darker red color */
}

.hbutton {
    width: 120px;
    padding: 10px;
    background-color: #333333; /* Dark gray color */
    border: none;
    border-radius: 4px;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
}

.hbutton:hover {
    background-color: #4F4F4F; /* Lighter gray for hover effect */
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
    
       .sbutton {
            
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }

       .container4 {
        	margin: 360px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
    .sbutton:hover {
        background-color: #4cae4c;
    }
</style>
</head>
<body>
<header>
    <%@ include file="header.jsp" %>
</header>
    <form action="" name="board">
        <%@include file="db.jsp"%>
        <%
            ResultSet rs = null;
            Statement stmt = null;
            ResultSet rs2 = null;
            Statement stmt2 = null;
            String c_id = (String)request.getParameter("c_id");
            String sessionId = (String)session.getAttribute("user_id");
            String s = (String) session.getAttribute("user_grade");
            
            if(sessionId == null){			
            	%>			
            				<div class="container4">	
            				<h2 style="margin-bottom: 70px; margin-top: 30px;">로그인 하세요</h2>
            				<button class="sbutton" type="button" onclick="location.href='Mlogin.jsp'">로그인 하러 가기</button>
            				</div>
            	<%
            	return;
            }
            try {
                stmt = conn.createStatement();
                String querytext = "SELECT * FROM community WHERE c_id ='" + c_id + "'";
                rs = stmt.executeQuery(querytext);
        %>
        <%
            if (rs.next()) {
        %>
<div class="container">
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
<%        if(sessionId.equals(rs.getString("session_id"))){	 %>
            <p><strong><%= rs.getString("session_id") %>님 :</strong> <%= rs.getString("com_contents") %> <strong style="float:right"> ( <%= rs.getString("cdatetime") %> )</strong>
            <button class="cs2button" type="button" onclick="fnUpdate3('<%= rs.getString("commentNo") %>','<%= rs.getString("c_id") %>')">수정하기</button>
            <button class="csbutton" type="button" onclick="fnDelete3('<%= rs.getString("commentNo") %>','<%= rs.getString("c_id") %>')">삭제하기</button>
            </p>
						
<% } else{ %>
  <p><strong><%= rs.getString("session_id") %>님 :</strong> <%= rs.getString("com_contents") %> <strong style="float:right"> ( <%= rs.getString("cdatetime") %> )</strong></p>

<% } %>
        </div>
        
<% 
				}
%>            
        
        <%
            }
            stmt2 = conn.createStatement();
            String querytext2 = "SELECT * FROM community WHERE c_id ='" + c_id + "'";
            rs2 = stmt.executeQuery(querytext2);
            if(rs2.next()){
            if(sessionId.equals(rs2.getString("user_id"))){
         %> 
            	<div class="button-group">
            	<%    
            if ("관리자".equals(s)) {
            	if ("N".equals(rs2.getString("c_hidden"))) { 
%>

 <button style="width:120px" type="button"  class="hbutton" onclick="fnhidden('<%= rs2.getString("c_id") %>')">숨기기</button>
<%
} else {
%>
<button style="width:120px" type="button"  class="hbutton" onclick="fnrhidden('<%= rs2.getString("c_id") %>')">숨김해제</button>
<%
            }}
%>        	
             	     <button style="width:120px"type="button" class="sbutton" onclick="fnUpdate('<%= rs2.getString("c_id") %>')">수정하기</button>
             	     <button style="width:120px" type="button"  class="dbutton" onclick="fnDelete2('<%= rs2.getString("c_id") %>')">삭제하기</button>
                 <button style="width:120px"type="button" onclick="fnRemove();">돌아가기</button>
             	</div>
        <%     
            } else { 
        %>
        <div class="button-group">
        <%    
        if ("관리자".equals(s)) {
        	if ("N".equals(rs2.getString("c_hidden"))) { 
%>

<button style="width:120px" type="button"  class="hbutton" onclick="fnhidden('<%= rs2.getString("c_id") %>')">숨기기</button>
<%
} else {
%>
<button style="width:120px" type="button"  class="hbutton" onclick="fnrhidden('<%= rs2.getString("c_id") %>')">숨김해제</button>
<%
        }}
%>   

        
            <button style="width:120px" type="button" onclick="fnRemove();">돌아가기</button>
        </div>
        <%
            }}} else {
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

function fnDelete2(c_id){
    if (confirm("정말로 삭제하실겁니까?")) {
        window.location.href = "deleteC4.jsp?c_id=" + c_id;
    }
}

function fnDelete3(commentNo,c_id){
    if (confirm("정말로 삭제하실겁니까?")) {
        window.location.href = "deleteC5.jsp?commentNo=" + commentNo + "&c_id=" + c_id;
    }
}

function fnUpdate3(commentNo,c_id){
    if (confirm("댓글수정?")) {
        location.href = "updateZ.jsp?commentNo=" + commentNo + "&c_id=" + c_id;
    }
}

function fnUpdate(c_id){
    if (confirm("정말로 수정하실겁니까?")) {
        window.location.href = "updateE.jsp?c_id=" + c_id;
    }
}
function fnRemove(){ /* 페이지 새로고침 함수 */
	location.href="community.jsp";
}

function fnrhidden(c_id){
	if (confirm("숨김처리 해제 할게용?")) {
		 window.location.href = "admin_community_rhidden2.jsp?c_id=" + c_id;
		}
		}
function fnhidden(c_id){
	if (confirm("숨김처리 할게용?")) {
		 window.location.href = "admin_community_hidden2.jsp?c_id=" + c_id;
		}
		}
</script>
</body>
</html>