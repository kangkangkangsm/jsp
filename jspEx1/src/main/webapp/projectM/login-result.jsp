<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            width: 450px;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
                
        #btn {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        
        #btn:hover {
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
<header>
 <%@ include file = "header.jsp" %>
</header>
<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("password");
				
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT * FROM users WHERE user_id = '" + id + "' AND password = '" + pwd + "'";
			System.out.println(querytext);
			rs = stmt.executeQuery(querytext);
			
			
			if(rs.next()){
				out.println("로그인 성공.");
				session.setAttribute("user_id", rs.getString("user_id"));
				session.setAttribute("user_grade", rs.getString("user_grade"));
				session.setAttribute("password", rs.getString("password"));
				response.sendRedirect("main.jsp");
			} else {
%>

				 <div class="container">
        		<div><h2>아이디 및 비밀번호를 확인해주세요.</h2></div>					
				<button id="btn" onclick="location.href='Mlogin.jsp'">로그인 페이지로 이동</button>
				</div>
<%
			}
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		
	%>
</body>
</html>