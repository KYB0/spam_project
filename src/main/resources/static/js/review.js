$(document).ready(function () {
    // 폼 제출 시 이벤트 핸들러
    $("#myform").submit(function (event) {
        event.preventDefault(); // 폼의 기본 동작을 막습니다.

        var libraryId = $("#libraryList li.selected").data("library-id"); // 선택한 독서실 ID
        var reviewStar = $("input[name='reviewStar']:checked").val(); // 선택한 별점
        var reviewContents = $("#reviewContents").val(); // 후기 내용

        // 폼 데이터를 서버로 전송합니다.
        $.ajax({
            type: "POST",
            url: "/spam/i_mypage/review/button", // 이 부분은 실제 서버 엔드포인트로 수정해야 합니다.
            data: {
                Id: libraryId,
                reviewStar: reviewStar,
                reviewContents: reviewContents
            },
            success: function (response) {
                // 성공 시 작업을 수행합니다.
                console.log("리뷰가 성공적으로 제출되었습니다.");
                // 여기에 필요한 작업을 추가할 수 있습니다.
            },
            error: function (xhr, status, error) {
                // 오류 시 작업을 수행합니다.
                console.error("리뷰 제출 중 오류 발생:", error);
                // 오류 처리 코드를 추가할 수 있습니다.
            }
        });
    });

    // 독서실 선택 시 이벤트 핸들러
    $("#libraryList li").click(function () {
        $("#libraryList li").removeClass("selected");
        $(this).addClass("selected");
    });
});