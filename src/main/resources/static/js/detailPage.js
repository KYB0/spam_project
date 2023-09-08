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
