<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body>
    <input type="text" id="datepicker" autocomplete="off">
    <div id="timeSlots"></div>
    <div id="selectedTimeSlots"></div>

    <script>
        $(function () {
            // 한글로 월과 요일 표시를 위한 설정
            $.datepicker.setDefaults($.datepicker.regional['ko']);

            // datepicker 설정
            $("#datepicker").datepicker({
                nextText: "다음",
                prevText: "이전",
                monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                dayNames: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dayNamesShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dayNamesMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
                minDate: 0, 
                dateFormat: 'yy-mm-dd', // 원하는 날짜 형식 지정
                onSelect: function (dateText, inst) {
                    let selectedDate = new Date(dateText);
                    generateTimeSlots(selectedDate);
                }
            });

            function generateTimeSlots(selectedDate) {
                // 시작 시간과 종료 시간을 설정
                let startTime = new Date(selectedDate);
                let endTime = new Date(selectedDate);
                startTime.setHours(9, 0, 0); // 시작 시간 설정 (예: 9:00 AM)
                endTime.setHours(18, 0, 0); // 종료 시간 설정 (예: 6:00 PM)

                let timeSlotContainer = $("#timeSlots");
                timeSlotContainer.empty(); // 이전에 생성된 버튼을 삭제

                while (startTime < endTime) {
                    let timeSlotButton = $("<button>").text(startTime.toLocaleTimeString([], {
                        hour: '2-digit',
                        minute: '2-digit'
                    }))
                    .data("startTime", new Date(startTime)) // 시작 시간을 버튼 데이터로 저장
                    .data("isSelected", false); // 선택 여부를 저장

                    timeSlotButton.click(function () {
                        // 버튼을 클릭했을 때 선택 여부를 토글
                        let isSelected = $(this).data("isSelected");
                        $(this).data("isSelected", !isSelected);

                        // 선택된 시간대를 모아서 표시
                        updateSelectedTimeSlots();
                    });

                    timeSlotContainer.append(timeSlotButton);
                    startTime.setHours(startTime.getHours() + 1); // 1시간 뒤의 시간으로 이동
                }
            }

            function updateSelectedTimeSlots() {
                // 선택된 시간대를 가져와서 화면에 표시
                let selectedTimeSlots = [];
                $("#timeSlots button[data-isSelected=true]").each(function () {
                    selectedTimeSlots.push($(this).text());
                });

                let selectedTimeSlotsContainer = $("#selectedTimeSlots");
                selectedTimeSlotsContainer.empty();
                selectedTimeSlotsContainer.text("선택한 시간: " + selectedTimeSlots.join(", "));
            }
        });
    </script>
</body>

</html>
