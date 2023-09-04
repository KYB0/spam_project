<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>좌석 예약</h1>

    <form action="reserve" method="post">
        <input type="hidden" name="seatNumber" value="${param.seatNumber}" />

        <label for="reservationDate">예약 날짜:</label>
        <input type="date" id="reservationDate" name="reservationDate" required /><br />

        <label for="startTime">시작 시간:</label>
        <input type="time" id="startTime" name="startTime" required /><br />

        <label for="endTime">종료 시간:</label>
        <input type="time" id="endTime" name="endTime" required /><br />

        <label for="customerName">이름:</label>
        <input type="text" id="customerName" name="customerName" required /><br />

        <label for="paymentMethod">결제 수단:</label>
        <select id="paymentMethod" name="paymentMethod" required>
            <option value="신용 카드">신용 카드</option>
            <option value="현금">현금</option>
        </select><br />

        <input type="submit" value="예약" />
    </form>
</body>

</html>