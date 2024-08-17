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

 background-color: #f4f4f4;
      display: flex;
    justify-content: space-around;
    padding: 20px;
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
    width: 170px;
    height: 170px;
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
                <img src="../images/5.png" alt="">        
           
               <img src="../images/5.png" alt="">
            
        </section>
            
                 <section class="action-buttons">           
                <img src="../images/1.png" alt="">        
               <img src="../images/2.png" alt="">
               <img src="../images/3.png" alt="">
                <img src="../images/4.png" alt=""> 
            
        </section>
            <section class="main-banner">           
                <img src="../images/5.png" alt="">        
               <img src="../images/5.png" alt="">
             
                   
            
        </section>
<%        
 ResultSet rs1 = null;
 ResultSet rs2 = null;
 ResultSet rs3 = null;
 PreparedStatement pstmt1 = null;
 PreparedStatement pstmt2 = null;
 PreparedStatement pstmt3 = null;
%> 

    </main>
   
</body>
</html>