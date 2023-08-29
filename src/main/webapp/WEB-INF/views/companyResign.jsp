<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM : 기업:퇴점 탈퇴</title>
    <style>
        .c_apply {
            position: relative;
            /* 상대 위치 지정 */
            left: 20%;
            top: 20%;
            transform: translate(-20%, -20%);
            /* 화면 중앙 정렬을 위한 transform 사용 */
        }

        .c_apply h1 {
            position: fixed;
            /* 고정 위치 지정 */
            left: 20%;
            /* 왼쪽에서 20% */
            top: -100%;
            /* 위에서 20% */
            transform: translate(-20%, 100%);
            /* 화면 중앙 정렬을 위한 transform 사용 */
        }

        .c_resign {
            position: absolute;
            left: 30%;
            top: calc(20% + 250px);
            /* c_mypage 하단에서 100px 아래로 이동 */
            transform: translate(-30%, -20%);
            height: 250px;
            /* 높이 설정, 원하는 높이로 조정하세요 */
        }

        .c_resign h4 {
            white-space: nowrap;
            /* 텍스트를 한 줄로 고정 */
        }

        .c_quit {
            position: absolute;
            left: 30%;
            /* 변경: right에서 left로 */
            top: calc(20% + 550px);
            /* c_mypage 하단에서 100px 아래로 이동 */
            transform: translate(-30%, -20%);
            /* 변경: right에서 left로 */
            height: 250px;
            /* 높이 설정, 원하는 높이로 조정하세요 */
        }

        .c_quit h4 {
            white-space: nowrap;
            /* 텍스트를 한 줄로 고정 */
        }

        .qna_box {
            background-color: #322A31;
            /* 배경색을 검은색으로 지정 */
            color: #DCE682;
            /* 텍스트 색상을 흰색으로 지정 */
            padding: 10px;
            /* 내용과 테두리 사이에 간격을 지정 */
            border-radius: 5px;
            /* 네모칸의 모서리를 둥글게 만듭니다. */
            width: 400px;
            /* 네모칸의 가로 길이를 조정합니다. */
        }

        .qna_post {
            background-color: #fff;
            /* 배경색을 검은색으로 지정 */
            color: #322A31;
            /* 텍스트 색상을 흰색으로 지정 */
            padding: 10px;
            /* 내용과 테두리 사이에 간격을 지정 */
            border-radius: 5px;
            /* 네모칸의 모서리를 둥글게 만듭니다. */
            width: 370px;
            /* 네모칸의 가로 길이를 조정합니다. */
        }

        .c_menu {
            display: flex;
            /* Flexbox 사용 */
            flex-direction: column;
            /* 세로로 정렬 */
            align-items: center;
            /* 가운데 정렬 */
            position: absolute;
            left: 5%;
            /* 왼쪽에서 10% 여백 */
            top: 30%;
            /* 위에서 20% 여백 */
        }

        .btn_cmenu {
            display: flex;
            flex-direction: column;
            /* 세로로 정렬 */
            gap: 10px;
            /* 버튼 사이의 간격 조절 */
        }

        .btn_cmenu button {
            /* 버튼 스타일 */
            padding: 10px 20px;
            background-color: #322A31;
            color: #DCE682;
            border: none;
            cursor: pointer;
            width: 120px;
            /* 버튼 상자 너비 설정 */
            height: 50px;
            /* 버튼 상자 높이 설정 */
        }

        #r_agree{
            position: absolute;
            left: 150%;
            /* 왼쪽에서 10% 여백 */
            top: 40%;
            /* 위에서 20% 여백 */
        }

        #r_request{
            position: absolute;
            left: 650%;
            /* 왼쪽에서 10% 여백 */
            top: 40%;
            /* 위에서 20% 여백 */
        }

        #r_quit {
            position: absolute;
            left: 650%;
            /* 왼쪽에서 10% 여백 */
            top: 40%;
            /* 위에서 20% 여백 */
        }

        .c_resign button,
        .c_quit button {
            padding: 10px 20px;
            background-color: #322A31;
            color: #DCE682;
            border: none;
            cursor: pointer;
            width: 120px;
            height: 50px;
            margin: 5px;
        }
    </style>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
</head>

<body>
    <%@ include file="header.jsp" %>
    <section class="c_apply">
        <h1>퇴점 신청</h1>
        <div class="c_resign">
            <h4>퇴점 신청</h4>
            <div class="resign_agree">
                <button id="r_agree">약관 동의</button>
                <button id="r_request">퇴점 신청</button>
            </div>
        </div>
        <div class="c_quit">
            <h4>탈퇴 신청</h4>
            <div class="resign_quit">
                <button id="r_quit">탈퇴 신청</button>
            </div>
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
<script>
    // 탈퇴 신청 버튼 클릭 이벤트 처리
    document.getElementById("r_quit").addEventListener("click", function() {
        // 알림창 표시
        alert("탈퇴가 완료되었습니다.");
    });
</script>
</html>