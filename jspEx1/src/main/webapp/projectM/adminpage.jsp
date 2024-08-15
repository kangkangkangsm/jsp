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
   /*  body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
    } */

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

.container {
    border-radius: 8px; /* 테두리 둥글기 */
    background-color: #ffffff; /* 배경색 흰색 */
    padding: 20px; /* 내부 여백 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 32%; /* 너비 20% */
    position: absolute; /* 절대 위치 지정 */
    top: 80px; /* 상단에서 80px 떨어진 위치 */
    left: 5%; /* 페이지 왼쪽 끝에 정렬 */
    height: 380px;/* 화면 높이에서 80px를 뺀 높이 */
}

.container3 {
    border-radius: 8px; /* 테두리 둥글기 */
    background-color: #ffffff; /* 배경색 흰색 */
    padding: 20px; /* 내부 여백 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 32%; /* 너비 20% */
    position: absolute; /* 절대 위치 지정 */
    top: 470px; /* 상단에서 80px 떨어진 위치 */
    left: 5%; /* 페이지 왼쪽 끝에 정렬 */
   	height: calc(200vh);/* 화면 높이에서 80px를 뺀 높이 */
}

/* 오른쪽에 위치할 .container2 스타일 */
.container2 {
    border-radius: 8px; /* 테두리 둥글기 */
    background-color: #ffffff; /* 배경색 흰색 */
    padding: 20px; /* 내부 여백 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 58%; /* 너비 60% */
    position: absolute; /* 절대 위치 지정 */
    top: 80px; /* 상단에서 80px 떨어진 위치 */
    left: 37.5%; /* 페이지 왼쪽 끝에서 30% 떨어진 위치에서 시작 */
    height: calc(200vh); /* 화면 높이에서 80px를 뺀 높이 */
}

 .container4 {
        	margin-top:260px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

    .container:last-child {
        margin-left: 30px; /* Margin between the two sections */
    }

    h2 {
        text-align: center;
        margin-bottom: 20px; /* Adjust as needed */
        color: #333;
        margin-top:-3px;
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
    .Jbutton {
        width: 25%;
        padding: 10px;
        background-color: #5cb85c;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        float:right;
        margin-left:5px;
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
<header>
    <%@ include file = "header.jsp" %>
</header>
<form action="" name="user">
<div class="content">
   <%@include file="db.jsp"%>
<%
	ResultSet rs = null;
	Statement stmt = null;
    String user_id = (String) session.getAttribute("user_id");
    try {
    	stmt = conn.createStatement();
		String querytext = "SELECT * FROM volunteering";
		rs = stmt.executeQuery(querytext);
%>
    <div class="container">
        </div>
    <div class="container3">
            </div>
    <div class="container2">
    <h2>관리 내역</h2>
    <hr>
    <table>
    <tr>
    <th>관리내용</th>
    </tr>
     <tr>
    <td><a href="admin_Member.jsp">회원목록 관리</a></td>
    </tr>
     <tr>
    <td><a href="admin_community_List.jsp">게시글목록 관리</a></td>
    </tr>
       <tr>
    <td><a href="#">봉사관련 관리</a></td>
    </tr>
      <tr>
    <td><a href="#">고객센터 문의</a></td>
    </tr>
    </table>
	</div>
	<%
    } catch(SQLException ex) {
        out.println("SQLException : " + ex.getMessage());
    }
    %>
</div>
</form>
<script>

</script>
</body>
</html>