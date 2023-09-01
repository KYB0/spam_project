    $(document).ready(function () {
        // 비밀번호 확인 입력란 값 변경 시
        $("#customer_pwd_re").keyup(function () {
            let password = $("#customer_pwd").val();
            let confirmPassword = $(this).val();
            let mismatchMsg = $("#password_mismatch_msg");

            if (password !== confirmPassword) {
                mismatchMsg.html("비밀번호가 일치하지 않습니다.");
            } else {
                mismatchMsg.html("<span style='color: blue;'>비밀번호가 일치합니다.</span>");
            }
        });
        // 전화번호 입력 필드에 자동으로 하이픈 추가하는 함수
        const autoHyphen = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '') // 숫자 이외의 문자 제거
                .replace(/(\d{3})(\d{0,4})(\d{0,4})/, '$1-$2-$3'); // 하이픈 추가
        };

        // 전화번호 입력 필드에 input 이벤트 핸들러 등록
        $("#customer_phone").on("input", function () {
            autoHyphen(this);

            let phoneNumber = $(this).val();
            let phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;

            let phoneErrorMsg = $("#phone_error_msg");

            if (!phonePattern.test(phoneNumber)) {
                phoneErrorMsg.html("전화번호 형식에 맞게 입력해주세요 (-)자동 입력 (010-1234-5678)");
            } else {
                phoneErrorMsg.html("");
            }
            // 전화번호 자릿수 제한
            if (phoneNumber.replace(/[^0-9]/g, '').length > 11) {
                $(this).val(phoneNumber.substring(0, 13));
            }
        });
    });


    function updateAlert() {

        let updateSuccess = true; // 수정 완료 여부 (실제로는 서버 응답에 따라 설정)

        if (updateSuccess) {
            alert("회원 정보 수정 완료");
            return true; // 폼을 제출합니다.
        } else {
            return false;
        }
    }