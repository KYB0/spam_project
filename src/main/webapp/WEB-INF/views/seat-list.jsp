<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>좌석 예약 목록</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>

<body>
    <h1>좌석 예약 목록</h1>
    <table border="1">
        <tr>
            <th>예약 ID</th>
            <th>고객 ID</th>
            <th>좌석 ID</th>
            <th>시작 시간</th>
            <th>종료 시간</th>
        </tr>
        <c:forEach var="reservation" items="${seatReservations}">
            <tr>
                <td>${reservation.reservation_id}</td>
                <td>${reservation.customer_id}</td>
                <td>${reservation.seat_id}</td>
                <td>${reservation.start_time}</td>
                <td>${reservation.end_time}</td>
            </tr>
        </c:forEach>
    </table>
</body>

</html>