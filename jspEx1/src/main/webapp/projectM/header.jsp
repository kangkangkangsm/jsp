<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        background-color: #C0CECB;
    }

    header {
        display: flex;
        justify-content: space-between; 
        align-items: center;
        padding: 10px 20px;
        background-color: #f4f4f4;
        border-bottom: 1px solid #eee;
    }

    .logo-nav {
        display: flex;
        align-items: center;
    }

    .logo img {
        width: 100px;
        height: 100px;
        margin-right: 50px;
    }

    nav ul {
        display: flex;
        list-style: none;
        padding: 0;
        margin: 0;
    }

    nav ul li {
        margin-right: 50px;
    }

    nav ul li a {
        text-decoration: none;
        color: #000;
        font-weight: bold;
    }

    .main-nav {
        flex-grow: 1;
    }
    

    .button {
        text-align: center;
    }

    .button img {
        width: 70px;
        height: 70px;
        margin-bottom: 10px;
    }

    .button p {
        font-size: 1em;
        color: #333;
    }
    </style>
</head>
<body>
    <header>
        <div class="logo-nav">
            <div class="logo" >
            <a href="#" onclick="location.href='main.jsp'">
                <img src="../images/mainLogo.png" alt="로고" >
                </a>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="#" onclick="location.href='guide.jsp'">봉사안내</a></li>
                    <li><a href="#" onclick="location.href='participate.jsp'">봉사참여</a></li>
                    <li><a href="#" onclick="location.href='community.jsp'">커뮤니티</a></li>
                    <li><a href="#" onclick="location.href='Customer_Service.jsp'">고객센터</a></li>
                    <li><a href="#" onclick="location.href='mypage.jsp'" >마이페이지</a></li>
                     <% 
                    String userGrade = (String) session.getAttribute("user_grade");
                    if ("관리자".equals(userGrade)) {
                    %>
                        <li><a href="#" style="color:blue;" onclick="location.href='adminpage.jsp'">관리자페이지</a></li>
                    <% 
                    }
                    %>
                </ul>
            </nav>
        </div>
        <nav>
            <ul>
           <%
			if(session.getAttribute("user_id")==null){
%>
	 			  <li><a href="#" onclick="location.href='Mlogin.jsp'">로그인</a></li>
     			  <li><a href="#" onclick="fnjoinjo()">회원가입</a></li>
<%
			}else{
			String userID=(String)session.getAttribute("user_id");			
%>
    <% 
                   
                    if ("관리자".equals(userGrade)) {
                    %>
              <li><a href="#" onclick="location.href='mypage.jsp'">  (관리자) <%= userID %> 님 환영합니다.</a></li>
                    <% 
                    }else{
                    %>
	              <li><a href="#" onclick="location.href='mypage.jsp'">  <%= userID %> 님 환영합니다.</a></li>	
	              <% 
                    }
	              %>
	              
                  <li><a href="#" onclick="fnlogout()">로그아웃</a></li>
<%
			}	
%>
	              
            </ul>
        </nav>
    </header>
</body>
</html>
<script>

function fnjoinjo() {
	location.href="Mjoin.jsp";
}

function fnlogout() {
	location.href="logout.jsp";
}
</script>
