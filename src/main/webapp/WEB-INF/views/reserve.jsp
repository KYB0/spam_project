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

        /* 예약된 좌석 스타일 */
        .seat.reserved {
            background-color: red;
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
        <input type="text" id="customer_id" name="customer_id" readonly required value="${customer_id}"><br><br>
        <label for="seat_id">좌석 번호:</label>
        <input type="text" id="seat_number" name="seat_number"  autocomplete="off" required><br><br>
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
            <td class="seat" data-seat-number="1">1</td>
            <td class="seat" data-seat-number="2">2</td>
            <td class="seat" data-seat-number="3">3</td>
            <!-- 원하는 좌석 수와 형태로 계속 추가 가능 -->
        </tr>
        <tr>
            <td class="seat" data-seat-number="4">4</td>
            <td class="seat" data-seat-number="5">5</td>
            <td class="seat" data-seat-number="6">6</td>
        </tr>
    </table>

    <script>
        // URL에서 방 ID를 추출하는 함수
        function getRoomIdFromURL() {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get('room_id'); // URL의 쿼리 매개변수로 정의한 이름에 따라 다를 수 있습니다.
        }

        // 좌석 정보를 백엔드에서 받아오는 함수 (JSON 형식으로 받아온다고 가정)
        function fetchSeatsFromBackend(roomId) {
            return fetch(`/backend/seats?room_id=${roomId}`) // 백엔드 API 엔드포인트에 방 ID를 포함하여 요청합니다.
                .then(response => response.json())
                .catch(error => {
                    console.error('Error fetching seats:', error);
                    return [];
                });
        }

        // 좌석 예약 기능 추가
        function reserveSeat(seatNumber, customerId, startTime, endTime) {
            // 서버로 예약 요청 보내기
            fetch('/backend/seats/reserve/' + seatNumber, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    customer_id: customerId,
                    start_time: startTime,
                    end_time: endTime,
                }),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('좌석이 성공적으로 예약되었습니다.');
                    // 예약에 성공한 경우, 원하는 UI 업데이트 등을 수행할 수 있습니다.
                } else {
                    alert('좌석 예약에 실패했습니다. 다시 시도하세요.');
                }
            })
            .catch(error => {
                console.error('Error reserving seat:', error);
                alert('예약 중 오류가 발생했습니다.');
            });
        }

        // 예약 버튼 클릭 시 이벤트 처리
        document.querySelector('form').addEventListener('submit', function (event) {
            event.preventDefault(); // 기본 form 제출 동작 방지
            const customerId = document.getElementById('customer_id').value;
            const seatNumber = document.getElementById('seat_number').value;
            const startTime = document.getElementById('start_time').value;
            const endTime = document.getElementById('end_time').value;
            
            // 좌석 예약 함수 호출
            reserveSeat(seatNumber, customerId, startTime, endTime);
        });

        // 방 ID를 추출하여 해당 방의 좌석만 표시
        const roomId = getRoomIdFromURL();
        if (roomId) {
            fetchSeatsFromBackend(roomId).then(seats => {
                // 모든 좌석을 숨김
                document.querySelectorAll(".seat").forEach(seat => {
                    seat.style.display = "none";
                });

                seats.forEach(seat => {
                    // 좌석이 예약되어 있는 경우 배경색을 변경
                    const seatElement = document.querySelector(
                        `.seat[data-seat-number="${seat.seat_number}"]`);
                    if (seat.is_reserved) {
                        seatElement.style.backgroundColor = "red"; // 원하는 스타일로 변경하세요.
                        seatElement.classList.add("reserved");
                    } else {
                        // 예약되지 않은 좌석만 표시
                        seatElement.style.display = "block";
                    }
                });
            });
        }
    </script>
</body>

</html>
