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
    width: 12%; /* 너비 20% */
    position: absolute; /* 절대 위치 지정 */
    top: 80px; /* 상단에서 80px 떨어진 위치 */
    left: 2%; /* 페이지 왼쪽 끝에 정렬 */
   
}

/* 오른쪽에 위치할 .container2 스타일 */
.container2 {
    border-radius: 8px; /* 테두리 둥글기 */
    background-color: #ffffff; /* 배경색 흰색 */
    padding: 20px; /* 내부 여백 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 83%; /* 너비 60% */
    position: absolute; /* 절대 위치 지정 */
    top: 80px; /* 상단에서 80px 떨어진 위치 */
    left: 14.5%; /* 페이지 왼쪽 끝에서 30% 떨어진 위치에서 시작 */
   
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
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }
    .Jbutton {
        width: 25%;
        padding: 10px;
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        float:right;
        margin-left:5px;
    }

    button:hover {
        background-color: #1E90FF;
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
    background-color: #1E90FF; /* 그라데이션 배경색 */
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
    border: 1px solid #ddd; /* 테두리 색상 */
    padding: 12px 10px;
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
  String user_grade = (String) session.getAttribute("user_grade");
    
    if("일반사용자".equals(user_grade)){
 %>   	
    	<div class="container4">	
		<h2 style="margin-bottom: 70px; margin-top: 30px;">일반사용자 접근 금지</h2>
		<button type="button" onclick="location.href='Mlogin.jsp'">관리자 로그인 하러 가기</button>
		</div>
<%  
return;
    }
    try {
    	stmt = conn.createStatement();
		String querytext = "SELECT * FROM volunteering";
		rs = stmt.executeQuery(querytext);
%>
<%
                ResultSet rs11 = null;
                Statement stmt11 = null;
            
                    stmt = conn.createStatement();
                    String querytext11 = "SELECT COUNT(*) CNT FROM customer_support where STATUS ='대기중' GROUP BY STATUS";
                    rs11 = stmt.executeQuery(querytext11);

                ResultSet rs12 = null;
                Statement stmt12 = null;
            
                    stmt = conn.createStatement();
                    String querytext12 = "SELECT COUNT(*) CNT FROM applications where STATUS ='참가 확정' AND clear ='N' GROUP BY STATUS";
                    rs12 = stmt.executeQuery(querytext12);

                ResultSet rs13 = null;
                Statement stmt13 = null;
            
                    stmt = conn.createStatement();
                    String querytext13 = "SELECT COUNT(*) CNT FROM applications where STATUS ='신청중' GROUP BY STATUS";
                    rs13 = stmt.executeQuery(querytext13);
%>   
     <div class="container">
    <h2>관리 내역</h2>
    <hr>
    <table>
    <tr>
    <th>회원 관리</th>
    </tr>
     <tr>
    <td><a href="admin_Member.jsp">회원목록 관리</a></td>
    </tr>
    <tr>
    <th>게시판 관리</th>
    </tr>
       <tr>
    <td ><a href="admin_participate.jsp">봉사관련 관리</a></td>
    </tr>
     <tr>
    <td ><a href="admin_community_List.jsp">게시글목록 관리</a></td>
    </tr>
     <tr>
    <th>신청 관리</th>
    </tr>
      <tr>
       <% if(rs13.next()){ %>  
    <td ><a href="admin_status_check.jsp">참가신청 확인<strong> (<%= rs13.getString("CNT") %>)</strong></a></td>
  <% } %>
    </tr>
       <tr>
     <% if(rs12.next()){ %>  
    <td style="background-color:#C0CECB" ><a href="admin_clear_check.jsp">참가완료 확인<strong> (<%= rs12.getString("CNT") %>)</strong></a></td>
    <% } %>
    </tr>
    <tr>
    <th>고객 문의</th>
    </tr>
     <tr>
 <%  if(rs11.next()){%>    
    <td><a href="admin_service.jsp">문의내용 확인<strong> (<%= rs11.getString("CNT") %>)</strong></a></td>
 <% } %>   
    </tr>
    </table>
        </div>
 
    <div class="container2">
    <h2>참가신청 확인</h2>
     <%
                ResultSet rs15 = null;
                Statement stmt15 = null;
            
                    stmt = conn.createStatement();
                    String querytext15 = "SELECT * FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id ORDER BY A.application_date DESC";
                    rs15 = stmt.executeQuery(querytext15);
%>  
	<table>
	<tr>
	<th> 신청ID </th>
	<th> 참가 신청일 </th>
	<th> 제목 </th>
	<th> 상태 </th>
	<th> 수행여부 </th>
	<th> 삭제 </th>
	</tr>	
<%	    
   while(rs15.next()){
%>
<%		
		if("참가 확정".equals(rs15.getString("status")) && "N".equals(rs15.getString("clear"))){
%>
<tr>
		<td><a href="admin_board3.jsp?id=<%= rs15.getString("id") %>"><%= rs15.getString("user_id") %></a></td>
		<td><a href="admin_board3.jsp?id=<%= rs15.getString("id") %>"><%= rs15.getString("application_date") %></a></td>
		<td><a href="admin_board3.jsp?id=<%= rs15.getString("id") %>"><%= rs15.getString("title") %></a></td>
		<td><a href="admin_board3.jsp?id=<%= rs15.getString("id") %>"><%= rs15.getString("status") %></a></td>
		<td><button type="button" onclick="fnstatus4('<%= rs15.getString("f_id") %>','<%= rs15.getString("user_id") %>')">수행완료</button></td>
			<td><button type="button" onclick="fnstatus3('<%= rs15.getString("f_id") %>')" >신청삭제</button></td>
<% } %>	
</tr>
<%	   
   }
%>
</table>
<%              
    } catch(SQLException ex) {
        out.println("SQLException : " + ex.getMessage());
    }
    
    
    %>
</div>
</form>
<script>
function fnstatus3(f_id){
if (confirm("삭제하겠습니다?")) {
	 window.location.href = "status_result.jsp?f_id=" + f_id;
	}
	}

function fnstatus4(f_id, user_id){
    if (confirm("아이디(" + user_id + ") 이용자가 봉사활동을 참여 하였나요?")) {
        window.location.href = "status_result3.jsp?f_id=" + f_id;
    }
}
			
function fnReload(){ /* 페이지 새로고침 함수 */
	location.reload(); /* 페이지를 새로 고침 */
}


</script>
</body>
</html>