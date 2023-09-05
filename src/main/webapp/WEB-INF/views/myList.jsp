<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 및 리뷰 내역</title>
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
                    <th scope="col">예약 ID</th>
                    <th scope="col">고객 ID</th>
                    <th scope="col">좌석 ID</th>
                    <th scope="col">시작 시간</th>
                    <th scope="col">종료 시간</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reservationList}" var="reservation">
                    <tr>
                        <td>${reservation.reservation_id}</td>
                        <td>${reservation.customer_id}</td>
                        <td>${reservation.seat_number}</td>
                        <td>${reservation.start_time}</td>
                        <td>${reservation.end_time}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</body>
</html>
