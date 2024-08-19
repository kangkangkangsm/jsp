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
        background-color: #ffffff;
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
        border-radius: 8px;
        background-color: #ffffff;
        padding: 20px 5%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%; /* Adjust width as needed */
    }

    h2 {
        text-align: center;
        margin-bottom: 20px; /* Adjust as needed */
        margin-top:-5px;
        color: #333;
    }

    .form-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        align-items: center;
    }

    .form-row label {
        width: 19%;
        color: #555;
        text-align: left;
        margin-left: 5px;
    }

    .form-row input[type="text"],
    .form-row input[type="date"],
    .form-row select {
        width: 18%;
        padding: 10px;
        margin-right: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-row input[type="checkbox"],
    .form-row input[type="radio"] {
        margin-right: 5px;
    }

    .form-row label.inline {
        width: auto;
        margin-left: 10px;
    }

    .form-row2 {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 15px;
    }

    .form-row2 input[type="date"],
    .form-row2 select {
        width: 18%;
        padding: 10px;
        margin-right: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-row2 input[type="text"] {
        width: 40%;
        padding: 10px;
        margin-right: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    button,
    input[type="submit"],
    input[type="reset"] {
        width: 8%;
        padding: 10px;
        background-color: #5cb85c;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover,
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #4cae4c;
    }

    .footer {
        text-align: center;
        padding: 10px;
        background-color: #009688;
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

/* 테이블 헤더 스타일 */
th {
    background-color: #4CAF50; /* 그라데이션 배경색 */
    color: white; /* 텍스트 색상 */
    padding: 12px 15px;
    text-align: left;
}

/* 테이블 행 스타일 */
tr:nth-child(even) {
    background-color: #f2f2f2; /* 짝수 행 배경색 */
    font-weight:bold;
}

tr:hover {
    background-color: #ddd; /* 행에 마우스 오버 시 배경색 */
}

/* 테이블 셀 스타일 */
td {
    padding: 12px 15px;
    border: 1px solid #ddd; /* 테두리 색상 */
}

/* 테이블 전체 테두리 스타일 */
table, th, td {
    border: 1px solid #ddd;
}

/* 테이블 전체 스타일 조정 */
th, td {
    text-align: left;
}

  a {
            text-decoration: none; /* 밑줄 제거 */
            color: black; /* 링크 색상 검정으로 설정 */
        }
        a:hover {
            text-decoration: none; /* 마우스 오버 시 밑줄 제거 */
            color: black; /* 마우스 오버 시 링크 색상 검정으로 유지 */
        }
        a:visited {
            color: black; /* 방문한 링크 색상 검정으로 유지 */
        }
  </style>
</head>
<body>

<%@ include file="header2.jsp" %>
<div class="container">
<form action="" name="board">
     <%@include file="db.jsp"%>
    <%
        ResultSet rs = null;
        Statement stmt = null;
        String region = request.getParameter("region");
        String activity_type = request.getParameter("activity_type");
        String field = request.getParameter("field");
        String target_group = request.getParameter("target_group");
        String recruitment_status = request.getParameter("recruitment_status");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String search = request.getParameter("search");

        try {
            stmt = conn.createStatement();
            String querytext = "SELECT * FROM volunteering";
            boolean condition = false;

            if (region != null && !region.isEmpty()) {
                querytext += " WHERE region LIKE '%" + region + "%'";
                condition = true;
            }

            if (activity_type != null && !activity_type.isEmpty()) {
                if (condition) {
                    querytext += " AND";
                } else {
                    querytext += " WHERE";
                    condition = true;
                }
                querytext += " activity_type LIKE '%" + activity_type + "%'";
            }

            if (field != null && !field.isEmpty()) {
                if (condition) {
                    querytext += " AND";
                } else {
                    querytext += " WHERE";
                    condition = true;
                }
                querytext += " field LIKE '%" + field + "%'";
            }

            if (target_group != null && !target_group.isEmpty()) {
                if (condition) {
                    querytext += " AND";
                } else {
                    querytext += " WHERE";
                    condition = true;
                }
                querytext += " target_group LIKE '%" + target_group + "%'";
            }

            if (recruitment_status != null && !recruitment_status.isEmpty()) {
                if (condition) {
                    querytext += " AND";
                } else {
                    querytext += " WHERE";
                    condition = true;
                }
                querytext += " recruitment_status LIKE '%" + recruitment_status + "%'";
            }

            if (start_date != null && !start_date.isEmpty()) {
                if (condition) {
                    querytext += " AND";
                } else {
                    querytext += " WHERE";
                    condition = true;
                }
                querytext += " start_date >= '" + start_date + "' ";
            }

            if (end_date != null && !end_date.isEmpty()) {
                if (condition) {
                    querytext += " AND";
                } else {
                    querytext += " WHERE";
                    condition = true;
                }
                querytext += " end_date <= '" + end_date + "' ";
            }

            if (search != null && !search.isEmpty()) {
                if (condition) {
                    querytext += " AND";
                } else {
                    querytext += " WHERE";
                    condition = true;
                }
                querytext += "(title LIKE '%" + search + "%' OR contents LIKE '%" + search + "%' OR field LIKE '%" + search + "%')";
            }

            querytext += " ORDER BY cdatetime DESC";
            rs = stmt.executeQuery(querytext);
    %>            
        <table>
            <tr>
                <th> 게시일 </th>
                <th> 봉사지역 </th>
                <th> 활동구분 </th>
                <th style="width:20%"> 봉사분야 </th>
                <th> 봉사대상 </th>
                <th> 봉사시작일 </th>
                <th> 봉사종료일 </th>
                <th style="width:7%"> 인원현황 </th>
                <th> 모집상태 </th>
            </tr>
    <%
        while(rs.next()) {
            ResultSet rs2 = null;
            Statement stmt2 = null;
            stmt2 = conn.createStatement();
            String querytext2 = "SELECT COUNT(*) AS CNT FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id WHERE V.id = '" + rs.getString("id") + "'";
            rs2 = stmt2.executeQuery(querytext2);
        
            if (rs2.next()) {
    %>
            <tr>
                <td style="width:15%"><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("cdatetime") %></a></td>
                <td style="width:12%"><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("region") %></a></td>
                <td style="width:8%"><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("activity_type") %></a></td>
                <td style="width:15%"><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("field") %></a></td>
                <td><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("target_group") %></a></td>
                <td><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("start_date") %></a></td>
                <td><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("end_date") %></a></td>
                <td><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs2.getString("CNT") %> / <%= rs.getString("mn_people") %></a></td>
    <% 
        if("모집완료".equals(rs.getString("recruitment_status")) || rs2.getInt("CNT") == rs.getInt("mn_people")) {
    %>
                <td style="width:9%"><a style="color:red" href="board.jsp?id=<%= rs.getInt("id") %>">모집완료</a></td>
    <% 
        } else { 
    %>                        
                <td style="width:9%"><a style="color:green" href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("recruitment_status") %></a></td>
    <% 
        } 
    %>
            </tr>
            <tr>
                <td colspan="2"><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("title") %></a></td>
                <td colspan="7"><a href="board.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("contents") %></a></td>
            </tr>
    <% 
            }
        }
    %>        
        </table>
    <%
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
    %>
</div>
</form>
</body>
</html>
<script>
</script>  