<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>달력</title>
    <style>
        table {
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
            text-align: center;
        }

        th, td {
            padding: 10px;
        }
    </style>
    <script src="js/code.jquery.com_jquery-3.7.0.min.js"></script>
</head>
<body>
    <h1>달력</h1>
    <table>
        <tr>
            <th>일</th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th>토</th>
        </tr>
        <tbody id="calendar-body"></tbody>
    </table>
    <div id="reservation">
        <h2>예약 시간 선택</h2>
        <div id="selected-date"></div>
        <select id="time-slots"></select>
    </div>

    <script>
        // JavaScript 코드를 사용하여 달력을 생성합니다.

        // 현재 날짜를 가져옵니다.
        const currentDate = new Date();

        // 달력을 생성할 년도와 월을 설정합니다.
        const year = currentDate.getFullYear();
        const month = currentDate.getMonth();

        // 해당 월의 첫 번째 날과 마지막 날을 계산합니다.
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);

        // 달력의 테이블 요소와 tbody 요소를 가져옵니다.
        const calendarTable = document.querySelector('table');
        const calendarBody = document.getElementById('calendar-body');

        // 달력 헤더에 현재 년도와 월을 표시합니다.
        calendarTable.querySelector('th').textContent = `${year}년 ${month + 1}월`;

        // 달력을 생성합니다.
        let currentDatePointer = new Date(firstDay); // 포인터를 첫 번째 날로 설정합니다.

        while (currentDatePointer <= lastDay) {
            // 새로운 행을 생성합니다.
            const newRow = document.createElement('tr');

            // 요일별로 셀을 생성합니다.
            for (let i = 0; i < 7; i++) {
                const newCell = document.createElement('td');
                newCell.textContent = currentDatePointer.getDate(); // 날짜를 표시합니다.

                // 현재 날짜와 다르면 텍스트를 회색으로 표시합니다.
                if (currentDatePointer.getMonth() !== month) {
                    newCell.style.color = 'gray';
                }

                // 날짜 셀을 클릭할 때 선택된 날짜를 업데이트하고 예약 가능한 시간을 표시합니다.
                newCell.addEventListener('click', () => {
                    const selectedDate = new Date(currentDatePointer); // 선택된 날짜를 복사
                    const year = selectedDate.getFullYear();
                    const month = selectedDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
                    const date = selectedDate.getDate();
                    const formattedDate = `${year}년 ${month}월 ${date}일`;

                    // 선택된 날짜를 표시합니다.
                    document.getElementById('selected-date').textContent = formattedDate;

                    // 예약 가능한 시간을 업데이트합니다. (예시 시간 사용)
                    updateAvailableTimeSlots(year, month, date);
                });

                newRow.appendChild(newCell);
                currentDatePointer.setDate(currentDatePointer.getDate() + 1); // 다음 날짜로 이동합니다.
            }

            calendarBody.appendChild(newRow); // 행을 tbody에 추가합니다.
        }

        // 예약 가능한 시간을 업데이트하는 함수 (예시 시간 사용)
        function updateAvailableTimeSlots(year, month, date) {
            const timeSlotsSelect = document.getElementById('time-slots');

            // 셀렉트 박스 초기화
            timeSlotsSelect.innerHTML = '';

            // 예약 가능한 시간을 추가 (예시)
            const availableTimeSlots = [
                '09:00 AM', '10:00 AM', '11:00 AM',
                '01:00 PM', '02:00 PM', '03:00 PM'
            ];

            // 셀렉트 박스에 시간 옵션 추가
            availableTimeSlots.forEach((timeSlot) => {
                const option = document.createElement('option');
                option.value = timeSlot;
                option.textContent = timeSlot;
                timeSlotsSelect.appendChild(option);
            });
        }
    </script>
</body>
</html>
