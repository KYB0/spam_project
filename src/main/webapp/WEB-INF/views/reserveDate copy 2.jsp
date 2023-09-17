<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    </style>
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
    <div id="calendar-header">
        <button id="prev-month">&#9664;</button>
        <span id="current-month-year">Current Month Year</span>
        <button id="next-month">&#9654;</button>
    </div>

    <table>
        <tr>
            <th>Sun</th>
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
        </tr>
        <tr>
            <% 
                java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                calendar.set(java.util.Calendar.DAY_OF_MONTH, 1);
                int maxDay = calendar.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
                int dayOfWeek = calendar.get(java.util.Calendar.DAY_OF_WEEK);

                for (int i = 1; i < dayOfWeek; i++) {
            %>
            <td></td>
            <%
                }
                for (int i = 1; i <= maxDay; i++) {
                    String formattedDate = dateFormat.format(calendar.getTime());
                    String cellClass = "date-cell";
                    if (i == 1 && dayOfWeek > 1) {
                        cellClass += " empty-cell";
                    }
            %>
            <td class="<%=cellClass%>" data-date="<%=formattedDate%>"><%=i%></td>
            <%
                if (dayOfWeek == java.util.Calendar.SATURDAY) {
            %>
        </tr>
        <tr>
            <%
                }
                calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);
                dayOfWeek = calendar.get(java.util.Calendar.DAY_OF_WEEK);
                }
            %>
        </tr>
    </table>

    <script>
        const dateCells = document.querySelectorAll(".date-cell");

        dateCells.forEach(cell => {
            cell.addEventListener("click", () => {
                dateCells.forEach(c => c.classList.remove("selected"));
                cell.classList.add("selected");
                document.getElementById("selectedDate").value = cell.getAttribute("data-date");
            });
        });
    </script>
</body>

</html>