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
        <form method="post" action="/spam/reservation/submit"> <!-- 예약을 서버로 전송하는 폼 추가 -->
            <input type="text" id="checkinDate" autocomplete="off" placeholder="체크인 날짜" name="checkinDate">
            <input type="text" id="checkoutDate" autocomplete="off" placeholder="체크아웃 날짜" name="checkoutDate">
            <div id="timeSlots"></div>
            <div id="reservationStatus"></div>
            <button type="submit" id="reserveButton" class="disabled">예약하기</button>
        </form>


        <script>
            let selectedTimeSlots = []; // 예약된 시간대를 추적하는 배열

            $(function () {
                // 한글로 월과 요일 표시를 위한 설정
                $.datepicker.setDefaults($.datepicker.regional['ko']);

                // 체크인 날짜 선택
                $("#checkinDate").datepicker({
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
                        generateTimeSlots(selectedDate, "checkin");
                    }
                });

                // 체크아웃 날짜 선택
                $("#checkoutDate").datepicker({
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
                        generateTimeSlots(selectedDate, "checkout");
                    }
                });

                function generateTimeSlots(selectedDate, type) {
                    // 현재 시간 가져오기
                    let currentTime = new Date();
                    // 시작 시간과 종료 시간을 1시간 간격으로 생성
                    let startTime = new Date(selectedDate);
                    let endTime = new Date(selectedDate);
                    startTime.setHours(9, 0, 0); // 시작 시간 설정 (예: 9:00 AM)
                    endTime.setHours(23, 0, 0); // 종료 시간 설정 (예: 6:00 PM)

                    let timeSlotContainer = $("#timeSlots");
                    timeSlotContainer.empty(); // 이전에 생성된 버튼을 삭제

                    while (startTime < endTime) {
                        // 현재 시간 이후의 시간만 버튼으로 생성
                        if (startTime > currentTime) {
                            let timeSlotButton = $("<button>").text(startTime.toLocaleTimeString([], {
                                hour: '2-digit',
                                minute: '2-digit'
                            })).data("startTime", new Date(startTime)); // 시작 시간을 버튼 데이터로 저장

                            timeSlotButton.click(function () {
                                // 버튼을 클릭했을 때 선택한 시작 시간을 가져옴
                                let selectedStartTime = $(this).data("startTime");
                                let selectedEndTime = new Date(selectedStartTime);
                                selectedEndTime.setHours(selectedStartTime.getHours() +
                                    1); // 종료 시간 설정 (1시간 뒤)

                                // 중복 예약 확인
                                if (checkForDuplicateReservation(selectedStartTime, selectedEndTime)) {
                                    // 중복 예약이 없을 경우 예약 정보를 배열에 추가
                                    const index = selectedTimeSlots.findIndex(item =>
                                        item.start.getTime() === selectedStartTime.getTime()
                                    );

                                    if (index !== -1) {
                                        // 이미 선택된 슬롯을 다시 클릭하여 해제할 때
                                        selectedTimeSlots.splice(index, 1); // 배열에서 제거
                                        // 버튼 스타일 제거
                                        $(this).removeClass("selected");
                                    } else {
                                        // 선택한 슬롯을 배열에 추가
                                        selectedTimeSlots.push({
                                            start: selectedStartTime,
                                            end: selectedEndTime
                                        });
                                        // 버튼 스타일 변경
                                        $(this).addClass("selected");
                                    }

                                    // 예약 버튼 활성화 또는 비활성화
                                    if (selectedTimeSlots.length > 0) {
                                        $("#reserveButton").removeClass("disabled");
                                    } else {
                                        $("#reserveButton").addClass("disabled");
                                    }
                                } else {
                                    // 중복 예약이 있을 경우 경고 메시지 표시
                                    alert("이미 예약된 시간입니다. 다른 시간을 선택해주세요.");
                                }
                            });

                            timeSlotContainer.append(timeSlotButton);
                        }

                        startTime.setHours(startTime.getHours() + 1); // 1시간 뒤의 시간으로 이동
                    }
                }

                // 중복 예약 확인 함수
                function checkForDuplicateReservation(startTime, endTime) {
                    for (let i = 0; i < selectedTimeSlots.length; i++) {
                        let existingReservation = selectedTimeSlots[i];
                        if (startTime >= existingReservation.start && startTime < existingReservation.end) {
                            return false; // 중복 예약이 있음
                        }
                        if (endTime > existingReservation.start && endTime <= existingReservation.end) {
                            return false; // 중복 예약이 있음
                        }
                    }
                    return true; // 중복 예약이 없음
                }

                // 예약 상태를 표시하는 함수
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
                $("#reserveButton").click(function () {
                    if (selectedTimeSlots.length > 0) {
                        // 예약된 체크인과 체크아웃 시간 가져오기
                        let checkin = selectedTimeSlots[0].start;
                        let checkout = selectedTimeSlots[selectedTimeSlots.length - 1].end;

                        // 체크아웃 날짜가 체크인 날짜보다 더 먼 경우에만 예약 가능
                        if (checkout > checkin) {
                            // 예약 정보를 서버로 전송하거나 다른 작업을 수행할 수 있습니다.
                            // 여기서는 단순히 예약된 기간을 표시합니다.
                            alert("예약 완료: " + checkin.toLocaleString() + " - " + checkout.toLocaleString());
                        } else {
                            alert("체크아웃 날짜는 체크인 날짜보다 더 먼 날짜여야 합니다.");
                        }
                    } else {
                        alert("예약된 시간이 없습니다. 먼저 시간을 선택해주세요.");
                    }
                });
            });
        </script>
    </body>

    </html>