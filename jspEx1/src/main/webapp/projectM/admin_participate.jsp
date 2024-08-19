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
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }
    .Jbutton {
        width: 8%;
        padding: 10px;
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        float:right;
        margin-left:5px;
        margin-top:-50px;
        margin-bottom:0px;
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
                     
        try {
        stmt = conn.createStatement();
        String querytext = "SELECT * FROM volunteering ORDER BY cdatetime DESC";
        rs = stmt.executeQuery(querytext);
                    
 %>
<%
                ResultSet rs3 = null;
                Statement stmt3 = null;
            
                    stmt = conn.createStatement();
                    String querytext3 = "SELECT COUNT(*) CNT FROM customer_support where STATUS ='대기중' GROUP BY STATUS";
                    rs3 = stmt.executeQuery(querytext3);

                ResultSet rs4 = null;
                Statement stmt4 = null;
            
                    stmt = conn.createStatement();
                    String querytext4 = "SELECT COUNT(*) CNT FROM applications where STATUS ='참가 확정' AND clear ='N' GROUP BY STATUS";
                    rs4 = stmt.executeQuery(querytext4);

                ResultSet rs5 = null;
                Statement stmt5 = null;
            
                    stmt = conn.createStatement();
                    String querytext5 = "SELECT COUNT(*) CNT FROM applications where STATUS ='신청중' GROUP BY STATUS";
                    rs5 = stmt.executeQuery(querytext5);
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
    <td style="background-color:#C0CECB"><a href="admin_participate.jsp">봉사관련 관리</a></td>
    </tr>
     <tr>
    <td><a href="admin_community_List.jsp">게시글목록 관리</a></td>
    </tr>
     <tr>
    <th>신청 관리</th>
    </tr>
      <tr>
       <% if(rs5.next()){ %>  
    <td ><a href="admin_status_check.jsp">참가신청 확인<strong> (<%= rs5.getString("CNT") %>)</strong></a></td>
  <% } %>
    </tr>
       <tr>
     <% if(rs4.next()){ %>  
    <td><a href="admin_clear_check.jsp">참가완료 확인<strong> (<%= rs4.getString("CNT") %>)</strong></a></td>
    <% } %>
    </tr>
    <tr>
    <th>고객 문의</th>
    </tr>
     <tr>
 <%  if(rs3.next()){%>    
    <td><a href="admin_service.jsp">문의내용 확인<strong> (<%= rs3.getString("CNT") %>)</strong></a></td>
 <% } %>   
    </tr>
    </table>
        </div>
 
    <div class="container2">

                <h2>봉사게시글 관리</h2>
               <button type="button" class="Jbutton" onclick="fnmove()" value="글쓰기">추가하기</button>

        <table>
        <tr>
         	<th style="width: 3%;">No.</th>
            <th style="width: 8%;">게시일</th>
            <th style="width: 15%;">분야</th>
            <th style="width: 20%;">제목</th>
            <th style="width: 7%;">시작일</th>
            <th style="width: 7%;">종료일 </th>
            <th style="width: 5%;">신청</th>
            <th style="width: 5%;">모집</th>
             <th style="width:7%;">상태</th>
            <th style="width: 8%;">상태 변경</th>
            <th style="width: 8%;">수정</th>
            <th style="width: 8%;">삭제</th>
        </tr>           
<%
    while (rs.next()) {
        ResultSet rs2 = null;
        Statement stmt2 = null;
        stmt2 = conn.createStatement();
        String querytext2 = "SELECT COUNT(*) AS CNT FROM applications A INNER JOIN volunteering V ON A.volunteering_id = V.id WHERE V.id = '" + rs.getString("id") + "'";
        rs2 = stmt2.executeQuery(querytext2);
     
        if (rs2.next()) {
        
%>
        <tr>
         <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a></td>
            <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("cdatetime") %></a></td>
            <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("field") %></a></td>
            <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("title") %></a></td>
            <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("start_date") %></a></td>
            <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("end_date") %></a></td>
<%   
            if(rs2.getInt("CNT") == rs.getInt("mn_people")){
%>
			<td><a style="color:red; font-weight:bold;" href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs2.getString("CNT") %></a></td>
            <td><a  style="color:red; font-weight:bold; ;" href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("mn_people") %></a></td>
<%            	
            }else{
%>
		<td><a href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs2.getString("CNT") %></a></td>
            <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("mn_people") %></a></td>
<% 
            }} 
%>         
<% 
        if ("모집완료".equals(rs.getString("recruitment_status")) || rs2.getInt("CNT") == rs.getInt("mn_people")) {
%>
        <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>">모집완료</a></td>
        <td><button type="button" onclick="fnstatus2('<%= rs.getString("id") %>', '<%= rs.getString("recruitment_status") %>','<%= rs2.getInt("CNT") %>','<%= rs.getInt("mn_people") %>')" style="background-color:red">모집중</button></td>     
<% 
        } else { 
%>         
        <td><a href="admin_board.jsp?id=<%= rs.getString("id") %>">모집중</a></td>
        <td><button type="button" onclick="fnstatus('<%= rs.getString("id") %>', '<%= rs.getString("recruitment_status") %>')">모집완료</button></td>
<% 
        }
%>         
        <td><button type="button" onclick="fnupdate('<%= rs.getString("id") %>')">수정</button></td>
        <td><button type="button" onclick="fndelete('<%= rs.getString("id") %>')">삭제</button></td>
    </tr>
<% 
   
    }
} catch (SQLException ex) {
    out.print("데이터베이스 오류: " + ex.getMessage());
}
%>
	</table>
	</div>
</div>
</form>
<script>
function fndelete(id){
	if (confirm("정말 삭제시켜요?")) {
		 window.location.href = "deleteD1.jsp?id=" + id;
		}
		}	
function fnupdate(id){
	if (confirm("수정하러 이동합니다?")) {
		 window.location.href = "actBoard_update.jsp?id=" + id;
		}
		}	
		
function fnmove(){
	if (confirm("추가?")) {
		location.href="actBoard_insert.jsp";
	}
		}
	
	function fnstatus(id,recruitment_status){
		if (confirm("상태 변경할까요?")) {
			 window.location.href = "admin_status.jsp?id=" + id +"&recruitment_status=" + recruitment_status;
			}
			}
	function fnstatus2(id, recruitment_status, CNT, mn_people) {
	    if (CNT >= mn_people) {
	        alert("인원수가 다 찼습니다!");
	        return;
	    }

	    if (confirm("상태 변경할까요?")) {
	        window.location.href = "admin_status2.jsp?id=" + id + "&recruitment_status=" + recruitment_status;
	    }
	}
		

	function fnReload(){ /* 페이지 새로고침 함수 */
		location.reload(); /* 페이지를 새로 고침 */
	}
</script>
</body>
</html>