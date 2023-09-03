<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>예약 목록</title>
            <!-- ... Your existing code ... -->

            <!-- Include jQuery -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <!-- Include jQuery datetimepicker plugin -->
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

            <!-- ... Your existing code ... -->
        </head>


        <body>
            <h1>예약 목록</h1>

            <!-- 예약 목록을 표시하기 위한 테이블 -->
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>고객 ID</th>
                    <th>좌석 번호</th>
                    <th>예약 시간</th>
                    <th>상세 정보</th>
                </tr>
                <c:forEach var="reservation" items="${reservations}">
                    <tr>
                        <td>${reservation.reservationId}</td>
                        <td>${reservation.customerId}</td>
                        <td>${reservation.seatNumber}</td>
                        <td>${reservation.reservationTime}</td>
                        <td><a href="<c:url value='/reservations/${reservation.reservationId}'/>">상세 보기</a></td>
                    </tr>
                </c:forEach>
            </table>

            <!-- 새로운 예약을 만들기 위한 폼 -->
            <h2>새로운 예약 생성</h2>
            <form action="<c:url value='/reservations'/>" method="post">
                <label for="customerId">고객 ID:</label>
                <input type="text" id="customerId" name="customerId" required><br>

                <label for="seatNumber">좌석 번호:</label>
                <input type="number" id="seatNumber" name="seatNumber" required><br>

                <!-- 날짜 및 시간 선택 -->
                <label for="reservationStartTime">시작 시간:</label>
                <input type="text" id="reservationStartTime" name="reservationStartTime" required>

                <label for="reservationEndTime">종료 시간:</label>
                <input type="text" id="reservationEndTime" name="reservationEndTime" required>



                <input type="submit" value="예약 생성">
            </form>
            <script>
                $(document).ready(function () {
                    // 시작 시간 datetimepicker 설정
                    $('#reservationStartTime').datetimepicker({
                        format: 'Y-m-d H:i', // 표시 형식 정의
                        step: 60, // 시간 간격 (분 단위)을 60분(1시간)으로 정의
                    });
            
                    // 종료 시간 datetimepicker 설정
                    $('#reservationEndTime').datetimepicker({
                        format: 'Y-m-d H:i', // 표시 형식 정의
                        step: 60, // 시간 간격 (분 단위)을 60분(1시간)으로 정의
                    });
            
                    // 시작 시간이 변경되면 종료 시간의 최소값(minDate)을 업데이트
                    $('#reservationStartTime').on('change', function (e) {
                        $('#reservationEndTime').datetimepicker('setOptions', {
                            minDate: e.target.value
                        });
                    });
            
                    // 종료 시간이 변경되면 시작 시간의 최대값(maxDate)을 업데이트
                    $('#reservationEndTime').on('change', function (e) {
                        $('#reservationStartTime').datetimepicker('setOptions', {
                            maxDate: e.target.value
                        });
                    });
                });
            </script>
            
            
        </body>

        </html>