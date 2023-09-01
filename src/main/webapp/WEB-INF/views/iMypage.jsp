<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <link rel="stylesheet" href="/spam/css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/mypage.js"></script>
    <!-- <script src="/spam/js/i_join.js"></script> -->
</head>

<body>

    <div class="sidebar">
        <h4><a href="${pageContext.request.contextPath}/member/i_mypage" class="active">마이 페이지</a>
            <a href="${pageContext.request.contextPath}/i_mypage/review">이용 후기</a>
            <a href="${pageContext.request.contextPath}/i_mypage/list">예약 및 리뷰 내역</a>
            <a href="${pageContext.request.contextPath}/i_mypage/myqna">나의 문의 내역</a></h4>
        <!-- 원하는 메뉴 항목들을 추가할 수 있습니다. -->
    </div>

    <div class="favoriteRooms">
        <h2>찜한 독서실 목록</h2>
        <!-- 여기에 찜한 독서실 목록을 표시하는 내용을 추가하세요. -->
    </div>

    <div class="mpContent">
        <h2>Edit My Page
            <form action="/spam/member/i_mypage" method="post" onsubmit="return updateAlert();">
                <p>
                    <div>
                        <label for="name">이름:</label>
                        <input type="text" id="customer_name" name="customer_name"
                            value="${customerMemberDto.customer_name}" readonly>
                    </div>
                </p>
                <p>
                    <div>
                        <label for="username">아이디:</label>
                        <input type="text" id="customer_id" name="customer_id" value="${customerMemberDto.customer_id}"
                            readonly>
                    </div>
                </p>
                <p>
                    <div>
                        <label for="password">비밀번호:</label>
                        <input type="password" id="customer_pwd" name="customer_pwd">
                    </div>
                </p>
                <p>
                    <div>
                        <label for="confirmPassword">비밀번호 확인:</label>
                        <input type="password" id="customer_pwd_re" name="customer_pwd">
                    </div>
                </p>
                <p>
                    <div>
                        <label for="phoneNumber">전화번호:</label>
                        <input type="tel" id="customer_phone" name="customer_phone"
                            value="${customerMemberDto.customer_phone}" required maxlength="13"
                            pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}">
                    </div>
                </p>
                <p>
                    <div>
                        <label for="email">이메일:</label>
                        <input type="email" id="customer_email" name="customer_email"
                            value="${customerMemberDto.customer_email}">
                    </div>
                </p>

                <button type="submit" name="resignButton">회원 탈퇴</button>
                <button type="submit" name="updateButton">수정 완료</button></h2>
        </form>
    </div>

</body>

</html>