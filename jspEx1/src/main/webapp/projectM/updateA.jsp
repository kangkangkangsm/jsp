<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 변경</title>
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
        	margin-top:60px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 800px;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 70px;
            color: #333;
        }
        
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        
        .form-row label {
            margin-bottom: 5px;
            color: #555;
            width: 48%;
            text-align: left;
        }
        
        .form-row input[type="text"],
        .form-row input[type="password"],
        .form-row input[type="email"],
        .form-row select {
            width: 48%;
            padding: 10px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .form-row .input-group {
            display: flex;
            width: 48%;
        }
        
        .form-row .input-group input[type="text"] {
            width: 70%;
            margin-right: 10px;
        }
        
        .form-row .input-group button {
            width: 30%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
        }
        
        .form-row .input-group button:hover {
            background-color: #4cae4c;
        }
        
        .Joinbtn {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        
        .Joinbtn:hover {
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
<header>
 <%@ include file = "header.jsp" %>
</header>
<body>
<div class="container">
<form action="updateA_result.jsp" method="get">
  <%@include file="db.jsp"%>
        <%
            ResultSet rs = null;
            Statement stmt = null;
            String user_id = request.getParameter("user_id");
                	System.out.println(user_id);
            try {
                stmt = conn.createStatement();
                String querytext = "SELECT * FROM users WHERE user_id ='" + user_id + "'";
                rs = stmt.executeQuery(querytext);
                if(rs.next()){
                	
		%>

            <h2>내정보 변경</h2>

                <div class="form-row">
                    <label for="name" >이름</label>
                    <label for="user_id" >아이디</label>
                </div>
                <div class="form-row">
                    <input type="text" id="name" name="name" maxlength="50" disabled value="<%= rs.getString("name") %>" >
                    <div class="input-group">
                        <input type="text" id="user_id" name="user_id" maxlength="17" disabled value="<%= rs.getString("user_id") %>" style="width:364.8px;" >
                    </div>
                </div>

                <div class="form-row">
                    <label for="resident_registration_number">주민등록번호</label>
                    <label for="email">이메일</label>
                </div>
                <div class="form-row">
                    <input type="text" id="resident_registration_number" name="resident_registration_number" maxlength="13" disabled value="<%= rs.getString("resident_registration_number") %>">
                    <input type="email" id="email" name="email" maxlength="100" required value="<%= rs.getString("email") %>">
                </div>

                <div class="form-row">
                    <label for="address">주소</label>
                    <label for="phone_number">휴대전화번호</label>
                </div>
                <div class="form-row">
                    <input type="text" id="address" name="address" maxlength="255" value="<%= rs.getString("address") %>">
                    <input type="text" id="phone_number" name="phone_number" maxlength="15"value="<%= rs.getString("phone_number") %>">
                </div>

                <div class="form-row">
                    <label for="gender">성별</label>
                    <label for="volunteer_region">봉사_소속지역</label>
                </div>
                <div class="form-row">
                    <select id="gender" name="gender" disabled>
                        <option value='<%= rs.getString("gender") %>'><%= rs.getString("gender") %></option>
                       
                    </select>
                    <select id="volunteer_region" name="volunteer_region" required>
                        <option value='<%= rs.getString("volunteer_region") %>'><%= rs.getString("volunteer_region") %></option>
                        <option value="서울특별시">서울특별시</option>
                        <option value="부산광역시">부산광역시</option>
                        <option value="대구광역시">대구광역시</option>
                        <option value="인천광역시">인천광역시</option>
                        <option value="광주광역시">광주광역시</option>
                        <option value="대전광역시">대전광역시</option>
                        <option value="울산광역시">울산광역시</option>
                        <option value="세종특별자치시">세종특별자치시</option>
                        <option value="경기도">경기도</option>
                        <option value="강원도">강원도</option>
                        <option value="충청북도">충청북도</option>
                        <option value="충청남도">충청남도</option>
                        <option value="전라북도">전라북도</option>
                        <option value="전라남도">전라남도</option>
                        <option value="경상북도">경상북도</option>
                        <option value="경상남도">경상남도</option>
                        <option value="제주특별자치도">제주특별자치도</option>
                    </select>
                </div>
                <button type="submit" value="저장">저장</button>
<%                
            
            
	
                }
            } catch (SQLException ex) {
                out.println("SQLException : " + ex.getMessage());
            }
        %>
        
    </form>
</div>
</body>
</html>