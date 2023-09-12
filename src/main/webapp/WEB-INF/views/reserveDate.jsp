<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Date Selection</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
        }

        table,
        th,
        td {
            border: 1px solid black;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #f2f2f2;
        }

        td.date-cell {
            background-color: white;
            cursor: pointer;
        }

        td.date-cell.selected {
            background-color: #d3d3d3;
        }

        /* Add CSS for arrows */
        .arrow {
            cursor: pointer;
            font-size: 18px;
        }
    </style>


    <!-- Swiper 라이브러리 스크립트를 추가합니다. -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        // Swiper 초기화 및 설정
        const swiper = new Swiper('.swiper-container', {
            slidesPerView: 'auto', // 자동으로 슬라이드 너비 조절
            spaceBetween: 10, // 슬라이드 간 간격
        });
    </script>
</head>

<body>
    <h1>Date Selection</h1>
    <form action="processReservation.jsp" method="post">
        <table>
            <tr>
                <th>Date:</th>
                <td><input type="text" name="reservationDate" id="selectedDate" required readonly></td>
            </tr>
            <tr>
                <th>Time:</th>
                <td>
                    <select name="reservationTime" required>
                        <option value="09:00">9:00 AM</option>
                        <option value="10:00">10:00 AM</option>
                        <option value="11:00">11:00 AM</option>
                        <!-- Add more time slots as needed -->
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"><input type="submit" value="Submit Reservation"></td>
            </tr>
        </table>
    </form>

    <h2>Calendar</h2>
    <div>
        <!-- Add Previous Month and Next Month buttons -->
        <span class="arrow" onclick="previousMonth()">&#8249;</span>
        <label for="year">Year:</label>
        <select id="year" onchange="updateCalendar()">
            <% 
            int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
            for (int year = currentYear - 1; year <= currentYear + 1; year++) {
            %>
            <option value="<%= year %>"><%= year %></option>
            <%
            }
            %>
        </select>
        <label for="month">Month:</label>
        <select id="month" onchange="updateCalendar()">
            <%
            java.text.SimpleDateFormat monthFormat = new java.text.SimpleDateFormat("MM");
            java.util.Calendar calendar = java.util.Calendar.getInstance();
            int currentMonth = Integer.parseInt(monthFormat.format(calendar.getTime()));
            for (int month = 1; month <= 12; month++) {
            %>
            <option value="<%= month %>" <%= (month == currentMonth) ? "selected" : "" %>><%= month %></option>
            <%
            }
            %>
        </select>
        <span class="arrow" onclick="nextMonth()">&#8250;</span>
    </div>

    <table id="calendarTable">
        <!-- Calendar table will be generated here -->
    </table>
    <div class="swiper-container">
        <ul class="swiper-wrapper time_list">
            <!-- 시간 목록을 동적으로 생성합니다. -->
            <% for (int hour = 0; hour <= 23; hour++) { %>
                <li class="swiper-slide able">
                    <span class="time time_half"><%= (hour < 12) ? "오전" : "오후" %></span>
                    <a class="time_box">
                        <span class="time"><%= (hour < 12) ? hour : hour - 12 %></span>
                        <span class="price"><%= (hour < 12) ? "1,500" : "2,500" %></span>
                    </a>
                </li>
            <% } %>
        </ul>
    </div>
    



    <script>
        function updateCalendar() {
            const year = document.getElementById("year").value;
            const month = document.getElementById("month").value;

            const calendarTable = document.getElementById("calendarTable");
            calendarTable.innerHTML = ''; // Clear the existing table

            const dateCells = document.querySelectorAll(".date-cell");
            dateCells.forEach(cell => cell.removeEventListener("click", selectDate));

            const daysInMonth = new Date(year, month, 0).getDate();
            const firstDayOfMonth = new Date(year, month - 1, 1).getDay();

            let day = 1;

            for (let i = 0; i < 6; i++) {
                const row = calendarTable.insertRow();

                for (let j = 0; j < 7; j++) {
                    const cell = row.insertCell();

                    if ((i === 0 && j < firstDayOfMonth) || day > daysInMonth) {
                        cell.textContent = '';
                    } else {
                        cell.textContent = day;
                        cell.classList.add("date-cell");
                        cell.setAttribute("data-date",
                            `${year}-${month.toString().padStart(2, '0')}-${day.toString().padStart(2, '0')}`);
                        day++;
                    }
                }
            }

            dateCells.forEach(cell => cell.addEventListener("click", selectDate));
        }

        function selectDate() {
            const dateCells = document.querySelectorAll(".date-cell");
            dateCells.forEach(c => c.classList.remove("selected"));
            this.classList.add("selected");
            document.getElementById("selectedDate").value = this.getAttribute("data-date");
        }

        function previousMonth() {
            const yearSelect = document.getElementById("year");
            const monthSelect = document.getElementById("month");

            let year = parseInt(yearSelect.value);
            let month = parseInt(monthSelect.value);

            if (month === 1) {
                year--;
                month = 12;
            } else {
                month--;
            }

            yearSelect.value = year;
            monthSelect.value = month;
            updateCalendar();
        }

        function nextMonth() {
            const yearSelect = document.getElementById("year");
            const monthSelect = document.getElementById("month");

            let year = parseInt(yearSelect.value);
            let month = parseInt(monthSelect.value);

            if (month === 12) {
                year++;
                month = 1;
            } else {
                month++;
            }

            yearSelect.value = year;
            monthSelect.value = month;
            updateCalendar();
        }

        // Initialize the calendar on page load
        updateCalendar();
    </script>
</body>

</html>