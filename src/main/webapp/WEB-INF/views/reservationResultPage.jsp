<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 결과</title>
</head>
<body>
    <h1>예약 결과</h1>
    <p>예약이 성공적으로 생성되었습니다.</p>
    <p>예약 정보:</p>
    <ul>
        <li>좌석: ${reservationResult.seatName}</li>
        <li>시작 시간: ${reservationResult.startTime}</li>
        <li>종료 시간: ${reservationResult.endTime}</li>
        <!-- 기타 예약 정보 표시 -->
    </ul>
    <p><a href="/spam/reservation/create">새로운 예약 생성</a></p>
</body>
</html>
