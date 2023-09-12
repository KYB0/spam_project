<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석 예약</title>
</head>
<body>
    <h1>좌석 예약 페이지</h1>
    <form action="/spam/reservation/create" method="post">
        <label for="seatNumber">좌석 선택:</label>
        <select id="seatNumber" name="seatId">
            <c:forEach items="${seatList}" var="seat">
                <option value="${seat.id}">${seat.seatNumber}</option>
            </c:forEach>
        </select>
        <br>
        <label for="startTime">시작 시간:</label>
        <input type="datetime-local" id="startTime" name="startTime" required>
        <br>
        <label for="endTime">종료 시간:</label>
        <input type="datetime-local" id="endTime" name="endTime" required>
        <br>
        <label for="customerName">예약자 이름:</label>
        <input type="text" id="customerName" name="customerName" required>
        <br>
        <input type="submit" value="예약하기">
    </form>
</body>
</html>
