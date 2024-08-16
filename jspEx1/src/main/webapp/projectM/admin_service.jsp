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
/* .container3 {
    border-radius: 8px; /* 테두리 둥글기 */
    background-color: #ffffff; /* 배경색 흰색 */
    padding: 20px; /* 내부 여백 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    width: 32%; /* 너비 20% */
    position: absolute; /* 절대 위치 지정 */
    top: 470px; /* 상단에서 80px 떨어진 위치 */
    left: 5%; /* 페이지 왼쪽 끝에 정렬 */
   	height: calc(200vh);/* 화면 높이에서 80px를 뺀 높이 */
} */



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
  
    	stmt = conn.createStatement();
		String querytext = "SELECT * FROM volunteering";
		rs = stmt.executeQuery(querytext);
%>
    <div class="container">
    <h2>관리 내역</h2>
    <hr>
    <table>
    <tr>
    <th>관리내용</th>
    </tr>
       <tr>
    <td><a href="admin_participate.jsp">봉사관련 관리</a></td>
    </tr>
     <tr>
    <td><a href="admin_Member.jsp">회원목록 관리</a></td>
    </tr>
     <tr>
    <td><a href="admin_community_List.jsp">게시글목록 관리</a></td>
    </tr>
      <tr>
    <td ><a href="admin_status_check.jsp">참가신청 확인</a></td>
    </tr>
       <tr>
    <td><a href="admin_clear_check.jsp">참가완료 확인</a></td>
    </tr>
     <tr>
    <td style="background-color:#C0CECB"><a href="admin_status_check.jsp">문의내용 확인</a></td>
    </tr>
    </table>
        </div>
 
    <div class="container2">
    <h2>문의내용 확인</h2>
     <%
                ResultSet rs2 = null;
                Statement stmt2 = null;
            
                    stmt = conn.createStatement();
                    String querytext2 = "SELECT * FROM customer_support ORDER BY submission_date DESC";
                    rs2 = stmt.executeQuery(querytext2);
%>  
	<table>
 <tr>
                <th>문의ID</th>
            	<th>유형</th>
                <th>제목</th>
                <th>내용</th>
                <th>문의일</th>
                <th>진행</th>
                <th>답변완료</th>
 </tr>
<%	    
   while(rs2.next()){
	   if("대기중".equals(rs2.getString("status"))){
%>
<tr>          <td style="width:10%"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("user_id") %></a></td>
              <td style="width:10%"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("service_type") %></a></td>
                <td style="width:20%"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("service_title") %></a></td>
             <td style="width:34%"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("service_contents") %></a></td>
                <td style="width:10%"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("submission_date") %></a></td>
                 <td style="width:8%"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("status") %></a></td>
                 <td style="width:10%"><button type="button" onclick="fnstatus2('<%= rs2.getString("id") %>','<%= rs2.getString("user_id") %>')">답변완료</button></td>
                
                 </tr>
<% }else{ %>	
			<tr>          
			<td style="width:10%; background-color:#C0CECB"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("user_id") %></a></td>
              <td style="width:10%; background-color:#C0CECB"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("service_type") %></a></td>
                <td style="width:20%; background-color:#C0CECB"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("service_title") %></a></td>
             <td style="width:34%; background-color:#C0CECB"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("service_contents") %></a></td>
                <td style="width:10%; background-color:#C0CECB"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("submission_date") %></a></td>
                 <td style="width:8%; background-color:#C0CECB"><a href="board5.jsp?id=<%= rs2.getString("id") %>"><%= rs2.getString("status") %></a></td>
                 <td style="width:10%; background-color:#C0CECB"></td>
                
                 </tr>
<%
}
	   } %>	

</table>
</div>
</form>
<script>

function fnstatus2(id,user_id){
    if (confirm("아이디(" + user_id + ") 문의사항에 답변을 해주셨나요?")) {
        window.location.href = "status_result4.jsp?id=" + id;
    }
}
			
function fnReload(){ /* 페이지 새로고침 함수 */
	location.reload(); /* 페이지를 새로 고침 */
}


</script>
</body>
</html>