<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choice Table</title>
    <style>
        /* 예약된 시간 슬롯을 비활성화하고 강조하는 CSS 스타일 */

        /* 예약된 시간 슬롯을 비활성화 */
        .time-list li[disabled] {
            background-color: #ccc;
            /* 비활성화된 시간 슬롯 배경색을 회색으로 설정 */
            color: #888;
            /* 비활성화된 시간 슬롯 텍스트 색상을 회색으로 설정 */
            cursor: not-allowed;
            /* 비활성화된 시간 슬롯에는 커서를 사용할 수 없도록 설정 */
        }

        /* 예약된 시간 슬롯을 강조 */
        .time-list li.reserved-time {
            background-color: #ffcccb;
            /* 강조된 시간 슬롯 배경색을 분홍색으로 설정 */
            color: #f00;
            /* 강조된 시간 슬롯 텍스트 색상을 빨간색으로 설정 */
        }


        body {
            font-family: 'Lato', sans-serif;
            background-color: white;
            color: #fff;
            box-sizing: border-box;
        }

        #s_container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 800px;
        }

        .seat_contaner {
            margin: 20px 0px;
        }

        .s_showcase {
            background-color: #777;
            background: rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            display: flex;
            justify-content: center;
            margin: 16px 0;
            padding: 5px 50px;
        }

        .seat_contaner select {
            margin: 10px;
            padding: 5px 15px 5px 15px;
            border-radius: 7px;
            appearance: none;
            border: 0;
        }

        .seat_contaner select option {
            text-align: left;
        }

        .s_li {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 10px;
        }

        .s_small {
            color: black;
            margin-left: 2px;
        }

        .s_showcase .s_seat:hover {
            cursor: pointer;
            scale: 1;
        }

        .s_showcase .selectedSeat:hover {
            cursor: pointer;
            scale: 1;
        }

        .s_seat {
            background-color: #444451;
            width: 50px;
            height: 50px;
            margin: 3px;
            color: #FFFFFF;
            border-radius: 10px;
            cursor: pointer;
        }

        .availableSeat {
            background-color: #444451;
            width: 50px;
            height: 50px;
            margin: 3px;
            border-radius: 10px;
            cursor: default;
        }

        .selectedSeatIcon {
            background-color: #6feaf6;
            width: 50px;
            height: 50px;
            margin: 3px;
            border-radius: 10px;
            cursor: default;
        }

        .s_seat:hover {
            transform: scale(1.2);
        }

        .selectedSeat:hover {
            transform: scale(1.2);
        }

        .s_seat:nth-of-type(2) {
            margin-right: 18px;
        }

        .s_seat:nth-of-type(7) {
            margin-left: 18px;
        }

        .occupiedSeat:nth-of-type(2) {
            margin-right: 18px;
        }

        .occupiedSeat:nth-of-type(7) {
            margin-left: 18px;
        }

        .selectedSeat {
            background-color: #6feaf6;
            width: 50px;
            height: 50px;
            margin: 3px;
            color: #333333;
            border-radius: 10px;
            cursor: pointer;
        }

        .occupiedSeat {
            background-color: black;
            width: 50px;
            height: 50px;
            color: #DCE682;
            margin: 3px;
            border-radius: 10px;
        }

        .s_row {
            display: flex;
        }

        .text {
            margin-top: 30px;
            padding: 20px;
        }

        #count {
            color: #6feaf6;
        }

        #costs {
            color: #6feaf6;
        }

        .sbutton-container {
            display: flex;
            /* 수평으로 배치하기 위해 Flexbox 사용 */
            justify-content: space-between;
            /* 각 버튼을 좌우로 정렬 */
            margin-top: 20px;
            /* 원하는 간격 설정 */
        }

        .myChooseButton {
            box-shadow: 0px 10px 14px -7px #000000;
            background: linear-gradient(to bottom, #000000 5%, #000000 100%);
            background-color: #000000;
            border-radius: 10px;
            border: 1px solid #000000;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            padding: 14px 40px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #000000;
            margin-right: 30px;
            /* 버튼 사이에 오른쪽 여백 추가 */
            margin-left: 30px;
        }

        .myChooseButton:hover {
            background: linear-gradient(to bottom, #000000 5%, #000000 100%);
            background-color: #000000;
        }

        .myChooseButton:active {
            position: relative;
            top: 1px;
        }

        /* Timepicker styling */
        .ui-timepicker-div {
            font-size: 16px;
        }

        .ui-timepicker-standard {
            width: 60px;
        }

        .ui-timepicker-list li {
            padding: 5px;
        }

        .ui-timepicker-selected {
            background-color: #6feaf6 !important;
            color: #333333;
        }

        /* 스타일링 비활성화된 시간대 */
        .past-time {
            color: #777;
            /* 글자 색상을 회색으로 설정 */
            background-color: #eee;
            /* 배경 색상을 연한 회색으로 설정 */
            /* cursor: not-allowed; */
            /* 클릭 이벤트 비활성화 */
        }

        .time-list {
            display: none;
        }

        /* 강조 클래스 'emphasis' 스타일 */
        .emphasis {
            background-color: #ffc107;
            /* 배경색을 변경하거나 다른 스타일을 적용하세요 */
            color: #333;
            /* 텍스트 색상을 조정하세요 */
            font-weight: bold;
            /* 텍스트를 굵게 표시하거나 다른 글꼴 스타일을 적용하세요 */
            /* 다른 원하는 스타일을 추가하세요 */
        }


        /* Time List Styling */
        /* .time-list {
    list-style: none;
    padding: 0;
    margin: 10px 0;
    display: flex;
    flex-wrap: wrap;
}

.time-list li {
    background-color: #6feaf6;
    color: #333333;
    border: 1px solid #000000;
    padding: 5px 10px;
    margin: 0px;
    cursor: pointer;
}

.time-list li.past-time {
    background-color: #eee;
    color: #777;
    border: 1px solid #eee;
    cursor: not-allowed;
} */
    </style>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <!-- Add this to the head section of your HTML -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

</head>

<body>
    <%@ include file="header.jsp" %>
    <input type="hidden" id="seatNumbersList" value="${seatNumbersList}" />
    <section id="s_container">
        <div class="seat_contaner">
            <label for="movie">
                자리를 선택해 주세요
            </label>
        </div>
        <ul class="s_showcase">
            <li class="s_li">
                <div class="availableSeat"></div>
                <small class="s_small">빈자리</small>
            </li>
            <li class="s_li">
                <div class="selectedSeatIcon"></div>
                <small class="s_small">선택한 자리</small>
            </li>
            <li class="s_li">
                <div class="occupiedSeat"></div>
                <small class="s_small">선택 불가</small>
            </li>
        </ul>


        <div class="Stable">

            <div class="Ctable"></div>
            <div class="s_row">
                <div class="s_row">
                </div>
                <span class="s_seat">1</span>
                <span class="s_seat">2</span>
                <span class="s_seat">3</span>
                <span class="s_seat">4</span>
                <span class="s_seat">5</span>
                <span class="s_seat">6</span>
                <span class="s_seat">7</span>
                <span class="s_seat">8</span>
            </div>

            <div class="s_row">

                <span class="s_seat">9</span>
                <span class="s_seat">10</span>
                <span class="s_seat">11</span>
                <span class="s_seat">12</span>
                <span class="s_seat">13</span>
                <span class="s_seat">14</span>
                <span class="s_seat">15</span>
                <span class="s_seat">16</span>
            </div>

            <div class="s_row">

                <span class="s_seat">17</span>
                <span class="s_seat">18</span>
                <span class="s_seat">19</span>
                <span class="s_seat">20</span>
                <span class="s_seat">21</span>
                <span class="s_seat">22</span>
                <span class="s_seat">23</span>
                <span class="s_seat">24</span>
            </div>

            <div class="s_row">

                <span class="s_seat">25</span>
                <span class="s_seat">26</span>
                <span class="s_seat">27</span>
                <span class="s_seat">28</span>
                <span class="s_seat">29</span>
                <span class="s_seat">30</span>
                <span class="s_seat">31</span>
                <span class="s_seat">32</span>
            </div>

            <div class="s_row">

                <span class="s_seat">33</span>
                <span class="s_seat">34</span>
                <span class="s_seat">35</span>
                <span class="s_seat">36</span>
                <span class="s_seat">37</span>
                <span class="s_seat">38</span>
                <span class="s_seat">39</span>
                <span class="s_seat">40</span>
            </div>

            <div class="s_row">

                <span class="s_seat">41</span>
                <span class="s_seat">42</span>
                <span class="s_seat">43</span>
                <span class="s_seat">44</span>
                <span class="s_seat">45</span>
                <span class="s_seat">46</span>
                <span class="s_seat">47</span>
                <span class="s_seat">48</span>
            </div>

        </div>
        <br>
        <div class="sbutton-container">
            <a href="#" class="myChooseButton">선택완료</a>
        </div>

    </section>
    <div class="reservation-form">
        <form action="/spam/${room_name}/reservation/data" method="get">
            <input type="text" name="customer_id" id="customer_id" value="${customer_id}">
            <input type="text" name="room_id" id="room_id" value="${room_id}">
            <input type="text" name="seat_number" id="seat_number">
            <div id="datepicker"></div>
            <div class="time-selection">
                <label for="start-time">시작 시간:</label>
                <input type="text" id="start-time" name="start_time" class="timepicker">
                <label for="end-time">종료 시간:</label>
                <input type="text" id="end-time" name="end_time" class="timepicker">
                <ul class="time-list"></ul>
            </div>
            <button type="submit">예약하기</button>
        </form>
    </div>
</body>

<script>
    $(document).ready(function () {
        let reservedTimes = [];

        // 시간 목록 생성
        const startTimeInput = $('#start-time');
        const endTimeInput = $('#end-time');
        // 시간 목록 생성
        const timeList = $('.time-list');

        if (timeList.children().length === 0) {
            for (let i = 0; i < 24; i++) {
                const li = $('<li>').text(i + ':00');
                timeList.append(li);
            }
        }


        // 시간 선택 이벤트 처리
        timeList.on('click', 'li', function () {
            const selectedTime = $(this).text();
            const selectedDate = $("#datepicker").val();
            const combinedDateTime = selectedDate + ' ' + selectedTime;
            console.log("시간 : " + selectedDate + " " + selectedTime);

            // 클릭한 시간을 시작 시간과 종료 시간 입력란에 설정
            if (startTimeInput.val() === '') {
                startTimeInput.val(combinedDateTime);
            } else if (endTimeInput.val() === '') {
                const startHour = parseInt(startTimeInput.val().split(' ')[1].split(':')[0]);
                const endHour = parseInt(selectedTime.split(':')[0]);
                if (endHour >= startHour + 1) {
                    endTimeInput.val(combinedDateTime);
                } else {
                    startTimeInput.val(combinedDateTime);
                }
            } else {
                startTimeInput.val(combinedDateTime);
                endTimeInput.val('');
            }

            // 시간을 선택한 후에도 시작 시간과 종료 시간 사이의 시간대를 강조
            emphasizeTimeSlots();
        });

        // 시작 시간과 종료 시간 사이의 시간대를 강조하는 함수
        function emphasizeTimeSlots() {
            const startTime = startTimeInput.val();
            const endTime = endTimeInput.val();
            if (startTime && endTime) {
                const startHour = parseInt(startTime.split(' ')[1].split(':')[0]);
                const endHour = parseInt(endTime.split(' ')[1].split(':')[0]);

                // 시간 슬롯을 순회하면서 강조
                $(".time-list li").each(function () {
                    const time = parseInt($(this).text().split(':')[0]);
                    if (time >= startHour && time <= endHour) {
                        $(this).addClass('emphasis'); // 강조 클래스 추가
                    } else {
                        $(this).removeClass('emphasis'); // 강조 클래스 제거
                    }
                });
            }
        }

        const seats = document.querySelectorAll(".s_seat"); // 모든 좌석 요소 선택
        let selectedSeat = null; // 선택된 좌석 저장 변수

        // 좌석 번호를 포함한 배열 생성
        const seatNumbersList = [];
        for (let i = 1; i <= 48; i++) {
            seatNumbersList.push(i);
        }

        const seatNumbers = "${seatNumbersList}";
        console.log(seatNumbers);

        seats.forEach((s_seat) => {
            const seatNumber = parseInt(s_seat.textContent); // 좌석 번호 추출 및 정수로 변환

            if (seatNumbers.includes(seatNumber)) {
                s_seat.classList.add("availableSeat"); // 배열에 해당 좌석 번호가 있으면 선택 가능
            } else {
                s_seat.classList.add("occupiedSeat"); // 배열에 해당 좌석 번호가 없으면 선택 불가능
            }

            s_seat.addEventListener("click", function () {
                if (s_seat.classList.contains("availableSeat")) {
                    if (selectedSeat !== null) {
                        selectedSeat.classList.remove("selectedSeat");
                    }

                    s_seat.classList.add("selectedSeat");
                    selectedSeat = s_seat;
                    console.log(selectedSeat);

                    // 선택한 좌석을 숫자로 가져옵니다.
                    const selectedSeatNumber = parseInt(selectedSeat.textContent);

                    // 좌석 번호를 "seat_number" 입력 필드에 설정합니다.
                    $("#seat_number").val(selectedSeatNumber);
                }
            });
        });

        document.querySelector(".myChooseButton").addEventListener("click", function () {
            if (selectedSeat !== null) {
                const room_id = $("#room_id").val(); // 입력 필드에서 room_id 가져오기
                const seat_number = $("#seat_number").val(); // 입력 필드에서 seat_number 가져오기
                console.log("room_id : ", room_id);
                console.log("seat_number : ", seat_number);

                // 이전에 표시된 달력을 숨깁니다.
                $("#datepicker").datepicker("destroy");



                const today = moment().format("YYYY-MM-DD");

                // #datepicker div에 날짜 선택 달력을 표시합니다.
                // 달력 초기화
                $("#datepicker").datepicker({
                    locale: 'ko',
                    nextText: "다음",
                    prevText: "이전",
                    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월",
                        "11월", "12월"
                    ],
                    dayNames: ["일", "월", "화", "수", "목", "금", "토", "일"],
                    dayNamesShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
                    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
                    dateFormat: "yy-mm-dd",
                    minDate: today,
                    onSelect: function (dateText) {
                        console.log("선택한 날짜: " + dateText);

                        // 이전에 선택된 시간 제거
                        $("#start-time").val('');
                        $("#end-time").val('');

                        // 현재 시간 가져오기
                        const currentTime = moment().format("HH");

                        // 선택한 날짜와 현재 날짜를 비교하여 시간 목록을 활성화 또는 비활성화
                        const selectedDate = moment(dateText);
                        const currentDate = moment();
                        if (selectedDate > currentDate) {
                            // 선택한 날짜가 현재 날짜보다 이후일 때 모든 시간 활성화
                            $(".time-list li").prop('disabled', false).removeClass(
                                'past-time');
                        } else {
                            // 선택한 날짜가 현재 날짜와 같거나 이전일 때 과거 시간 비활성화
                            $(".time-list li").each(function () {
                                const time = parseInt($(this).text().split(':')[0]);
                                if (time < currentTime) {
                                    $(this).prop('disabled', true).addClass(
                                        'past-time');
                                } else {
                                    $(this).prop('disabled', false).removeClass(
                                        'past-time');
                                }
                            });
                        }

                        // 날짜 선택 시 .time-list 요소 표시
                        $(".time-list").css("display", "block"); // 시간 슬롯 표시

                        // 시간 슬롯 초기화
                        const startTime = $("#start-time").val();
                        const endTime = $("#end-time").val();
                        const timeList = document.querySelector('.time-list');

                        // 시작 시간과 종료 시간이 설정되어 있으면 해당 시간대의 시간 목록을 비활성화
                        if (startTime !== '' && endTime !== '') {
                            const startHour = parseInt(startTime.split(' ')[1].split(':')[
                                0]);
                            const endHour = parseInt(endTime.split(' ')[1].split(':')[0]);
                            $(".time-list li").each(function () {
                                const time = parseInt($(this).text().split(':')[0]);
                                if (time >= startHour && time < endHour) {
                                    $(this).prop('disabled', true).addClass(
                                        'past-time');
                                }
                            });
                        }

                        // AJAX 요청을 보내서 예약 세부 정보 가져오기
                        $.ajax({
                            type: "POST",
                            url: "/spam/api/getReservationDetails",
                            data: JSON.stringify({
                                room_id,
                                seat_number
                            }),
                            contentType: "application/json",
                            success: function (response) {
                                console.log("예약 세부 정보:", response);

                            },
                            error: function () {
                                console.error("예약 세부 정보 가져오기 실패.");
                                alert("예약 세부 정보를 가져오는 데 실패했습니다. 다시 시도하세요.");
                            }
                        });
                    },
                });

                // 달력 위치 설정 (조절 가능)
                $("#datepicker").datepicker("show");

                // 좌석 번호를 숨김
                document.querySelector(".seat_contaner").style.display = "none";

                // 선택 완료 버튼 숨김
                document.querySelector(".myChooseButton").style.display = "none";
            } else {
                alert("좌석을 선택해 주세요.");
            }
        });
    });
</script>






</html>