


// <!-- equipment_return.jsp 파일의 스크립트 섹션을 업데이트하세요 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("returnButton").addEventListener("click", function() {
            // 서버에서 데이터를 가져오기 위한 AJAX 요청
            $.ajax({
                url: "/백엔드-엔드포인트-URL",
                method: "GET",
                success: function(data) {
                    // 가져온 데이터로 입력 필드 업데이트
                    document.getElementById("roomName").value = data.roomName;
                    document.getElementById("equipmentName").value = data.equipmentName;
                    document.getElementById("startTime").value = data.startTime;
                    document.getElementById("returnTime").value = data.returnTime;

                    // 반납 메시지 표시
                    document.getElementById("returnMessage").style.display = "block";
                },
                error: function() {
                    console.log("서버에서 데이터를 가져오는 중 오류가 발생했습니다.");
                }
            });
        });
    });

    
</script>
