<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM</title>
    <style>
        .p-20 {
            width: 20%;
        }

        .p-30 {
            width: 30%;
        }

        .p-50 {
            width: 50%;
        }

        .rtbl-head {
            background-color: pink;
            text-align: center;
            height: 30px;
        }

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
                <h4 class="r-description">영업 시간 ${room_description}</h4>
                <!-- jquery로 db에서 영업시간(room_description)을 가져온다 (현재 오류남) -->
                <h4 class="r-time">가격 <p>
                        <h5>시간당 : 1일당: </h5>
                    </p>
                </h4> <!-- jquery로 db에서 데이터를 가져온다-->
            </div>
        </div>
        <h2>평점</h2>
        <div class="star">

            <form class="mb-3" name="myform" id="myform" method="POST" action="/spam/{room_name}/review">
                <fieldset>
                    <div class="star-container" id="star">
                        <input type="hidden" name="room_id" value="${roomDetail.room_id}">
                        <input type="hidden" name="customer_id" id="customer_id" value=${customer_id}>
                        <span class="text-bold">별점을 선택해주세요</span>
                        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">★</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">★</label>
                        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">★</label>
                        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">★</label>
                        <input type="radio" name="rating" value="1" id="rate5" checked><label for="rate5">★</label>
                    </div>
                </fieldset>
                <div>
                    <textarea class="col-auto form-control" name="review_content" type="text" id="reviewContents"
                        placeholder="후기를 남겨주세요."></textarea>
                </div><br>
                <div>
                    <button type="submit" id="reviewButton" class="btn btn-primary">평점 남기기</button>
                </div>
            </form>

            <!-- 리뷰 목록 표시 -->
            <table style="width: 100%">
                <!-- 제목 테이블 -->
                <tr class="rtbl-head">
                    <td>WRITER</td>
                    <td>CONTENTS</td>
                    <td>DATE</td>
                </tr>
            </table>

            <table style="width: 100%;" id="rtable">
                <c:forEach var="ritem" items="${rList}">
                    <tr>
                        <td class="p-20">${roomDetail.room_id}</td>
                        <td class="p-50">${roomDetail.review_content}</td>
                        <!-- LocalDateTime을 jstl에서 사용하기: pattern에 꼭 'T'추가할것.-->
                        <td class="p-30">
                            <fmt:parseDate value="${ritem.r_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime"
                                type="both" />
                            <fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${parsedDateTime}" />
                        </td>
                    </tr>
                </c:forEach>
            </table>


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

    $(document).ready(function () {
        // 서버에서 room_description 데이터를 가져오는 Ajax 요청
        $.ajax({
            type: "GET",
            url: "/spam/" + room_name, // 실제 서버 엔드포인트 경로로 대체해야 합니다.
            success: function (data) {
                // 성공적으로 데이터를 가져왔을 때
                // 가져온 데이터를 room_description 변수에 할당
                var room_description = data.room_description;

                // room_description을 사용하여 필요한 작업 수행
                // 예: 영업 시간을 표시
                $(".r-description").text("영업 시간 " + room_description);
                console.log(data);
            },
            error: function () {
                // 데이터 가져오기에 실패한 경우에 대한 처리
                console.error("데이터 가져오기 실패");
            }
        });
    });


    //리뷰 작성
    $("#reviewButton").click(function (event) {
        event.preventDefault(); //기본 동작 방지

        let rating = $("input[name='rating']:checked").val(); // 선택된 평점 가져오기
        let review_content = $("#reviewContents").val(); // 리뷰 내용 가져오기
        let customer_id = $("#customer_id").val();
        
        
        let`reviewData = {
            rating: rating, //rating 값을 가져오도록 수정
            review_content: review_content,
            customer_id: customer_id
        
        };

        $.ajax({
            type: "POST",
            url: "/spam/" + room_name + "/review",
            // contentType: "application/json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            // data: JSON.stringify(reviewData),/
            data: reviewData,
            success: function (response) {
                if (response == "success") {
                    // 리뷰가 성공적으로 추가되었을 때 처리
                    // 리뷰 목록을 다시 불러와서 표시
                    loadReviews();
                    alert("리뷰가 성공적으로 작성되었습니다.")
                } else {
                    //리뷰 작성 실패 처리
                    alert("리뷰 작성에 실패했습니다.");
                }
            },
            error: function (error) {
                // 에러 처리
                console.error(error); // 에러 로그 확인
                alert("서버 오류가 발생했습니다.");
            }
        });
    });
</script>

</html>