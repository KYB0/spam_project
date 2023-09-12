<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            input[type="text"] {
                width: 200px;
                padding: 10px;
                margin: 10px;
                border: 1px solid #ccc;
            }

            #timeSlots {
                margin-top: 20px;
            }

            button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                margin-top: 20px;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }

            #reservationStatus {
                margin-top: 20px;
                font-weight: bold;
            }

            .selected {
                background-color: #28a745;
                color: #fff;
            }

            .disabled {
                background-color: #ccc;
                cursor: not-allowed;
            }
        </style>
    </head>

    <body>
        <form method="post" action="/spam/reservation/submit">
            <input type="text" id="checkinDate" autocomplete="off" placeholder="체크인 날짜" name="checkinDate">
            <input type="text" id="checkoutDate" autocomplete="off" placeholder="체크아웃 날짜" name="checkoutDate">
            <div id="timeSlots"></div>
            <div id="reservationStatus"></div>
            <button type="submit" id="reserveButton" class="disabled">예약하기</button>
        </form>

        <!-- <script>
        let selectedTimeSlots = [];

        $(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']);

            $("#checkinDate").datepicker({
                nextText: "다음",
                prevText: "이전",
                monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                dayNames: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dayNamesShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dayNamesMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
                minDate: 0,
                dateFormat: 'yy-mm-dd',
                onSelect: function (dateText, inst) {
                    let selectedDate = new Date(dateText);
                    generateTimeSlots(selectedDate, "checkin");
                }
            });

            $("#checkoutDate").datepicker({
                nextText: "다음",
                prevText: "이전",
                monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                dayNames: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dayNamesShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dayNamesMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
                minDate: 0,
                dateFormat: 'yy-mm-dd',
                onSelect: function (dateText, inst) {
                    let selectedDate = new Date(dateText);
                    generateTimeSlots(selectedDate, "checkout");
                }
            });

            function generateTimeSlots(selectedDate, type) {
                let currentTime = new Date();
                let startTime = new Date(selectedDate);
                let endTime = new Date(selectedDate);
                startTime.setHours(9, 0, 0);
                endTime.setHours(23, 0, 0);

                let timeSlotContainer = $("#timeSlots");
                timeSlotContainer.empty();

                while (startTime < endTime) {
                    if (startTime > currentTime) {
                        let timeSlotButton = $("<button>").text(startTime.toLocaleTimeString([], {
                            hour: '2-digit',
                            minute: '2-digit'
                        })).data("startTime", new Date(startTime));

                        timeSlotButton.click(function () {
                            let selectedStartTime = $(this).data("startTime");
                            let selectedEndTime = new Date(selectedStartTime);
                            selectedEndTime.setHours(selectedStartTime.getHours() + 1);

                            if (checkForDuplicateReservation(selectedStartTime, selectedEndTime)) {
                                const index = selectedTimeSlots.findIndex(item =>
                                    item.start.getTime() === selectedStartTime.getTime()
                                );

                                if (index !== -1) {
                                    selectedTimeSlots.splice(index, 1);
                                    $(this).removeClass("selected");
                                } else {
                                    selectedTimeSlots.push({
                                        start: selectedStartTime,
                                        end: selectedEndTime
                                    });
                                    $(this).addClass("selected");
                                }

                                if (selectedTimeSlots.length > 0) {
                                    $("#reserveButton").removeClass("disabled");
                                } else {
                                    $("#reserveButton").addClass("disabled");
                                }
                            } else {
                                alert("이미 예약된 시간입니다. 다른 시간을 선택해주세요.");
                            }
                        });

                        timeSlotContainer.append(timeSlotButton);
                    }

                    startTime.setHours(startTime.getHours() + 1);
                }
            }

            function checkForDuplicateReservation(startTime, endTime) {
                for (let i = 0; i < selectedTimeSlots.length; i++) {
                    let existingReservation = selectedTimeSlots[i];
                    if (startTime >= existingReservation.start && startTime < existingReservation.end) {
                        return false;
                    }
                    if (endTime > existingReservation.start && endTime <= existingReservation.end) {
                        return false;
                    }
                }
                return true;
            }

            function displayReservationStatus() {
                let reservationStatus = $("#reservationStatus");
                reservationStatus.empty();
                if (selectedTimeSlots.length > 0) {
                    let checkin = selectedTimeSlots[0].start.toLocaleString();
                    let checkout = selectedTimeSlots[selectedTimeSlots.length - 1].end.toLocaleString();
                    reservationStatus.text("예약된 기간: " + checkin + " - " + checkout);
                } else {
                    reservationStatus.text("예약된 기간이 없습니다.");
                }
            }
        });
    </script> -->
    </body>

    </html>