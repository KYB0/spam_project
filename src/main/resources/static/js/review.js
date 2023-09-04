// 작성 완료 버튼을 클릭했을 때 실행될 함수
function ratingNreview(event) {
    // 평점 선택 확인
    var selectedRating = document.querySelector('input[name="reviewStar"]:checked');
    if (!selectedRating) {
        alert("별점을 선택해주세요.");
        return false; // 평점이 선택되지 않으면 제출을 중단합니다.
    }

    // 리뷰 내용 확인
    var reviewContents = document.getElementById('reviewContents').value;
    if (reviewContents.trim() === "") {
        alert("이용 후기를 작성해주세요.");
        return false; // 리뷰 내용이 비어있으면 제출을 중단합니다.
    }

    // 선택한 별점과 리뷰 내용을 어딘가에 전달하거나 처리할 수 있습니다.
    // 여기서는 간단하게 alert로 보여줍니다.
    alert("선택한 별점: " + selectedRating.value + "\n리뷰 내용: " + reviewContents);

    // 폼 제출을 중단합니다.
    event.preventDefault();
    return false;
}