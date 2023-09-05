<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
    </script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
    <section class="list-form">
        <h1>예약 및 리뷰 내역</h1>
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