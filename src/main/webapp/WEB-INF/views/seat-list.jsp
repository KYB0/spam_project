<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>좌석 목록</title>
    </head>

    <body>
        <h1>좌석 목록</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>좌석 ID</th>
                    <th>좌석 번호</th>
                    <th>룸 ID</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${seats}" var="seat">
                    <tr>
                        <td>${seat.seatId}</td>
                        <td>${seat.seatNum}</td>
                        <td>${seat.roomId}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="/spam/reserve-seat">좌석 예약하기</a>
    </body>

    </html>