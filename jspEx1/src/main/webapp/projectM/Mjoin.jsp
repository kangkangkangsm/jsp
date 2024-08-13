<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .container {
        	margin-top:60px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 800px;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 70px;
            color: #333;
        }
        
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        
        .form-row label {
            margin-bottom: 5px;
            color: #555;
            width: 48%;
            text-align: left;
        }
        
        .form-row input[type="text"],
        .form-row input[type="password"],
        .form-row input[type="email"],
        .form-row select {
            width: 48%;
            padding: 10px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .form-row .input-group {
            display: flex;
            width: 48%;
        }
        
        .form-row .input-group input[type="text"] {
            width: 70%;
            margin-right: 10px;
        }
        
        .form-row .input-group button {
            width: 30%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
        }
        
        .form-row .input-group button:hover {
            background-color: #4cae4c;
        }
        
        .Joinbtn {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        
        .Joinbtn:hover {
            background-color: #4cae4c;
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
    </style>
</head>
<header>
 <%@ include file = "header.jsp" %>
</header>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form action="join-result.jsp" name="user">
            <div class="form-row">
                <label for="name" >이름</label>
                <label for="user_id" >아이디</label>
            </div>
            <div class="form-row">
                <input type="text" id="name" name="name" maxlength="50" required placeholder="이름">
                <div class="input-group">
                    <input type="text" id="user_id" name="user_id" maxlength="17" required placeholder="6자~12자 사이, 공백없이">
                    <button type="button"  onclick="fnCheck()" style="height: 88%;">중복확인</button>
                </div>
            </div>

            <div class="form-row">
                <label for="password" >비밀번호</label>
                <label for="repassword">비밀번호 확인</label>
            </div>
            <div class="form-row">
                <input type="password" id="password" name="password" required placeholder="8~12자 사이, 공백없이">
                <input type="password" id="repassword" name="repassword" required placeholder="8~12자 사이, 공백없이">
            </div>

            <div class="form-row">
                <label for="resident_registration_number">주민등록번호</label>
                <label for="email">이메일</label>
            </div>
            <div class="form-row">
                <input type="text" id="resident_registration_number" name="resident_registration_number" maxlength="13" required placeholder="공백없이 ex)9010111234567">
                <input type="email" id="email" name="email" maxlength="100" required placeholder="ex)akf23@naver.com">
            </div>

            <div class="form-row">
                <label for="address">주소</label>
                <label for="phone_number">휴대전화번호</label>
            </div>
            <div class="form-row">
                <input type="text" id="address" name="address" maxlength="255" placeholder="주소입력">
                <input type="text" id="phone_number" name="phone_number" maxlength="15"placeholder="공백없이 ex)01012345678">
            </div>

            <div class="form-row">
                <label for="gender">성별</label>
                <label for="volunteer_region">봉사_소속지역</label>
            </div>
            <div class="form-row">
                <select id="gender" name="gender" required>
                    <option value=''>::성별::</option>
                    <option value="남성">남성</option>
                    <option value="여성">여성</option>
                </select>
                <select id="volunteer_region" name="volunteer_region" required>
                    <option value=''>::지역선택::</option>
                    <option value="서울특별시">서울특별시</option>
                    <option value="부산광역시">부산광역시</option>
                    <option value="대구광역시">대구광역시</option>
                    <option value="인천광역시">인천광역시</option>
                    <option value="광주광역시">광주광역시</option>
                    <option value="대전광역시">대전광역시</option>
                    <option value="울산광역시">울산광역시</option>
                    <option value="세종특별자치시">세종특별자치시</option>
                    <option value="경기도">경기도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청북도">충청북도</option>
                    <option value="충청남도">충청남도</option>
                    <option value="전라북도">전라북도</option>
                    <option value="전라남도">전라남도</option>
                    <option value="경상북도">경상북도</option>
                    <option value="경상남도">경상남도</option>
                    <option value="제주특별자치도">제주특별자치도</option>
                </select>
            </div>
            <button type="button" class="Joinbtn" onclick="fnJoin()">가입하기</button>
            
        </form>
    </div>
</body>
</html>
<script>
function fnCheck() {
	var f = document.user;
	 if (f.user_id.value === "") {
         alert("아이디를 입력해주세요");
         return;
     }
	window.open("id-check.jsp?userId=" + f.user_id.value, "reset", "width=500, height=200");
		
}

function fnJoin(){
	var user_id = document.querySelector('#user_id').value;
    var name = document.querySelector('#name').value;
    var password = document.querySelector('#password').value;
    var repassword = document.querySelector('#repassword').value;
    var resident_registration_number = document.querySelector('#resident_registration_number').value;
    var address = document.querySelector('#address').value;
    var email = document.querySelector('#email').value;
    var phone_number = document.querySelector('#phone_number').value;
    var gender = document.querySelector('#gender').value;
    var volunteer_region = document.querySelector('#volunteer_region').value;
    
    if (user_id === '' || name === '' || password === '' || repassword === ''
    	|| resident_registration_number === '' || address === '' || email === ''
    	|| phone_number === ''|| gender === '' || volunteer_region === '' 
    	) {
        alert('빈칸/선택 채워주세요.');
        return;
    }
    else if (password !== repassword) {
        alert('비밀번호의 값이 서로 다릅니다');
        return;
    }
    else if (user_id.length < 6 || user_id.length > 10  ) {
        alert('아이디는 6자~12자 사이로 입력해주세요');
        return;
    }
    else if (password.length < 8 || password.length > 12  ) {
        alert('비밀번호는 8자~12자 사이로 입력해주세요');
        return;
    }
    if(user)
	var f = document.user;
	f.action = "join-result.jsp";
	f.submit();
}

</script>