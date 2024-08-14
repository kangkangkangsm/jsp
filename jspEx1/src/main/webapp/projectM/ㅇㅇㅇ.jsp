<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="db.jsp"%>	
<%-- [0]
String sessionId = (String) session.getAttribute("user_id");

이렇게사용
 <input type="text" id="dat" name="dat" placeholder="<%= sessionId %>">

[1]
	function fnmove(){
		location.href="community.jsp";
	}

[2]
  <td><a href="board2.jsp?f_id=<%= rs.getString("f_id") %>"><%= rs.getString("board_type") %></a></td>

[3]
function fnapply(id){
		if (confirm("신청 하시나요?")) {
		 window.location.href = "apply.jsp?id=" + id;
	}
	}

[4]
   <input type="text" id="dat" name="dat" placeholder="<%= sessionId %> 님의 댓글">

function fnComment(){
    var dat = document.getElementById('dat').value;
    if (confirm("댓글을 달까요?")) {
    	var url = "comment_result.jsp?dat=" + dat; /* 댓글 등록 URL 생성 */
		window.open(url , "reset", "width=500, height=500"); /* 새 창을 열어 댓글 등록 페이지를 표시 */
    }
}


[3]

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
	} --%>
</body>
</html>