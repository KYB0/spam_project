<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    
    <link rel="stylesheet" href="/spam/css/payment.css">
</head>

<body>
    <%@ include file="header.jsp" %>

    <!--view-->
    <div id="content">
        <div class="right">
            <!-- 인포 -->
            <form id="paymentForm" method="post">
                <section class="info">
                    <p class="name"><strong>스터디룸 이름</strong><br>${room_name}</p>
                    <!-- Hidden input fields to hold the data -->
                    <input type="hidden" name="room_name" value="${room_name}">
                    
                    <p><strong>Room ID:</strong> ${room_id}</p>
                    <input type="hidden" name="room_id" value="${room_id}">
                    
                    <p><strong>좌석 번호</strong><br>${seat_number}</p>
                    <input type="hidden" name="seat_number" value="${seat_number}">
                    
                    <p><strong>체크인</strong><br>${start_time}</p>
                    <input type="hidden" name="start_time" value="${start_time}">
                    
                    <p><strong>체크아웃</strong><br>${end_time}</p>
                    <input type="hidden" name="end_time" value="${end_time}">
                </section>

            <section class="total_price_pc">
                <p><strong><b>총 결제 금액</b>(VAT포함)</strong>
                    <span class="in_price">495,000원</span></p>
                <ul>
                    <li>해당 가격은 세금, 봉사료가 포함된 금액입니다.</li>
                    <li>결제완료 후 <span>예약자 이름</span>으로 바로
                        <span>체크인</span> 하시면 됩니다
                    </li>
                </ul>
            </section>
            <!-- 인포 완-->

            <!-- 결제수단 -->
            <section class="pay_select">
                <h3>결제수단 선택</h3> <select id="payment-select" class="select_type_1">
                    <option selected="selected" value="KAKAO">
                        카카오페이
                    </option>
                    <option value="TOSS">
                        토스페이
                    </option>
                    <option value="CARD">
                        신용/체크 카드
                    </option>
                    <option value="NAVER">
                        네이버페이
                    </option>
                    <option value="PAYCO">
                        페이코
                    </option>
                    <option value="CARD_BIZ">
                        법인 카드
                    </option>
                    <option value="CELLPHONE">
                        휴대폰 결제
                    </option>
                </select>
                <!---->
                <!---->
            </section>
            <!-- 결제수단 완-->
            <!-- 동의 버튼 -->
            <section class="agree">
                <p class="all_check"><label><input type="checkbox" name="checkAll" class="inp_chk_02">
                        <span>전체 동의</span></label></p>
                <p>
                    <input type="checkbox" name="checkOne" class="inp_chk_02"> <span onclick="pop_agree_01();"><i>이용규칙 및
                            취소/환불규정 동의</i><b>
                            (필수)</b></span></p>
                <p><input type="checkbox" name="checkOne" class="inp_chk_02"> <span onclick="pop_agree_02();"><i>개인정보 수집
                            및 이용 동의</i><b>
                            (필수)</b></span></p>
                <p><input type="checkbox" name="checkOne" class="inp_chk_02"> <span onclick="pop_agree_03();"><i>개인정보 제
                            3자 제공 동의</i><b>
                            (필수)</b></span></p>
                <p class="guest_chk_area"><input type="checkbox" name="checkOne" class="inp_chk_02"> <span
                        onclick="pop_agree_04();"><i>만 14세 이상 확인</i><b> (필수)</b></span></p>
            </section>

            <!-- 동의 버튼 완-->
            <!-- 결제버튼-->
            <button type="submit"  id="btn_pay" class="btn_pay">결제하기</button>
            <!-- 결제버튼 완-->
        </form>

        <script>
$(document).ready(function () {
    $("#btn_pay").click(function () {
        if ($("input[name='checkOne']:checked").length === 4) {
            // 폼 데이터를 직접 가져오기
            var formData = $("#paymentForm").serialize();

            // AJAX를 사용하여 데이터베이스로 데이터 전송
            $.ajax({
                url: "/spam/${room_name}/payment", // 데이터 전송을 처리할 URL
                type: "POST",
                data: formData,
                success: function (data) {
                    // 데이터베이스 전송 성공 시 메시지를 표시
                    alert("데이터베이스로의 전송이 완료되었습니다.");

                    // 여기에서 추가적인 클라이언트 측 동작을 수행할 수 있습니다.
                },
                error: function () {
                    // 데이터베이스 전송 실패 시 오류 메시지 표시
                    alert("데이터베이스로의 전송에 실패했습니다. 다시 시도해주세요.");
                }
            });
        } else {
            alert("모든 동의 사항에 동의해야 합니다.");
        }
    });
});

// 전체 동의 체크박스 변경 시
$('input[name="checkAll"]').on('change', function () {
    $('input[name="checkOne"]').prop('checked', this.checked);
});

// 개별 동의 체크박스 변경 시
$('input[name="checkOne"]').on('change', function () {
    const allChecked = $('input[name="checkOne"]').toArray().every(input => input.checked);
    $('input[name="checkAll"]').prop('checked', allChecked);
});

        </script>
        </div>
        <!-- 오른쪽  완료-->

        <div class="left">
            <section> </section>
            <section> </section>
            <div>

            </div>

        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>

</html>