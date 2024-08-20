<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
        	
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        .container {
            margin: 150px auto;
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

 
        button {
            
            width: 49%;
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
<body>
<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String dat = request.getParameter("dat");
		String c_id = request.getParameter("c_id");
		String commentNo = request.getParameter("commentNo");
		String sessionId = (String) session.getAttribute("user_id");
		
		System.out.println(dat + "---" + c_id + "---" + commentNo );
				
		try{
			stmt = conn.createStatement();
			String querytext = 
					"UPDATE comment SET com_contents = '" + dat + "' ,cdatetime = now()  WHERE commentNo = '" + commentNo +"'";
			stmt.executeUpdate(querytext);
			response.sendRedirect("community_board.jsp?c_id=" + c_id );
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>
</html>
<script>

</script>