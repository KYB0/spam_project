// // 결제완료 창
// $(document).ready(function () {
//     $('#btn_pay').on('click', function () {
//         console.log('결제가 완료되었습니다.');
//         alert('결제가 완료되었습니다.');
//     });
// });

// 동의하기 버튼 클릭 시 동의 여부 검사
$(document).ready(function () {
$('#btn_pay').on('click', function () {
    const allChecked = document.querySelector('input[name="checkAll"]').checked;
    const checkOneInputs = document.querySelectorAll('input[name="checkOne"]');

    // if (!allChecked) {
    //     alert('모든 필수 동의 항목에 동의해주세요.');
    //     return;
    // }    // 더미는 이렇게 주석처리 ㄱㅊ but 나중에 필수동의 항목 체크 필터 필요

    let isAllAgreed = true;
    checkOneInputs.forEach(input => {
        if (!input.checked) {
            isAllAgreed = false;
        }
    });

    if (isAllAgreed) {
        console.log('결제가 완료되었습니다.');
        alert('결제가 완료되었습니다.');
    } else {
        alert('모든 필수 동의 항목에 동의해주세요.');
    }
});
});


// --동의 체크박스-- 
document.addEventListener("DOMContentLoaded", function () {
const checkAll = document.querySelector('input[name="checkAll"]');
const checkOneInputs = document.querySelectorAll('input[name="checkOne"]');

// 전체 동의 체크박스 변경 시
checkAll.addEventListener("change", function () {
    const isChecked = checkAll.checked;
    checkOneInputs.forEach(input => {
        input.checked = isChecked;
    });
});

// 개별 동의 체크박스 변경 시
checkOneInputs.forEach(input => {
    input.addEventListener("change", function () {
        let allChecked = true;
        checkOneInputs.forEach(checkOneInput => {
            if (!checkOneInput.checked) {
                allChecked = false;
            }
        });
        checkAll.checked = allChecked;
    });
});
});