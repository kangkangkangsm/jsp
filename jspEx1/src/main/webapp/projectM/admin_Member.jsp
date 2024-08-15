<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* 배경색을 연한 회색으로 변경 */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 70px; /* 헤더 높이에 맞춰서 여백 추가 */
        }

        header {
            width: 100%;
            background-color: #333; /* 어두운 회색 */
            color: #fff;
            padding: 15px 0; /* 상하 패딩을 증가시켜 여백을 더 줍니다 */
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .content {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 20px;
        }

        .container {
        	margin-top:120px;
            border-radius: 8px;
            background-color: #fff; /* 배경색을 하얀색으로 설정 */
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* 그림자를 더 부드럽게 */
            width: 100%;
            max-width: 1200px; /* 최대 폭 설정으로 큰 화면에서도 과도하게 커지지 않도록 */
            overflow-x: auto; /* 테이블이 화면보다 넓을 때 스크롤 가능 */
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333; /* 텍스트 색상을 어두운 회색으로 설정 */
        }

        button,
        input[type="submit"],
        input[type="reset"] {
            padding: 10px 20px;
            background-color: #5cb85c; /* 버튼 배경색 */
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 10px;
            cursor: pointer;
            transition: background-color 0.3s; /* 버튼 배경색 변화에 애니메이션 추가 */
            margin: 5px;
        }

        button:hover,
        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #4cae4c; /* 호버 시 배경색 */
        }

        .footer {
            text-align: center;
            padding: 10px;
            background-color: #009688; /* 배경색을 청록색으로 변경 */
            color: #fff;
            margin-top: 20px;
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-family: Arial, sans-serif;
        }

        th {
            background-color: #4CAF50; /* 헤더 배경색 */
            color: white;
            padding: 5px 2px;
            text-align: left;
            border-bottom: 2px solid #ddd; /* 헤더 하단에 테두리 추가 */
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* 짝수 행 배경색을 약간 밝게 설정 */
        }

        tr:hover {
            background-color: #e0e0e0; /* 마우스 오버 시 배경색을 더 밝게 설정 */
        }

        td {
            padding: 2px 2px;
            border: 1px solid #ddd;
        }

        a {
            text-decoration: none;
            color: #333; /* 링크 색상을 어두운 회색으로 설정 */
        }

        a:hover {
            color: #0056b3; /* 링크 호버 시 색상 */
        }

        a:visited {
            color: #333; /* 방문한 링크 색상 */
        }
    </style>
</head>
<body>
    <header>
        <%@ include file = "header.jsp" %>
    </header>
    <form action="" name="user">
        <div class="content">
            <%@ include file="db.jsp" %>
            <%
                ResultSet rs = null;
                Statement stmt = null;
                try {
                    stmt = conn.createStatement();
                    String querytext = "SELECT * FROM users";
                    rs = stmt.executeQuery(querytext);
            %>
            <div class="container">
                <h2>회원 관리</h2>
                <hr>
                <table>
                    <tr>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                        <th>봉사지역</th>
                        <th>등급</th>
                        <th>가입일자</th>
                        <th>VEN</th>
                        <th>탈퇴</th>
                    </tr>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><a><%= rs.getString("name") %></a></td>
                        <td><a><%= rs.getString("user_id") %></a></td>               
                        <td><a><%= rs.getString("phone_number") %></a></td>
                        <td><a><%= rs.getString("email") %></a></td>
                        <td><a><%= rs.getString("volunteer_region") %></a></td>
                        <td><a><%= rs.getString("user_grade") %></a></td>
                        <td><a><%= rs.getString("created_at") %></a></td>
                        <td><button>정지</button></td>
                        <td><button>탈퇴</button></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
            <%
                } catch (SQLException ex) {
                    out.print("데이터베이스 오류: " + ex.getMessage());
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                }
            %>
        </div>
    </form>
    <footer class="footer">
        <p>&copy; 2024 Your Company</p>
    </footer>
</body>
</html>