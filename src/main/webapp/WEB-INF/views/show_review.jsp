<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/spam/css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
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

    <section class="list-form">
        <a href="/spam/i_mypage/list">예약 내역</a>
        <a href="/spam/i_mypage/list/review_list">내가 작성한 리뷰</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">리뷰 ID</th>
                    <th scope="col">리뷰 내용</th>
                    <th scope="col">별점</th>
                    <th scope="col">고객 ID</th>
                    <th scope="col">업체 코드</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reviewList}" var="review">
                    <tr>
                        <td>${review.review_id}</td>
                        <td>${review.review_content}</td>
                        <td>${review.rating}</td>
                        <td>${review.customer_id}</td>
                        <td>${review.room_id}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</body>
</html>