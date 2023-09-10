<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            margin-bottom: 100px;
            /* 푸터와의 간격 조절 */
        }

        .rdetail h1 {
            color: #DCE682;
            margin-top: 150px;
            /* 위에서 */
            -webkit-text-stroke: 2px #322A31;
            /* 글자 테두리색 및 두께 (표준) */
            text-transform: uppercase;
        }

        .stc-img-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            max-width: 70%;
            /* 최대 너비 설정 */
            width: 100%;
            height: auto;
        }

        .rimage {
            width: 100%;
            /* 이미지의 최대 너비에 맞게 늘어나도록 설정 */
            height: auto;
        }

        .hr-image {
            max-width: 600px;
            /* 구분선 이미지의 최대 너비 설정 */
            width: 100%;
            margin-top: 50px;
            /* 구분선과 rimage 사이의 간격 조절 */
        }

        .invite {
            display: flex;
            flex-direction: column;
            align-items: center;
            /* 요소들을 수평 가운데 정렬 */
            text-align: center;
            margin-bottom: 150px;
        }


        /* zzim 요소 위치 이동 */
        .zzim {
            /* 원하는 위치로 이동시키기 위한 스타일 설정 */
            margin-left: 500px;
            /* 오른쪽으로 20px 이동 (원하는 값으로 조절) */
        }

        /* 마우스를 가져다 대었을 때 버튼 확대 애니메이션 적용 */
        .zzim-button:hover {
            transform: scale(1.1);
            /* 버튼 크기를 110%로 확대 */
            z-index: 1;
            /* 다른 요소 위에 나타나도록 z-index 설정 */
        }

        /* 이미지 버튼 스타일 설정 */
        .zzim-button {
            background: none;
            border: none;
            padding: 0;
            cursor: pointer;
            transition: transform 0.2s;
            /* 변화에 애니메이션 적용 */
            position: relative;
            /* 버튼의 위치를 상대적으로 설정 */
        }



        /* 이미지 버튼에 마우스를 가져다 대었을 때 이미지 변화 설정 (선택사항) */
        .zzim-button:hover img {
            /* 기본 이미지 설정 */
            content: url('image/like_2.png');
            transition: transform 0.2s, content 0.2s;
            /* 변화에 애니메이션 적용 */
        }

        /* 마우스를 가져다 대었을 때 이미지 크기 조절 및 내용 변경 */
        .zzim-button:hover img {
            transform: scale(1.1);
            /* 이미지 크기를 110%로 확대 */
            content: url('image/like_1.png');
            /* 이미지 내용 변경 */
        }

        /* 클릭한 상태에서 이미지 변경 */
        .zzim-button.clicked img {
            content: url('image/like_1.png');
            /* 클릭한 경우 이미지 변경 */
        }

        /* 클릭한 상태에서 마우스를 가져다 대었을 때 다른 이미지로 변화 */
        .zzim-button.clicked:hover img {
            content: url('image/like_2.png');
            /* 클릭한 상태에서 마우스를 올리면 다른 이미지로 변경 */
        }

        /* 정보 요소에 대한 스타일 (여백 등) */
        .info {
            display: block;
            /* 수직으로 배치하기 위해 display를 block으로 변경 */

        }

        #myform fieldset {
            display: inline-block;
            direction: rtl;
            border: 0;
        }

        #myform fieldset legend {
            text-align: right;
        }

        #myform input[type=radio] {
            display: none;
        }

        #myform label {
            font-size: 3em;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
        }

        #myform label:hover {
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }

        #myform label:hover~label {
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }

        #myform input[type=radio]:checked~label {
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }

        #reviewContents {
            width: 100%;
            height: 150px;
            padding: 10px;
            box-sizing: border-box;
            border: solid 1.5px #D3D3D3;
            border-radius: 5px;
            font-size: 16px;
            resize: none;
        }

        /* 예약하기 버튼 스타일 */
        .reservation-button {
            position: fixed;
            top: 500px;
            /* 상단 여백 조절 */
            right: 200px;
            /* 오른쪽 여백 조절 */
            z-index: 999;
            /* 다른 요소 위에 나타나도록 설정 */
            background-color: #322A31;
            /* 버튼 배경색 */
            color: #DCE682 !important;
            /* 버튼 글자색 */
            padding: 10px 20px;
            /* 버튼 내부 여백 조절 */
            border: none;
            /* 테두리 없애기 */
            cursor: pointer;
            border-radius: 20px;
            /* 둥글게 만들기 */
            text-decoration: none;
            /* 밑줄 제거 */
        }
    </style>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<script>
      document.getElementById('zzim-button').addEventListener('click', function () {
        const room_id = document.getElementById('room_id').value;
        const form = document.getElementById('zzim-form');
        form.action = `/spam/wishList/${room_id}`;
        form.submit();
    });

