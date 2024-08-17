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
    background-color: #f4f4f4;
}

header {
	
    display: flex;
   /*  justify-content: space-between; */
    align-items: center;
    padding: 10px 20px;
    background-color: #f4f4f4;
    border-bottom: 1px solid #eee;
}

.logo img {
    width: 100px;
    height: 100px;
}

nav ul {
    display: flex;
    list-style: none;
    padding: 0;
    margin: 0;
}

nav ul li {
    margin-right: 20px;
}

nav ul li a {
    text-decoration: none;
    color: #000;
    font-weight: bold;
}

.icons img {
    margin-left: 15px;
    height: 25px;
    cursor: pointer;
}

.main-banner {
    text-align: center;
 background-color: #f4f4f4;
    padding: 40px 20px;
    border-bottom: 1px solid #eee;
}

.banner-content img {
    width: 100%;
    
    height: auto;
}

.banner-content h1 {
    font-size: 2.5em;
    color: #f4f4f4;
    margin-top: 20px;
}

.action-buttons {
    display: flex;
    justify-content: space-around;
    padding: 20px;
    background-color: #C0CECB;
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
<%@include file="db.jsp"%>
<body>
<%@ include file = "header.jsp" %>
       <main>
        <section class="main-banner">
            <div class="banner-content">
                <img src="../images/mainBanner.jpg" width="100%" alt="배너 이미지">
               
            </div>
        </section>
<%        
 ResultSet rs1 = null;
 ResultSet rs2 = null;
 ResultSet rs3 = null;
 PreparedStatement pstmt1 = null;
 PreparedStatement pstmt2 = null;
 PreparedStatement pstmt3 = null;
%> 
    <section class="action-buttons">
            <div class="button">
                <img src="button1-icon.png" alt="">
                <p>자원봉사<br>이용하고 싶어요</p>
            </div>
            <div class="button">
                <img src="button2-icon.png" alt="">
                <p>자원봉사<br>이용하고 싶어요</p>
            </div>
            <div class="button">
                <img src="button3-icon.png" alt="">
                <p>자원봉사<br>이용하고 싶어요</p>
            </div>
            <div class="button">
                <img src="button4-icon.png" alt="">
                <p>자원봉사<br>이용하고 싶어요</p>
            </div>
           
            </div>
        </section>
    </main>
   
</body>
</html>