<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
       
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #00796B;
            font-size: 28px;
            margin-bottom: 20px;
        }
        h2 {
            color: #00796B;
            font-size: 22px;
            margin-bottom: 10px;
        }
        p {
            font-size: 18px;
            margin-bottom: 15px;
        }
        
     /*    ul {
            list-style-type: square;
            margin: 0;
            padding-left: 20px;
        } */
       /*  li {
            font-size: 18px;
            margin-bottom: 10px;
        } */
    </style>
</head>
<body>
    <%@ include file = "header.jsp" %>
      <%@include file="db.jsp"%>	
<%
		ResultSet rs = null;
		Statement stmt = null;
		
   	    String user_id = (String) session.getAttribute("user_id");
%> 
  	 	    <div class="container">
 	    <h1>관리자 <%= user_id %>님 안녕하세요</h1>
 		  </div>
				
		
</body>
    

      
</body>
</html>