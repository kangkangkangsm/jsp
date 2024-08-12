<%@page import="java.awt.Checkbox"%>
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
    margin-top: 80px;
        background-color: #ffffff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 30%; /* Adjust width as needed */
    }
    
    .container2 {
    margin-top: 80px;
        background-color: #ffffff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 60%; /* Adjust width as needed */
    }

    .container:last-child {
        margin-left: 30px; /* Margin between the two sections */
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

    button {
        width: 100%;
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
</style>
</head>
<body>
<header>
    <%@ include file = "header.jsp" %>
</header>
<div class="content">
    <%@include file="db.jsp"%>
    <%
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        // 세션에서 user_id 가져오기
        String user_id = (String) session.getAttribute("user_id");

        if (user_id != null) {
            String querytext = "SELECT * FROM users WHERE user_id = '" + user_id + "'";
            pstmt = conn.prepareStatement(querytext);
            rs = pstmt.executeQuery();
    %>
    <div class="container">
        <h2>마이페이지</h2>
        <%
        while (rs.next()) {
            String name = rs.getString("name");
            String userId = rs.getString("user_id");
            String residentRegistrationNumber = rs.getString("resident_registration_number");
            String phoneNumber = rs.getString("phone_number");

            // 문자열 처리
            String nameDisplay = (name != null && name.length() > 1) ? name.substring(0, name.length() - 1) + "*" : name;
            String userIdDisplay = (userId != null && userId.length() > 3) ? userId.substring(0, userId.length() - 3) + "***" : userId;
            String residentRegNumberDisplay = (residentRegistrationNumber != null && residentRegistrationNumber.length() > 8) ? residentRegistrationNumber.substring(0, 7) + "-" + residentRegistrationNumber.substring(7) : residentRegistrationNumber;
            String phoneNumberDisplay = (phoneNumber != null && phoneNumber.length() > 4) ? "****" + phoneNumber.substring(phoneNumber.length() - 4) : phoneNumber;
        %>
        <div class="form-row">
            <label for="name">이름</label>
            <label><%= nameDisplay %></label>
        </div>
        <div class="form-row">
            <label for="user_id">아이디</label>
            <label><%= userIdDisplay %></label>
        </div>
        <div class="form-row">
            <label for="resident_registration_number">주민등록번호</label>
            <label><%= residentRegNumberDisplay %></label>
        </div>
        <div class="form-row">
            <label for="address">주소</label>
            <label><%= rs.getString("address") %></label>
        </div>
        <div class="form-row">
            <label for="phone_number">휴대폰번호</label>
            <label><%= phoneNumberDisplay %></label>
        </div>
        <div class="form-row">
            <label for="email">이메일</label>
            <label><%= rs.getString("email") %></label>
        </div>
        <div class="form-row">
            <label for="volunteer_region">봉사희망지역</label>
            <label><%= rs.getString("volunteer_region") %></label>
        </div>
        <div class="form-row">
            <label for="desired_activity">온/오프라인</label>
            <label><%= rs.getString("desired_activity") %></label>
        </div>
        <div class="form-row">
            <label for="special_skills">희망_봉사분야</label>
            <label><%= rs.getString("special_skills") %></label>
        </div>
        <div class="form-row">
            <label for="created_at">가입일자</label>
            <label><%= rs.getString("created_at") %></label>
        </div>
        <% 
            }
        } else {
            out.println("User ID not found in session.");
        }
        } catch(SQLException ex) {
            out.println("SQLException : " + ex.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        %>
    </div>
    <div class="container2">
        <h2>참여활동</h2>
        <!-- 참여활동 내용 추가 -->
    </div>
</div>
</body>
</html>