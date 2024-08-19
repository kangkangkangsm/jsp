<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 봉사추가 홈페이지</title>
    <style>
   * {
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #ffffff;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
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

    .container {
        border-radius: 8px;
        margin-top: 150px;
        background-color: #ffffff;
        padding: 20px 5%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%; /* Adjust width as needed */
    }

    h2 {
        text-align: center;
        margin-bottom: 20px; /* Adjust as needed */
        color: #333;
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
   		float:right;
        justify-content: space-between;
        width: 8%;
        padding: 10px;
        background-color: #00BFFF;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        margin-left:10px;
    }

    button:hover,
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #1E90FF;
    }

    .footer {
        text-align: center;
        padding: 10px;
        background-color: #009688;
        color: #fff;
        margin-top: 20px;
        width: 100%;
    }
    
       .form-row3 {
        display: flex;
        
        
        margin-bottom: 15px;
    }

    .form-row3 input[type="date"],
    .form-row3 select {
        width: 18%;
        padding: 10px;
        margin-right: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-row3 input[type="text"] {
        width: 18%;
        padding: 10px;
        margin-right: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    
  </style>
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container">
    <form action="actBoard_update-result.jsp" method="get">
    <%@include file="db.jsp"%>	

<%
        ResultSet rs = null;
        Statement stmt = null;
        String id = request.getParameter("id");     
        stmt = conn.createStatement();
        String querytext = "SELECT * FROM volunteering WHERE id ='" + id + "'"; 
        rs = stmt.executeQuery(querytext);              
        System.out.println(querytext);
        
       	if(rs.next()){
       	
%>
<input type="hidden" id="id" name="id" value="<%= rs.getString("id") %>">
        <h2>수정하기</h2>
	
        <!-- First Row -->
        <div class="form-row">
            <label for="region">봉사 소속지역</label>
            <label for="activity_type">활동구분</label>
            <label for="field">봉사분야</label>
            <label for="target_group">봉사대상</label>
            <label for="recruitment_status">모집상태</label>
        </div>
        <div class="form-row">
            <select id="region" name="region" required>
                <option value="<%= rs.getString("region") %>"><%= rs.getString("region") %></option>
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
            <select id="activity_type" name="activity_type" required>
                  <option value="<%= rs.getString("activity_type") %>"><%= rs.getString("activity_type") %></option>
                  <option value="">전체포함</option>
                <option value="온라인">온라인</option>
                <option value="오프라인">오프라인</option>
            </select>
            <select id="field" name="field"  required >
            </select>
            <select id="target_group" name="target_group" required>
                <option value="<%= rs.getString("target_group") %>"><%= rs.getString("target_group") %></option>
                <option value="아동청소년">아동청소년</option>
                <option value="장애인">장애인</option>
                <option value="노인">노인</option>
                <option value="다문화가정">다문화가정</option>
            </select>
            <select id="recruitment_status" name="recruitment_status" required>
               <option value="<%= rs.getString("recruitment_status") %>"><%= rs.getString("recruitment_status") %></option>
                <option value="모집중">모집중</option>
                <option value="모집완료">모집완료</option>
            </select>
        </div>

         <div class="form-row2">
            <label for="start_date">봉사기간(시작일)</label>
            <label style="margin-left:150px" for="start_date">(종료일)</label>
             <label style="margin-left:214px;" for="mn_people">모집 인원수</label>
        </div>
        <div class="form-row3">
            <input type="date" id="start_date" name="start_date" value="<%= rs.getString("start_date") %>">
            <span style="margin: 0 4px; margin-top:10px;">~</span>
            <input style="margin-left:8px" type="date" id="end_date" name="end_date" value="<%= rs.getString("end_date") %>">    
            <input type="text" style="margin-left:30px;" id="mn_people" name="mn_people" placeholder="인원수"  value="<%= rs.getString("mn_people") %>">        
        </div>
          <div class="form-row">
            <label for="title" >제목</label>
        </div>
          <div class="form-row">
        <input type="text" id="title" name="title" placeholder="제목" style="width:100%;" value="<%= rs.getString("title") %>">
        </div>    
          <div class="form-row">
            <label for="contents" >내용</label>
        </div>
          <div class="form-row">
        <input type="text" id="contents" name="contents" placeholder="내용" style="width:100%; height:250px;" value="<%= rs.getString("contents") %>">
        </div>    
            <button type="button" onclick="history.back()">취소</button>
            <input type="submit" value="저장">
    </form>
</div>

<%} %>

</body>
</html>
<script>
    const fieldSelect = document.getElementById('field');
    const activity_typeSelect = document.getElementById('activity_type');
   

    const fields = {
        ALL: [
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
        const fieldsToShow = fields[activity_type] || fields['ALL'];
        fieldSelect.innerHTML = '<option value="">선택하세요</option>'; // 기본 옵션
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
  