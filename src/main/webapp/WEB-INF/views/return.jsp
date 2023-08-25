
<!-- equipment_return.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>비품 반납 페이지</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    <h1>비품 반납</h1>
    <form id="returnForm">
        <div>
            <label for="roomName">독서실 이름:</label>
            <input type="text" id="roomName" name="roomName" value="${roomName}" readonly>
        </div>
        <div>
            <label for="equipmentName">비품 이름:</label>
            <input type="text" id="equipmentName" name="equipmentName" value="${equipmentName}" readonly>
        </div>
        <div>
            <label for="startTime">대여 시작 시간:</label>
            <input type="text" id="startTime" name="startTime" value="${startTime}" readonly>
        </div>
        <div>
            <label for="returnTime">반납 예정 시간:</label>
            <input type="text" id="returnTime" name="returnTime" value="${returnTime}" readonly>
        </div>
        <button type="button" id="returnButton">반납하기</button>
    </form>

    <div id="returnMessage" style="display: none;">
        반납 오나료!
    </div>

    <script>
        document.getElementById("returnButton").addEventListener("click", function() {
            // 반납 처리 로직
            // 
            
            // 알림 메시지 표시
            document.getElementById("returnMessage").style.display = "block";
        });
    </script>
    <%@ include file="footer.jsp" %>
</body>
</html>
