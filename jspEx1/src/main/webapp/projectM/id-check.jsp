<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

  h2 {
            text-align: center;
            margin-bottom: 70px;
            color: #333;
        }
 button{
            display: block;
            width: 30%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
          	margin: 0 auto;
        }
</style>
</head>
<body>
<%@include file="db.jsp"%>
	<%
		ResultSet rs = null; /* 데이터베이스에서 SELECT 한 결과 집합을 저장할 변수 선언 */ /* INSERT,DELETE,UPDATE는 RS객체가 필요없음 */
		Statement stmt = null; /* SQL 문을 실행하기 위한 Statement 객체 선언 */
		String id = request.getParameter("userId");
		stmt = conn.createStatement(); /* Statement 객체 생성 */
		String query = "SELECT * FROM users WHERE user_id ='" + id + "'";
		rs = stmt.executeQuery(query);
		
  	 if(rs.next()){ %>
	     <h2> 중복된 아이디 </h2>
			<button onclick="fnclose()">닫기</button>

<% 
	    } else{
%>       
			<h2> 사용 가능한 아이디 </h2>
			<button onclick="fnclose()">닫기</button>
<%	        
	    } 
%>
	

</body>
</html>
<script>
function fnclose() {
	window.close();
	window.opener.fnReload();
}

</script>