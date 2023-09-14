    // 예약 취소 버튼 클릭 시 실행되는 함수
    function cancelReservation(reservationId) {
        if (confirm("이 예약을 취소하시겠습니까?")) { // 사용자에게 확인 메시지 표시
            // AJAX 요청을 사용하여 서버로 예약 취소 요청 전송
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "cancel_reservation", true); // 적절한 URL로 수정
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // 성공적으로 처리된 경우 예약 행을 삭제하거나 업데이트합니다.
                    const row = document.getElementById("reservation-row-" + reservationId);
                    if (row) {
                        row.remove();
                    }
                }
            };
            // reservationId를 서버로 전송
            const formData = "reservation_id=" + encodeURIComponent(reservationId);
            xhr.send(formData);
        }
    }
