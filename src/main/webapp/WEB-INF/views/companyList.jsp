<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM : 기업:고객 수</title>
    <style>
       .c_list{
    position: relative; /* 상대 위치 지정 */
    left: 20%;
    top: 20%;
    transform: translate(-20%, -20%); /* 화면 중앙 정렬을 위한 transform 사용 */
}

.c_list h1 {
position: fixed; /* 고정 위치 지정 */
left: 20%; /* 왼쪽에서 20% */
top: -100%; /* 위에서 20% */
transform: translate(-20%, 100%); /* 화면 중앙 정렬을 위한 transform 사용 */
}

.c_monthlist {
    position: absolute;
left: 30%;
top: calc(20% + 250px); /* c_mypage 하단에서 100px 아래로 이동 */
transform: translate(-30%, -20%);
height: 250px; /* 높이 설정, 원하는 높이로 조정하세요 */
}

.c_monthlist h4 {
white-space: nowrap; /* 텍스트를 한 줄로 고정 */
}

.c_menu {
display: flex; /* Flexbox 사용 */
flex-direction: column; /* 세로로 정렬 */
align-items: center; /* 가운데 정렬 */
position: absolute;
left: 5%; /* 왼쪽에서 10% 여백 */
top: 30%; /* 위에서 20% 여백 */
}

.btn_cmenu {
display: flex;
flex-direction: column; /* 세로로 정렬 */
gap: 10px; /* 버튼 사이의 간격 조절 */
}

.btn_cmenu button {
/* 버튼 스타일 */
padding: 10px 20px;
background-color: #322A31;
color: #DCE682;
border: none;
cursor: pointer;
width: 120px; /* 버튼 상자 너비 설정 */
height: 50px; /* 버튼 상자 높이 설정 */
}
    </style>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
</head>
<body>
    <%@ include file="header.jsp" %>
    <section class="c_list">
        <h1>고객 수</h1>
        <div class="c_monthlist">
            <h4>월별 이용자 수</h4>
            /*그래프*/
        </div>
    </section>
    <section class="c_menu">
        <div class="btn_cmenu">
            <a href="/spam/c_mypage"><button id="cmyp">마이페이지</button></a>
            <a href="/spam/c_mypage/list"><button id="clist">고객 수</button></a>
            <a href="/spam/c_mypage/insert"><button id="cinsert">등록 및 수정</button></a>
            <a href="/spam/c_mypage/resign"><button id="cresign">퇴점 신청</button></a>
        </div>
    </section>
    <%@ include file="footer.jsp" %>
</body>
</html>