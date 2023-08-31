<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM</title>
    <style>

.rdetail {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin-bottom: 100px; /* 푸터와의 간격 조절 */
}

        .rdetail h1{
            color: #DCE682;
            margin-top: 150px; /* 위에서 */
            -webkit-text-stroke: 2px #322A31; /* 글자 테두리색 및 두께 (표준) */
            text-transform: uppercase;
        }

        .stc-img-container {
            display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    max-width: 70%; /* 최대 너비 설정 */
    width: 100%;
    height: auto;
}

.rimage {
    width: 100%; /* 이미지의 최대 너비에 맞게 늘어나도록 설정 */
    height: auto;
}

.hr-image {
    max-width: 600px; /* 구분선 이미지의 최대 너비 설정 */
    width: 100%;
    margin-top: 50px; /* 구분선과 rimage 사이의 간격 조절 */
}
    
    </style>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>

    <section class = "rdetail"  style="display: flex; justify-content: center;">
        <h1>${room_name}</h1>
        <div  class="stc-img-container">
            <img src="image/hr.png" alt="구분선"  class="hr-image">
            <img src="image/stc_1.jpg" class="rimage"  style="width: 700px; margin-top: 150px; margin-bottom: 150px;">
        </div>
        <div class="invite">
            <h2>독서실 소개</h2><br>
            <h4>영업 시간             ${studyRoom.room_description}</h4>
            <h4>가격 <p><h5>시간당 : 1일당: </h5></p></h4>
        </div>
    </section>


    <%@ include file="footer.jsp" %>
</body>
</html>