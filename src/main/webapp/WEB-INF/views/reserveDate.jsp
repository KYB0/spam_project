<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.18/jquery.timepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.18/jquery.timepicker.min.css">
</head>
<body>

<label for="datepicker">날짜 선택:</label>
<input type="text" id="datepicker">

<label for="timepicker">시간 선택:</label>
<input type="text" id="timepicker">

<script>
    // 예약된 시간 배열 (예제로 몇 가지 시간을 추가했습니다)
    const reservedTimes = ["09:00 AM", "10:30 AM", "02:00 PM"];

    // 날짜 선택기 설정
    $("#datepicker").datepicker({
        dateFormat: "yy-mm-dd",
        onSelect: function (dateText) {
            // 선택된 날짜에 따라 예약된 시간을 업데이트하거나 API를 호출하여 가져올 수 있습니다.
            // 여기서는 미리 정의된 배열을 사용합니다.
            updateReservedTimes(dateText);
        }
    });

    // 시간 선택기 설정
    $("#timepicker").timepicker({
        timeFormat: "hh:mm tt", // 시간 형식 설정
        interval: 60, // 시간 간격을 60분(1시간)으로 설정
        minTime: "09:00 AM", // 최소 시간
        maxTime: "06:00 PM", // 최대 시간
        disableTimeRanges: reservedTimes, // 예약된 시간을 비활성화합니다.
        onSelect: function (timeText) {
            console.log("선택한 시간: " + timeText);
        }
    });

    // 선택된 날짜에 따라 예약된 시간을 업데이트하는 함수
    function updateReservedTimes(selectedDate) {
        // 실제로는 API 호출 등을 통해 예약된 시간을 가져와야 합니다.
        // 여기서는 미리 정의된 배열을 사용합니다.
        // 예약된 시간 배열을 업데이트하고 Timepicker를 다시 초기화하여 변경된 예약된 시간을 반영합니다.
        reservedTimes.length = 0; // 배열 비우기
        reservedTimes.push("09:00 AM", "10:30 AM", "02:00 PM"); // 새로운 예약된 시간 추가

        // Timepicker를 다시 초기화하여 변경된 예약된 시간을 반영합니다.
        $("#timepicker").timepicker("remove");
        $("#timepicker").timepicker({
            timeFormat: "hh:mm tt",
            interval: 60,
            minTime: "09:00 AM",
            maxTime: "06:00 PM",
            disableTimeRanges: reservedTimes,
            onSelect: function (timeText) {
                console.log("선택한 시간: " + timeText);
            }
        });
    }
</script>

</body>
</html>
