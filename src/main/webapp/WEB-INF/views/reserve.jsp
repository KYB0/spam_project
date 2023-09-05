<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>좌석 예약</title>
    <style>
        /* 좌석 스타일링 */
        .seat {
            width: 40px;
            height: 40px;
            background-color: #ccc;
            border: 1px solid #aaa;
            text-align: center;
            line-height: 40px;
            cursor: pointer;
        }

        /* 선택된 좌석 스타일 */
        .seat.selected {
            background-color: #00aaff;
            color: #fff;
        }

        /* 테이블 스타일링 */
        table {
            border-collapse: collapse;
            margin-top: 20px;
        }

        td {
            padding: 5px;
        }
    </style>
</head>

<body>
    <h1>좌석 예약</h1>
    <form action="/spam/seat-reservations/reserve" method="post">
        <!-- 필요한 입력 필드 추가 -->
        <label for="customer_id">고객:</label>
        <input type="text" id="customer_id" name="customer_id" required value="${customer_id}"><br><br>
        <label for="seat_id">좌석 번호:</label>
        <input type="text" id="seat_number" name="seat_number" required><br><br>
        <label for="start_time">시작 시간:</label>
        <input type="datetime-local" id="start_time" name="start_time" required><br><br>
        <label for="end_time">종료 시간:</label>
        <input type="datetime-local" id="end_time" name="end_time" required><br><br>
        <input type="submit" value="예약">
    </form>

    <!-- 좌석 배치도 추가 -->
    <h2>좌석 배치도</h2>
    <table>
        <tr>
            <td class="seat">1</td>
            <td class="seat">2</td>
            <td class="seat">3</td>
            <!-- 원하는 좌석 수와 형태로 계속 추가 가능 -->
        </tr>
        <tr>
            <td class="seat">4</td>
            <td class="seat">5</td>
            <td class="seat">6</td>
        </tr>
    </table>

    <script>
        // JavaScript 코드를 사용하여 좌석 선택 기능 구현
        let selectedSeat = null;

        // 좌석 클릭 이벤트 처리
        document.querySelectorAll(".seat").forEach(function (seat) {
            seat.addEventListener("click", function () {
                // 선택된 좌석이 있으면 선택 해제
                if (selectedSeat) {
                    selectedSeat.classList.remove("selected");
                }

                // 현재 클릭한 좌석을 선택
                this.classList.add("selected");
                selectedSeat = this;

                // 선택한 좌석 번호를 입력 필드에 업데이트
                document.getElementById("seat_number").value = this.textContent;
            });
        });
    </script>
</body>

</html>
