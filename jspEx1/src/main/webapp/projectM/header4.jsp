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


    header {
    	
        width: 100%;
      
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

    .container10 {
        border-radius: 8px;
        margin-top: 140px;
        margin-bottom : -102px;
        background-color: #ffffff;
        padding: 20px 5%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 83%; /* Adjust width as needed */
        margin-left:230px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px; /* Adjust as needed */
        color: #333;
        margin-top:10px;
    }

    .form-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        
        align-items: center;
    }

    .form-row label {
        width: 19%;
        color: #555;
        text-align: left;
        margin-left: 5px;
    }

    .form-row input[type="text"],
    .form-row input[type="date"],
    .form-row select {
        width: 18%;
        padding: 10px;
        margin-right: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-row input[type="checkbox"],
    .form-row input[type="radio"] {
        margin-right: 5px;
    }

    .form-row label.inline {
        width: auto;
        margin-left: 10px;
    }

    .form-row2 {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 15px;
    }

    .form-row2 input[type="date"],
    .form-row2 select {
        width: 18%;
        padding: 10px;
        margin-right: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-row2 input[type="text"] {
        width: 40%;
        padding: 10px;
        margin-right: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    button,
    input[type="submit"],
    input[type="reset"] {
        width: 8%;
        padding: 10px;
        background-color: #5cb85c;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover,
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #4cae4c;
    }

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
  </style>
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container10">
    <form action="admin_participate.jsp" method="get">
        <h2>봉사게시판 관리</h2>
        <!-- First Row -->
        <div class="form-row">
            <label for="region">봉사 소속지역</label>
            <label for="activity_type">활동구분</label>
            <label for="field">봉사분야</label>
            <label for="target_group">봉사대상</label>
            <label for="recruitment_status">모집상태</label>
        </div>
        <div class="form-row">
            <select id="region" name="region">
                <option value="">전체포함</option>
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
            <select id="activity_type" name="activity_type" >
                <option value="">전체포함</option>
                <option value="온라인">온라인</option>
                <option value="오프라인">오프라인</option>
            </select>
            <select id="field" name="field" >
            </select>
            <select id="target_group" name="target_group" >
                <option value="">전체포함</option>
                <option value="아동청소년">아동청소년</option>
                <option value="장애인">장애인</option>
                <option value="노인">노인</option>
                <option value="다문화가정">다문화가정</option>
            </select>
            <select id="recruitment_status" name="recruitment_status" >
                <option value="">전체포함</option>
                <option value="모집중">모집중</option>
                <option value="모집완료">모집완료</option>
            </select>
        </div>

        <div class="form-row">
            <label for="start_date">봉사기간</label>
        </div>
        <div class="form-row2">
            <input type="date" id="start_date" name="start_date" value="2024-01-01">
            <span style="margin: 0 -7px;">~</span>
            <input type="date" id="end_date" name="end_date" value="2024-12-31">         
            <input type="text" style ="width:270px" id="search" name="search" placeholder="상세검색">
            <input type="submit" value="검색" id="submit">
            <input type="reset" value="초기화">
            <button type="button">글쓰기</button>
            <button type="button" location>뒤로가기</button>
        </div>
    </form>
    </div>
</body>
</html>
<script>
    const fieldSelect = document.getElementById('field');
    const activity_typeSelect = document.getElementById('activity_type');

   /*  window.onload = ()=> {
    	var test = document.getElementById("submit");
    	test.click();
    } */
    const fields = {
    		  "": [
    	            { value: "[온라인] 번역 및 콘텐츠 제작", text: "[온라인] 번역 및 콘텐츠 제작" },
    	            { value: "[온라인] 멘토링 및 상담", text: "[온라인] 멘토링 및 상담" },
    	            { value: "[온라인] 디지털 서포터", text: "[온라인] 디지털 서포터" },
    	            { value: "[온라인] 사회적 캠페인 참여", text: "[온라인] 사회적 캠페인 참여" },
    	            { value: "[오프라인] 환경 보호 활동", text: "[오프라인] 환경 보호 활동" },
    	            { value: "[오프라인] 사회복지시설 지원", text: "[오프라인] 사회복지시설 지원" },
    	            { value: "[오프라인] 교육 봉사", text: "[오프라인] 교육 봉사" },
    	            { value: "[오프라인] 건강 및 의료 봉사", text: "[오프라인] 건강 및 의료 봉사" },
    	            { value: "[오프라인] 문화 및 예술 활동 지원", text: "[오프라인] 문화 및 예술 활동 지원" }
    	        ],
    	        온라인: [
    	        	{ value: "[온라인] 번역 및 콘텐츠 제작", text: "[온라인] 번역 및 콘텐츠 제작" },
    	            { value: "[온라인] 멘토링 및 상담", text: "[온라인] 멘토링 및 상담" },
    	            { value: "[온라인] 디지털 서포터", text: "[온라인] 디지털 서포터" },
    	            { value: "[온라인] 사회적 캠페인 참여", text: "[온라인] 사회적 캠페인 참여" }
    	        ],
    	        오프라인: [
    	        	{ value: "[오프라인] 환경 보호 활동", text: "[오프라인] 환경 보호 활동" },
    	            { value: "[오프라인] 사회복지시설 지원", text: "[오프라인] 사회복지시설 지원" },
    	            { value: "[오프라인] 교육 봉사", text: "[오프라인] 교육 봉사" },
    	            { value: "[오프라인] 건강 및 의료 봉사", text: "[오프라인] 건강 및 의료 봉사" },
    	            { value: "[오프라인] 문화 및 예술 활동 지원", text: "[오프라인] 문화 및 예술 활동 지원" }
    	        ]
    };

    function updatefieldOptions(activity_type) {
        const fieldsToShow = fields[activity_type] || fields[""];
        fieldSelect.innerHTML = '<option value="">전체포함</option>';
        fieldsToShow.forEach(field => {
            const option = document.createElement('option');
            option.value = field.value;
            option.textContent = field.text;
            fieldSelect.appendChild(option);
        });
    }

    activity_typeSelect.addEventListener('change', (event) => {
        updatefieldOptions(event.target.value);
    });

    // Initialize the field options based on the default selected value
    updatefieldOptions(activity_typeSelect.value);
</script>
  