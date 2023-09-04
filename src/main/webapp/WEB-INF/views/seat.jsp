<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choice Table</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="/js/jquery-3.7.0.min.js"></script>


</head>
<style>
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
        cursor: default;
        scale: 1;
    }

    .s_showcase .selectedSeat:hover {
        cursor: default;
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
        scale: 1.2;
    }

    .selectedSeat:hover {
        scale: 1.2;
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

    .myChooseButton-fixx {
        box-shadow: 0px 10px 14px -7px #E6E6FA;
        background: linear-gradient(to bottom, #E6E6FA 5%, #E6E6FA 100%);
        background-color: #E6E6FA;
        border-radius: 10px;
        border: 1px solid #E6E6FA;
        display: inline-block;
        cursor: pointer;
        color: #B19CD9;
        font-family: Arial;
        font-size: 15px;
        font-weight: bold;
        padding: 14px 40px;
        text-decoration: none;
        text-shadow: 0px 1px 0px #E6E6FA;
        margin-right: 30px;
        /* 버튼 사이에 오른쪽 여백 추가 */
        margin-left: 30px;
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

    .myChooseButton.myChooseButton-fixx:hover {
        background: linear-gradient(to bottom, #000000 5%, #000000 100%);
        background-color: #000000;
    }

    .myChooseButton.myChooseButton-fixx:active {
        position: relative;
        top: 1px;
    }
</style>

<body>
    <%@ include file="header.jsp" %>
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
                <small class="s_small">선택된 자리</small>
            </li>
        </ul>

        <div class="Stable">
            <div class="Ctable"></div>
            <div class="s_row">
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
                <span class="occupiedSeat">13</span>
                <span class="occupiedSeat">14</span>
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
                <span class="occupiedSeat">23</span>
                <span class="s_seat">24</span>
            </div>

            <div class="s_row">
                <span class="s_seat">25</span>
                <span class="s_seat">26</span>
                <span class="s_seat">27</span>
                <span class="s_seat">28</span>
                <span class="s_seat">29</span>
                <span class="s_seat">30</span>
                <span class="occupiedSeat">31</span>
                <span class="occupiedSeat">32</span>
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
                <span class="occupiedSeat">42</span>
                <span class="occupiedSeat">43</span>
                <span class="s_seat">44</span>
                <span class="s_seat">45</span>
                <span class="s_seat">46</span>
                <span class="occupiedSeat">47</span>
                <span class="s_seat">48</span>
            </div>

        </div>
        <br>
        <div class="sbutton-container">
            <a href="#" class="myChooseButton" id="selectButton">선택완료</a>
            <a href="#" class="myChooseButton-fixx" id="reserveButton">비품 예약</a>
        </div>
    </section>
    <%@ include file="footer.jsp" %>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const seats = document.querySelectorAll(".s_seat"); // 모든 좌석 요소 선택
        let selectedSeat = null; // 선택된 좌석을 저장하는 변수

        seats.forEach((s_seat) => {
            s_seat.addEventListener("click", function () {
                if (!s_seat.classList.contains("occupiedSeat")) {
                    // 좌석이 비어 있을 때만 선택 가능
                    if (selectedSeat !== null) {
                        // 이미 선택된 좌석이 있을 경우, 선택 취소
                        selectedSeat.classList.remove("selectedSeat");
                    }

                    s_seat.classList.add("selectedSeat"); // 새로운 좌석 선택
                    selectedSeat = s_seat; // 선택된 좌석 업데이트
                }
            });
        });

        // "선택완료" 버튼을 클릭했을 때의 동작 정의
        const selectButton = document.getElementById("selectButton");
        selectButton.addEventListener("click", function () {
            if (selectedSeat !== null) {
                // 좌석 선택 완료
                const seatNumber = selectedSeat.textContent; // 선택된 좌석 번호 가져오기
                alert("선택된 좌석: " + seatNumber);

                // 예약 시간 선택을 위한 폼 표시
                document.getElementById("reservationForm").style.display = "block";
            } else {
                alert("좌석을 선택해주세요.");
            }
        });

        // "비품 예약" 버튼을 클릭했을 때의 동작 정의
        const reserveButton = document.getElementById("reserveButton");
        reserveButton.addEventListener("click", function () {
            if (selectedSeat !== null) {
                // 좌석 선택 완료
                const seatNumber = selectedSeat.textContent; // 선택된 좌석 번호 가져오기
                alert("선택된 좌석 " + seatNumber + "를 비품 예약합니다.");

                // 예약 시간 선택을 위한 폼 표시
                document.getElementById("reservationForm").style.display = "block";
            } else {
                alert("좌석을 선택해주세요.");
            }
        });

        // "예약 완료" 버튼을 클릭했을 때의 동작 정의
        const reservationForm = document.getElementById("reservationForm");
        reservationForm.addEventListener("submit", function (event) {
            event.preventDefault(); // 기본 동작(폼 제출) 방지

            const selectedTime = document.getElementById("reservationTime").value;
            if (!selectedTime) {
                alert("예약 시간을 선택해주세요.");
                return;
            }

            // 여기에 예약 동작을 수행하는 코드를 추가하세요.
            // 선택된 좌석과 시간 정보를 활용하여 예약을 완료합니다.
            const seatNumber = selectedSeat.textContent;
            alert("좌석 " + seatNumber + "가 " + selectedTime + "에 예약되었습니다.");
        });
    });
</script>

</html>