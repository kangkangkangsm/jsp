<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style>
  * {
        box-sizing: border-box;
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

    body {
    margin: 0;
    padding: 0;
    position: relative; /* 부모 요소가 relative position일 때 자식 요소의 absolute positioning이 가능함 */
}



/* 오른쪽에 위치할 .container2 스타일 */
.container2 {
    border-radius: 8px; /* 테두리 둥글기 */
    background-color: #ffffff; /* 배경색 흰색 */
    padding: 20px; /* 내부 여백 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 80%; /* 너비 80% */
    position: absolute; /* 절대 위치 지정 */
    top: 285px; /* 상단에서 285px 떨어진 위치 */
    left: 10%; /* 페이지 왼쪽 끝에서 10% 떨어진 위치에서 시작 */
    overflow: auto; /* 내용이 넘칠 때 스크롤바가 생기도록 설정 */
}

    .container:last-child {
        margin-left: 30px; /* Margin between the two sections */
    }

    h2 {
        text-align: center;
        margin-bottom: 20px; /* Adjust as needed */
        color: #333;
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
            .footer {
            text-align: center;
            padding: 10px;
            background-color: #009688;
            color: #fff;
            margin-top: 20px;
            width:100%;
        }
        /* 테이블 헤더 스타일 */
th {
    background-color: #4CAF50; /* 그라데이션 배경색 */
    color: white; /* 텍스트 색상 */
    padding: 12px 10px;
    text-align: left;
}

/* 테이블 행 스타일 */


tr:hover {
    background-color: #ddd; /* 행에 마우스 오버 시 배경색 */
}

/* 테이블 셀 스타일 */
td {
    padding: 12px 10px;
    border: 1px solid #ddd; /* 테두리 색상 */
}

/* 테이블 전체 테두리 스타일 */
table{
	width:100%;
}
table, th, td {
    border: 1px solid #ddd;
}

/* 테이블 전체 스타일 조정 */
th, td {
    text-align: center;
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
<%@ include file="header3.jsp" %>
<form action="community.jsp" method="get">
<%@ include file="db.jsp"%>  
<div class="container2">
    <%
    ResultSet rs = null;
    Statement stmt = null;
    String board_type = request.getParameter("board_type");
    String user_id = request.getParameter("user_id");
    String search = request.getParameter("search");

    try {
        stmt = conn.createStatement();
        
        // 쿼리 텍스트 초기화
        String querytext = "SELECT * FROM community";
        
        // 검색 조건이 있을 때만 WHERE 절 추가
        boolean hasConditions = false;
        if (board_type != null && !board_type.isEmpty()) {
            querytext += " WHERE board_type LIKE '%" + board_type + "%'";
            hasConditions = true;
        }
        if (user_id != null && !user_id.isEmpty()) {
            if (hasConditions) {
                querytext += " AND";
            } else {
                querytext += " WHERE";
                hasConditions = true;
            }
            querytext += " user_id LIKE '%" + user_id + "%'";
        }
        if (search != null && !search.isEmpty()) {
            if (hasConditions) {
                querytext += " AND";
            } else {
                querytext += " WHERE";
                hasConditions = true;
            }
            querytext += " (c_contents LIKE '%" + search + "%' OR c_title LIKE '%" + search + "%')";
        }

        // 최근 날짜 기준으로 정렬
        querytext += " ORDER BY c_cdatetime DESC";

        // 쿼리 실행
        rs = stmt.executeQuery(querytext);
    %>
    <table>
        <tr>
            <th>게시유형</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회</th>
        </tr>
        <%
        while (rs.next()) {
        %>
        <tr>
            <td><a href="community_board.jsp?c_id=<%= rs.getString("c_id") %>"><%= rs.getString("board_type") %></a></td>
            <td><a href="community_board.jsp?c_id=<%= rs.getString("c_id") %>"><%= rs.getString("c_title") %></a></td>
            <td><a href="community_board.jsp?c_id=<%= rs.getString("c_id") %>"><%= rs.getString("user_id") %></a></td>
            <td><a href="community_board.jsp?c_id=<%= rs.getString("c_id") %>"><%= rs.getString("c_cdatetime") %></a></td>
            <td><a href="community_board.jsp?c_id=<%= rs.getString("c_id") %>"><%= rs.getString("user_id") %></a></td>
        </tr>
        <%
        }
        %>
    </table>
    <%
    } catch (SQLException ex) {
        out.println("SQLException : " + ex.getMessage());
    }
    %>
</div>
</body>
</html>