</script>
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
                <form method="POST" action="/spam/wishList/{room_id}" id="zzim-form">
                <input type="hidden" id="room_id" value="${room_id}">
                <button id="zzim-button" class="zzim-button" type="button">
                    <img src="<c:choose><c:when test='${roomFavorited}'>image/like_1.png</c:when><c:otherwise>image/like_2.png</c:otherwise></c:choose>" alt="찜 버튼" id="zzim-image">
                </button>
            </form>
            </div><br>
            <div class="info">
                <c:forEach items="${rnData}" var="rmd">
                <h4 class="r-description">영업 시간 : ${rmd.room_description}</h4>
                <!-- jquery로 db에서 영업시간(room_description)을 가져온다 (현재 오류남) -->
                <h4 class="r-time">가격  <p>
                        <h5>시간당 : ${rmd.time_price} 원</h5>
                        <h5>1일당 : ${rmd.day_price} 원</h5>
                    </p>
                </h4> <!-- jquery로 db에서 데이터를 가져온다-->
            </c:forEach>
            </div>
        </div>
        <div class="star">
            <h2>평점</h2>

            <form class="mb-3" name="myform" id="myform" method="POST">
                <fieldset>
                    <span class="text-bold">별점을 선택해주세요</span>
                    <input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
                    <input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
                    <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
                    <input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
                    <input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
                </fieldset>
                <div>
                    <textarea class="col-auto form-control" type="text" id="reviewContents"
                        placeholder="후기를 남겨주세요."></textarea>
                </div><br>
                <div>
                    <button type="submit" id="reviewButton" class="btn btn-primary">평점 남기기</button>
                </div>
            </form>

    </section>
    <!-- 예약하기 버튼 -->
    <button class="reservation-button" id="reservation-button">예약하기</button>


    <%@ include file="footer.jsp" %>
</body>
<script>
     // 하트(찜하기) 버튼 클릭 이벤트 처리
     const zzimButton = document.getElementById("zzim-button");

zzimButton.addEventListener("click", function () {
    var room_id = document.getElementById("room_id").value; // JSP에서 방 정보를 가져옴
    const zzimImage = document.getElementById("zzim-image");

    // AJAX를 사용하여 서버에 찜하기 상태 업데이트 요청 보냄
    $.ajax({
        type: "POST",
        url: "/spam/wishList/" + room_id,
        success: function (response) {
            if (response === "찜하기 상태가 업데이트되었습니다.") {
                // 성공적으로 업데이트되었을 경우 이미지 변경 및 메시지 표시
                if (zzimImage.src.endsWith("like_2.png")) {
                    zzimImage.src = "image/like_1.png";
                } else {
                    zzimImage.src = "image/like_2.png";
                }
            } else {
                alert(response); // 실패 메시지 표시
            }
        },
        error: function () {
            alert("오류 발생"); // 오류 메시지 표시
        }
    });
});


  

    $(document).ready(function () {
        // 예약하기 버튼을 클릭했을 때의 동작을 정의합니다.
        $("#reservation-button").click(function () {
            // room_name을 동적으로 가져오거나 설정합니다.
            var room_name = "${room_name}"; // 여기에 실제 데이터 값을 설정하세요.

            // 동적으로 생성된 URL을 만듭니다.
            var reservationURL = "/spam/" + room_name + "/reservation";

            // 사용자를 해당 URL로 이동시킵니다.
            window.location.href = reservationURL;
        });
    });
    var room_name = "${room_name}";


    //리뷰 작성 스크립트
    $(document).ready(function () {
        // 리뷰 폼이 제출될 때의 동작을 정의합니다.
        $("#myform").submit(function (event) {
            event.preventDefault(); // 기본 폼 제출 동작을 중지합니다.

            // 리뷰 폼에서 입력한 데이터를 가져옵니다.
            var reviewStar = $("input[name='reviewStar']:checked").val();
            var reviewContents = $("#reviewContents").val();

            // AJAX 요청을 사용하여 서버에 데이터를 전송합니다.
            $.ajax({
                type: "POST",
                url: "/spam/" + room_id + "review", // 실제 서버 엔드포인트 경로로 대체해야 합니다.
                data: JSON.stringify({
                    reviewStar: reviewStar,
                    reviewContents: reviewContents
                }),
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        // 성공적으로 서버 응답을 받았을 때의 처리를 여기에 추가합니다.
                        // 예: 리뷰가 성공적으로 등록되었음을 사용자에게 알리는 메시지 표시
                        console.log("리뷰 작성 성공");
                    } else {
                        // 서버 요청에 실패한 경우에 대한 처리를 여기에 추가합니다.
                        // 예: 리뷰 작성 실패 메시지 표시 또는 오류 처리
                        console.log("리뷰 작성 실패");
                    }
                },
                error: function () {
                    //서버 요청에 실패한 경우에 대한 처리를 여기에 추가
                    console.error("서버 요청 실패");
                }
            });
        });

        //평점 남기기 버튼에 클릭 이벤트 리스너 추가
        $("#reviewButton").click(function () {
            // 리뷰 폼을 서브밋합니다.
            $("#myform").submit();
        });
    });




</script>

</html>