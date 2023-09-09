<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/mypage.js"></script>
    <link rel="stylesheet" href="/spam/css/mypage.css">
    <!-- <script src="/spam/js/i_join.js"></script> -->
</head>

<body>

    <section class="i_menu">
        <div class="btn_i_menu">
            <a href="${pageContext.request.contextPath}/i_mypage" class="active"><button id="i_myp">마이페이지</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list/like_list" id="button--open"><button id="iike_list">찜 목록</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list"><button id="i_list">예약 및 리뷰 내역</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/myqna"><button id="I_myQna">나의 문의 내역</button></a>
            <!-- 원하는 메뉴 항목들을 추가할 수 있습니다. -->
        </div>
    </section>

    <div class="list-form">
        <h2>Edit My Page
            <form id="memberInfo" method="post">
                <div>
                    <label for="name">이름:</label>
                    <input type="text" id="customer_name" name="customer_name"
                        value="${customerMemberDto.customer_name}" readonly>
                </div>
                <div>
                    <label for="username">아이디:</label>
                    <input type="text" id="customer_id" name="customer_id" value="${customerMemberDto.customer_id}"
                        readonly>
                </div>
                <div>
                    <label for="password">비밀번호:</label>
                    <input type="password" id="customer_pwd" name="customer_pwd">
                </div>
                <div>
                    <label for="confirmPassword">비밀번호 확인:</label>
                    <input type="password" id="customer_pwd_re" name="customer_pwd">
                </div>
                <div>
                    <label for="phoneNumber">전화번호:</label>
                    <input type="tel" id="customer_phone" name="customer_phone"
                        value="${customerMemberDto.customer_phone}" required maxlength="13"
                        pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}">
                </div>
                <div>
                    <label for="email">이메일:</label>
                    <input type="email" id="customer_email" name="customer_email"
                        value="${customerMemberDto.customer_email}">
                </div>

                <button type="submit" onclick="return resignAlert();" name="resignButton">회원 탈퇴</button>
                <button type="submit" onclick="return updateAlert();" name="updateButton">수정 완료</button>
        </h2>
        </form>

    </div>

</body>

</html>