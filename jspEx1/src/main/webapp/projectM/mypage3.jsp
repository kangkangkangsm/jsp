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
    width: 20%; /* 너비 20% */
    position: absolute; /* 절대 위치 지정 */
    top: 80px; /* 상단에서 80px 떨어진 위치 */
    left: 5%; /* 페이지 왼쪽 끝에 정렬 */
    height: 450px;/* 화면 높이에서 80px를 뺀 높이 */
}

.container3 {
    border-radius: 8px; /* 테두리 둥글기 */
    background-color: #ffffff; /* 배경색 흰색 */
    padding: 20px; /* 내부 여백 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 20%; /* 너비 20% */
    position: absolute; /* 절대 위치 지정 */
    top: 540px; /* 상단에서 80px 떨어진 위치 */
    left: 5%; /* 페이지 왼쪽 끝에 정렬 */
   	height: calc(200vh);/* 화면 높이에서 80px를 뺀 높이 */
}

/* 오른쪽에 위치할 .container2 스타일 */
.container2 {
    border-radius: 8px; /* 테두리 둥글기 */
    background-color: #ffffff; /* 배경색 흰색 */
    padding: 20px; /* 내부 여백 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 70%; /* 너비 60% */
    position: absolute; /* 절대 위치 지정 */
    top: 80px; /* 상단에서 80px 떨어진 위치 */
    left: 25.5%; /* 페이지 왼쪽 끝에서 30% 떨어진 위치에서 시작 */
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
        width: 35%;
        padding: 10px;
        background-color: #5cb85c;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        float:right;
        margin-left:5px;
        margin-top:40px;
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
    ResultSet rs1 = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    PreparedStatement pstmt3 = null;
    String user_id = (String) session.getAttribute("user_id");
	
    if(user_id == null){			
%>			
			<div class="container4">	
			<h2 style="margin-bottom: 70px; margin-top: 30px;">로그인 하세요</h2>
			<button type="button" onclick="location.href='Mlogin.jsp'">로그인 하러 가기</button>
			</div>
<%
		} else {			
    
        String userQuery = "SELECT * FROM users WHERE user_id = ?";
        pstmt1 = conn.prepareStatement(userQuery);
        pstmt1.setString(1, user_id);
        rs1 = pstmt1.executeQuery();
        if (rs1.next()) {
    %>
    <div class="container">
        <h2>내정보</h2>
        <hr>
        <div class="details">
            <p><strong>이름:</strong> <%= rs1.getString("name") %> 님</p>
            <p><strong>아이디:</strong> <%= rs1.getString("user_id") %></p>
            <p><strong>주소:</strong> <%= rs1.getString("address") %></p>
            <p><strong>휴대폰번호:</strong> <%= rs1.getString("phone_number") %></p>
            <p><strong>이메일:</strong> <%= rs1.getString("email") %></p>
            <p><strong>봉사희망지역:</strong> <%= rs1.getString("volunteer_region") %></p>
            <p><strong>가입일자:</strong> <%= rs1.getString("created_at") %></p>
            <p><strong>나의등급:</strong> <%= rs1.getString("user_grade") %></p>
           <button type="button" class ="Jbutton" onclick="fnUpdate2('<%= rs1.getString("user_id") %>')">내정보 변경</button> 
           <button type="button" class ="Jbutton" onclick="fnDelete3('<%= rs1.getString("user_id") %>')">회원탈퇴</button>
        </div>
    </div>
<% } %>
<%
                ResultSet rs5 = null;
                Statement stmt5 = null;
            
                    stmt5 = conn.createStatement();
                    String querytext5 = "SELECT COUNT(*) CNT FROM applications A "
                            + "INNER JOIN volunteering V ON A.volunteering_id = V.id "
                            + "WHERE A.user_id ='" + user_id + "' AND clear = 'N'";
                    rs5 = stmt5.executeQuery(querytext5);

                ResultSet rs6 = null;
                Statement stmt6 = null;
            
                    stmt6 = conn.createStatement();
                    String querytext6 = "SELECT COUNT(*) CNT FROM applications A "
                            + "INNER JOIN volunteering V ON A.volunteering_id = V.id "
                            + "WHERE A.user_id ='" + user_id + "' AND clear = 'Y'";
                    rs6 = stmt6.executeQuery(querytext6);

                ResultSet rs7 = null;
                Statement stmt7 = null;
            
                    stmt7 = conn.createStatement();
                    String querytext7 = "SELECT COUNT(*) CNT FROM community WHERE user_id = '" + user_id +"'";
                    rs7 = stmt7.executeQuery(querytext7);
                    
                 ResultSet rs8 = null;
                 Statement stmt8 = null;
                
                     stmt8 = conn.createStatement();
                     String querytext8 = "SELECT COUNT(*) CNT FROM customer_support WHERE user_id = '" + user_id +"'";
                     rs8 = stmt8.executeQuery(querytext8);
%>   
    <div class="container3">
           <h2>나의 활동</h2>
    <hr>
    <table>
    <tr>
    <th>목록</th>
    </tr>
       <tr>
      <%if(rs5.next()){ %>
    <td ><a href="mypage2.jsp">봉사신청 목록 <strong>(<%= rs5.getString("CNT") %>)</strong></a></td>
    <% } %>
    </tr>
     <tr>
     <%if(rs7.next()){ %>
    <td style="background-color:#C0CECB"><a href="mypage3.jsp">게시글목록 관리 <strong>(<%= rs7.getString("CNT") %>)</strong></a></td>
      <% } %>
    </tr>
    <tr>
    <%if(rs8.next()){ %>
    <td><a href="mypage4.jsp">고객센터 문의 목록 <strong>(<%= rs8.getString("CNT") %>)</strong></a></td>
    <% } %>
    </tr>
      <tr>
      <%if(rs6.next()){ %>
    <td><a href="mypage5.jsp">참여완료 봉사 목록 <strong>(<%= rs6.getString("CNT") %>)</strong></a></td>
   <% } %>
    </tr>
    </table>
            </div>
         <%   
         String applicationsQuery = "SELECT * FROM community WHERE user_id = ?";
         pstmt3 = conn.prepareStatement(applicationsQuery);
         pstmt3.setString(1, user_id);
         rs3 = pstmt3.executeQuery();
        %>
    <div class="container2">
         <h2>내가 쓴글</h2>
        <hr>
       <table>
            <tr>
            	<th>유형</th>
                <th>제목</th>
                <th>내용</th>
                <th>게시일</th>
                <th>수정</th>
                <th>삭제</th>
             </tr>
            <%
            while(rs3.next()) {
            %>
            <tr>       
              <td style="width:10%"><a href="community_board.jsp?c_id=<%= rs3.getString("c_id") %>"><%= rs3.getString("board_type") %></a></td>
                <td><a href="community_board.jsp?c_id=<%= rs3.getString("c_id") %>"><%= rs3.getString("c_title") %></a></td>
             <td><a href="community_board.jsp?c_id=<%= rs3.getString("c_id") %>"><%= rs3.getString("c_contents") %></a></td>
                <td><a href="community_board.jsp?c_id=<%= rs3.getString("c_id") %>"><%= rs3.getString("c_cdatetime") %></a></td>
                 <td style="width:8%"><button type="button" onclick="fnUpdate('<%= rs3.getString("c_id") %>')">수정</button></td>
                 <td style="width:8%"><button type="button" onclick="fnDelete2('<%= rs3.getString("c_id") %>')">삭제</button></td>
                 </tr>
            <%
            }}
            %>
            </table>
    </div>
   
</div>
</form>
<script>
function fnDelete(f_id){
    if (confirm("정말로 이 신청을 취소하시겠습니까?")) {
        window.location.href = "deleteB.jsp?f_id=" + f_id;
    }
}

function fnDelete2(c_id){
    if (confirm("정말로 삭제하실겁니까?")) {
        window.location.href = "deleteC.jsp?c_id=" + c_id;
    }
}

function fnUpdate(c_id){
    if (confirm("정말로 수정하실겁니까?")) {
        window.location.href = "updateC.jsp?c_id=" + c_id;
    }
}

function fnUpdate2(uesr_id){
    if (confirm("정말로 수정하실겁니까?")) {
        window.location.href = "updateA.jsp?user_id=" + uesr_id;
    }
}

function fnDelete3(uesr_id){
    if (confirm("정말로 탈퇴하실겁니까?")) {
        window.location.href = "unregister.jsp?user_id=" + uesr_id;
    }
}


</script>
</body>
</html>