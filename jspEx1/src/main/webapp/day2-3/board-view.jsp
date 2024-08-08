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
	table, th,  tr,  td{
	 border : 1px solid black ; /* 테이블, 헤더, 행, 데이터 셀에 검은색 테두리 적용 */
	 border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
	 padding: 10px; /* 셀 내부에 10px 여백 추가 */
	}
	.comment {
	    width: 330px; /* 댓글 입력 필드의 너비를 330px로 설정 */
	    height: 20px; /* 댓글 입력 필드의 높이를 20px로 설정 */
	    padding: 5px; /* 댓글 입력 필드 내부에 5px 여백 추가 */
	    margin: 10px 0; /* 댓글 입력 필드 위아래에 10px 여백 추가 */
	}
}
	
</style>

</head>
<body>
<form action="board-delete.jsp" name="board"> <!-- 폼의 액션을 'board-delete.jsp'로 설정하고, 폼 이름을 'board'로 지정 -->
	<%@include file="db.jsp"%> <!-- 데이터베이스 연결 설정을 포함하는 JSP 파일을 포함 -->
	<%
		ResultSet rs = null; /* 데이터베이스에서 SELECT 한 결과 집합을 저장할 변수 선언 */ /* INSERT,DELETE,UPDATE는 RS객체가 필요없음 */
		Statement stmt = null; /* SQL 문을 실행하기 위한 Statement 객체 선언 */
		String boardNo = request.getParameter("boardNo"); /* 요청에서 'boardNo' 파라미터 값을 가져옴 */
		try{
			stmt = conn.createStatement(); /* Statement 객체 생성 */
			String querytext = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo; /* 게시글 조회 쿼리문 작성 */
			rs = stmt.executeQuery(querytext); /* 쿼리문 실행 및 결과 집합을 반환 */
			if(rs.next()){ /* 결과 집합에서 첫 번째 행이 존재하는지 확인 */
	%>	
				<input  type="hidden" value="<%= rs.getString("boardNo") %>" name="boardNo"> <!-- 게시글 번호를 숨겨진 입력 필드로 설정 -->
				<div>제목 : <%= rs.getString("title") %></div> <!-- 게시글 제목 표시 -->
				<div>내용 : <%= rs.getString("contents") %></div> <!-- 게시글 내용 표시 -->
		<%
			String sessionId = (String) session.getAttribute("userId"); /* 세션에서 사용자 ID 가져오기 */
			String sessionStatus = (String) session.getAttribute("status"); /* 세션에서 사용자 상태 가져오기 */

			if(rs.getString("userId").equals(sessionId) || sessionStatus.equals("A")){ /* 게시글 작성자와 세션 사용자 ID가 같거나 사용자가 관리자일 때 */
		%>
				<button type="submit">삭제</button> <!-- 게시글 삭제 버튼 -->
				<button type="button" onclick="fnUpdate()">수정</button> <!-- 게시글 수정 버튼 -->
		<%
			}
		%>			
		<!-- 댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글  -->
				<hr> <!-- 구분선 -->
				<div>댓글 : 
					<input class="comment" type="text" placeholder="댓글 쓰셈" name="comment"> <!-- 댓글 입력 필드 -->
					<button type="button" onclick="fnComment()">등록</button> <!-- 댓글 등록 버튼 -->
				</div>
			<%
				querytext = "SELECT * FROM TBL_COMMENT WHERE BOARDNO = " + boardNo; /* 댓글 조회 쿼리문 작성 */
				rs = stmt.executeQuery(querytext); /* 쿼리문 실행 및 결과 집합을 반환 */
				while(rs.next()){ /* 결과 집합에서 모든 댓글 행을 반복 */
			%>
					<div> <%= rs.getString("userId") %> : <%= rs.getString("comment") %> </div> <!-- 댓글 작성자 및 내용 표시 -->
					<div> <%= rs.getString("cdatetime") %> </div> <!-- 댓글 작성 시간 표시 -->
			<%	} %>		
		<!-- 댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글  -->		
				
	<%			
			} else {
				out.println("삭제된 게시글 입니다."); /* 게시글이 존재하지 않을 경우 메시지 표시 */
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage()); /* SQL 예외 발생 시 메시지 표시 */
		}
	%>
</form>
</body>
</html>
<script>

	function fnUpdate(){ /* 게시글 수정 버튼 클릭 시 호출되는 함수 */
		var form = document.board; /* 'board'라는 이름의 폼 객체를 가져옴 */
		form.action = "board-update.jsp"; /* 폼의 액션을 'board-update.jsp'로 변경 */
		form.submit(); /* 폼을 제출 */
	}
	
	function fnComment(){ /* 댓글 등록 버튼 클릭 시 호출되는 함수 */
		var form = document.board; /* 'board'라는 이름의 폼 객체를 가져옴 */
		console.log(form.boardNo.value); /* 게시글 번호 값을 콘솔에 출력 */
		var url = "comment-insert.jsp?boardNo="+ form.boardNo.value + "&comment=" + form.comment.value; /* 댓글 등록 URL 생성 */
		window.open(url , "reset", "width=500, height=500"); /* 새 창을 열어 댓글 등록 페이지를 표시 */
	}
	
	function fnReload(){ /* 페이지 새로고침 함수 */
		location.reload(); /* 페이지를 새로 고침 */
	}
</script>