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
    padding: 6px 5px;
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
                    String querytext = "SELECT * FROM community ORDER BY CASE WHEN board_type = '공지사항' THEN 0 ELSE 1 END, c_cdatetime DESC";
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
    <td style="background-color:#C0CECB" ><a href="admin_community_List.jsp">게시글목록 관리</a></td>
    </tr>
     <tr>
    <th>봉사 관리</th>
    </tr>
       <tr>
    <td ><a href="admin_participate.jsp">봉사 게시글목록 관리</a></td>
    </tr>
      <tr>
       <% if(rs5.next()){ %>  
    <td><a href="admin_status_check.jsp">신청<strong> (<%= rs5.getString("CNT") %>) / </strong></a>
  <% } %>
     <% if(rs4.next()){ %>  
    <a href="admin_status_check.jsp">완료<strong> (<%= rs4.getString("CNT") %>)</strong></a></td>
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
               
        
          
                <h2>게시판 관리</h2>

        <table>
        <tr>
        	<th style="width: 3%;">No.</th> 
            <th style="width: 10%;">게시유형</th>
            <th style="width: 15%;">제목</th>
            <th>내용</th>
            <th>작성자</th>
            <th>작성일</th>
            <th style="width: 8%;">숨기기</th>
            <th style="width: 8%;">삭제</th>
        </tr>           
<%
        	while (rs.next()) {
if ("공지사항".equals(rs.getString("board_type"))) {          		 
%>
<tr>
			<td><a style="color:red" href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" ><%= rs.getString("c_id") %></a></td>
            <td style="width: 10%; color:red"><strong><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" style="color:red"><%= rs.getString("board_type") %></a></strong></td>
            <td style="width: 15%;"><strong><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" style="color:red"><%= rs.getString("c_title") %> </a></strong></td>
            <td><strong><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" style="color:red"><%= rs.getString("c_contents") %> </a></strong></td>
            <td><strong><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" style="color:red"><%= rs.getString("user_id") %></a></strong></td>
            <td><strong><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" style="color:red"><%= rs.getTimestamp("c_cdatetime") %></a></strong></td>
<%            
    if ("N".equals(rs.getString("c_hidden"))) {            
%> 
    	<td><button  type="button" onclick="fnhidden('<%= rs.getString("c_id") %>')">숨김</button></td>
<% }else{ %>    	    	
		   	<td><button style="background-color: red"  type="button" onclick="fnrhidden('<%= rs.getString("c_id") %>')">해제</button></td>
<%} %>           
            <td><button  type="button" onclick="fndelete('<%= rs.getString("c_id") %>')">삭제</button></td>
      
</tr>

<% 
}else {
%>          <tr>
  			<td><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" ><%= rs.getString("c_id") %></a></td>
            <td style="width: 10%;"><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" ><%= rs.getString("board_type") %></a></td>
            <td style="width: 15%;"><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" ><%= rs.getString("c_title") %> </a></td>
            <td><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" ><%= rs.getString("c_contents") %> </a></td>
            <td><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" ><%= rs.getString("user_id") %></a></td>
            <td><a href="admin_community_board.jsp?c_id=<%= rs.getInt("c_id") %>" ><%= rs.getTimestamp("c_cdatetime") %></a></td>
<%            
    if ("N".equals(rs.getString("c_hidden"))) {            
%> 
    	<td><button  type="button" onclick="fnhidden('<%= rs.getString("c_id") %>')">숨김</button></td>
<% }else{ %>    	    	
		   	<td><button style="background-color: red"  type="button" onclick="fnrhidden('<%= rs.getString("c_id") %>')">해제</button></td>
<%} %>           
            <td><button  type="button" onclick="fndelete('<%= rs.getString("c_id") %>')">삭제</button></td>
      
     		</tr>
<%
 			}
%>
<%
                
        	}} catch (SQLException ex) {
                    out.print("데이터베이스 오류: " + ex.getMessage());
                }
            %>
	</div>
</div>
</form>
<script>
function fndelete(c_id){
	if (confirm("정말 삭제시켜요?")) {
		 window.location.href = "deleteC2.jsp?c_id=" + c_id;
		}
		}

	function fnhidden(c_id){
		if (confirm("숨김처리 할게용?")) {
			 window.location.href = "admin_community_hidden.jsp?c_id=" + c_id;
			}
			}
			
	function fnrhidden(c_id){
		if (confirm("숨김처리 해제 할게용?")) {
			 window.location.href = "admin_community_rhidden.jsp?c_id=" + c_id;
			}
			}
	function fnReload(){ /* 페이지 새로고침 함수 */
		location.reload(); /* 페이지를 새로 고침 */
	}
</script>
</body>
</html>