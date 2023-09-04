<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>좌석 예약</title>
    </head>

    <body>
        <h1>좌석 예약</h1>
        <form action="/spam/seat-reservations/reserve" method="post">
            <!-- 필요한 입력 필드 추가 -->
            <label for="customer_id">고객 ID:</label>
            <input type="text" id="customer_id" name="customer_id" required><br><br>
            <label for="seat_id">좌석 ID:</label>
            <input type="text" id="seat_id" name="seat_id" required><br><br>
            <label for="start_time">시작 시간:</label>
            <input type="datetime-local" id="start_time" name="start_time" required><br><br>
            <label for="end_time">종료 시간:</label>
            <input type="datetime-local" id="end_time" name="end_time" required><br><br>
            <input type="submit" value="예약">
        </form>
    </body>

    </html>