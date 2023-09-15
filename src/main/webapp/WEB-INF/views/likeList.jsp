﻿<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/spam/css/mypage.css">
</head>
<body>

    <section class="i_menu">
        <div class="btn_i_menu">
            <a href="${pageContext.request.contextPath}/i_mypage" class="active"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>마이페이지</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list/like_list" id="button--open"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>찜 목록</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>예약 및 리뷰</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/myqna"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>나의 문의 내역</button></a>
            <!-- 원하는 메뉴 항목들을 추가할 수 있습니다. -->
        </div>
    </section>

</body>
</html>