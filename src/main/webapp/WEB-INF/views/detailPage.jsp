<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM</title>
    <link rel="stylesheet" href="/spam/css/detailPage.css">

    
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>

<body>
    <%@ include file="header.jsp" %>

    <section class="rdetail" style="display: flex; justify-content: center;">
        <h1>${room_name}</h1>
        <div class="stc-img-container">
            <img src="image/hr.png" alt="구분선" class="hr-image">
            <img src="image/stc_1.jpg" class="rimage" style="width: 700px; margin-top: 150px; margin-bottom: 150px;">
        </div>
        <div class="invite">
            <h2>독서실 소개</h2>
            <div class="zzim">
                <button id="zzim-button" class="zzim-button">
                    <img src="image/like_2.png" alt="찜 버튼" id="zzim-image">
                </button>
            </div><br>
            <div class="info">
                <h4 class="r-description">영업 시간 ${room_description}</h4> <!-- jquery로 db에서 영업시간(room_description)을 가져온다 (현재 오류남) -->
                <h4 class="r-time">가격 <p>
                        <h5>시간당 : 1일당: </h5>
                    </p>
                </h4> <!-- jquery로 db에서 데이터를 가져온다-->
            </div>
        </div>
        <div class="star">
            <h2>평점</h2>

            <form class="mb-3" name="myform" id="myform" method="post">
                <fieldset>
                    <span class="text-bold">별점을 선택해주세요</span>
                    <input type="radio" name="reviewStar" value="5" id="rate1"><label
                        for="rate1">★</label>
                    <input type="radio" name="reviewStar" value="4" id="rate2"><label
                        for="rate2">★</label>
                    <input type="radio" name="reviewStar" value="3" id="rate3"><label
                        for="rate3">★</label>
                    <input type="radio" name="reviewStar" value="2" id="rate4"><label
                        for="rate4">★</label>
                    <input type="radio" name="reviewStar" value="1" id="rate5"><label
                        for="rate5">★</label>
                </fieldset>
                <div>
                    <textarea class="col-auto form-control" type="text" id="reviewContents"
                              placeholder="이용 후기를 남겨주세요."></textarea>
                </div><br>
                <div>
                    <button type="submit" class="btn btn-primary">평점 남기기</button>
                </div>
            </form>							

        </div>

    </section>
    <!-- 예약하기 버튼 -->
    <button class="reservation-button" id="reservation-button">예약하기</button>


    <%@ include file="footer.jsp" %>
</body>
<script>
    // 이미지 버튼 클릭 이벤트 처리
    const zzimButton = document.getElementById("zzim-button");
    let isClicked = false; // 이미지 버튼 클릭 상태를 나타내는 변수

    zzimButton.addEventListener("click", function () {
        const zzimImage = document.getElementById("zzim-image");
        if (!isClicked) {
            zzimImage.src = "image/like_1.png"; // 클릭한 경우 이미지 변경
        } else {
            zzimImage.src = "image/like_2.png"; // 이미지를 원래 상태로 변경
        }
        isClicked = !isClicked; // 클릭 상태를 반전
    });

    $(document).ready(function() {
    // 예약하기 버튼을 클릭했을 때의 동작을 정의합니다.
    $("#reservation-button").click(function() {
        // room_name을 동적으로 가져오거나 설정합니다.
        var room_name = "${room_name}"; // 여기에 실제 데이터 값을 설정하세요.

        // 동적으로 생성된 URL을 만듭니다.
        var reservationURL = "/spam/" + room_name + "/reservation";

        // 사용자를 해당 URL로 이동시킵니다.
        window.location.href = reservationURL;
    });
});
var room_name = "${room_name}";

$(document).ready(function() {
    // 서버에서 room_description 데이터를 가져오는 Ajax 요청
    $.ajax({
        type: "GET",
        url: "/spam/" + room_name, // 실제 서버 엔드포인트 경로로 대체해야 합니다.
        success: function(data) {
            // 성공적으로 데이터를 가져왔을 때
            // 가져온 데이터를 room_description 변수에 할당
            var room_description = data.room_description;

            // room_description을 사용하여 필요한 작업 수행
            // 예: 영업 시간을 표시
            $(".r-description").text("영업 시간 " + room_description);
            console.log(data);
        },
        error: function() {
            // 데이터 가져오기에 실패한 경우에 대한 처리
            console.error("데이터 가져오기 실패");
        }
    });
});

$(document).ready(function() {
    // 서버에서 room_description 데이터를 가져오는 Ajax 요청
    $.ajax({
        type: "GET",
        url: "/spam/" + room_name, // 실제 서버 엔드포인트 경로로 대체해야 합니다.
        success: function(data) {
            // 성공적으로 데이터를 가져왔을 때
            // 가져온 데이터를 room_description 변수에 할당
            var room_description = data.room_description;

            // room_description을 사용하여 필요한 작업 수행
            // 예: 영업 시간을 표시
            $(".r-description").text("영업 시간 " + room_description);
            console.log(data);
        },
        error: function() {
            // 데이터 가져오기에 실패한 경우에 대한 처리
            console.error("데이터 가져오기 실패");
        }
    });
});

</script>

</html>