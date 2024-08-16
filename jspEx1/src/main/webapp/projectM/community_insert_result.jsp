<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처리문</title>
</head>
 <style>
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
    margin: 300px auto 20px auto; /* Adjusted margin-top to account for header */
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 80%;
    max-width: 400px;
}
h2 {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
}
button {
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
button:hover {
    background-color: #4cae4c;
}
</style>
</head>
<body>
<header>
    <%@ include file="header.jsp" %>
</header>
<%@include file="db.jsp"%>    
<%
    ResultSet rs = null;
    Statement stmt = null;

    String user_id = (String)session.getAttribute("user_id");
    String board_type = request.getParameter("board_type");
    String c_title = request.getParameter("c_title");
    String c_contents = request.getParameter("c_contents");
    
    try {
        stmt = conn.createStatement();
        String sql = "INSERT INTO community (user_id, board_type, c_title, c_contents) VALUES ('"
                + user_id + "', '"
                + board_type + "', '"
                + c_title + "', '"
                + c_contents + "')";
        stmt.executeUpdate(sql);
%>        
<div class="container">    
    <h2> 글쓰기 완료 </h2>
    <button type="button" onclick="fnmove()">커뮤니티 이동</button>
</div>
<%        
    } catch(SQLException ex) {
        out.println("SQLException : " + ex.getMessage());
    }
%>
<script>
function fnmove(){
    location.href="community.jsp";
}
</script>
</body>
</html>
