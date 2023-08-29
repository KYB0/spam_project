<!DOCTYPE html>
<%@ include file="header.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
    </script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/c_join.js"></script>
</head>

<body>
    <header>
    </header>
    <h1>JOIN</h1>
    <section class="join-form">
        <form action="" method="post">
            <div class="join-area">
                <label for="company_id">아이디:</label>
                <input type="text" id="company_id" name="company_id" required>
                <input type="button" id="id_check" value="중복확인"></input>
                <span id="id_check_msg" style="color: red;"></span>
                <br><br>
            </div>
            <div class="join-area">
                <label for="company_pwd">비밀번호:</label>
                <input type="password" id="company_pwd" name="company_pwd" required><br><br>
            </div>
            <div class="join-area">
                <label for="company_pwd">비밀번호 확인:</label>
                <input type="password" id="company_pwd_re" name="company_pwd_re" required>
                <span id="password_mismatch_msg" style="color: red;"></span>
                <br><br>
            </div>
            <div class="join-area">
                <label for="company_name">이름:</label>
                <input type="text" id="company_name" name="company_name" required><br><br>
            </div>
            <div class="join-area">
                <label for="company_email">이메일:</label>
                <input type="email" id="company_email" name="company_email" required><br><br>
            </div>
            <div class="join-area">
                <label for="company_businessnum">사업자번호:</label>
                <input type="text" id="company_businessnum" name="company_businessnum" required maxlength="12">
                <span id="business_error_msg" style="color: red;"></span>
                <br><br>
            </div>
            <div class="join-area">
                <label for="company_phone">전화번호:</label>
                <input type="tel" id="company_phone" name="company_phone" required maxlength="13"
                    pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" title="전화번호 형식에 맞게 입력해주세요 (010-1234-5678)">
                <span id="phone_error_msg" style="color: red;"></span><br><br>
            </div>

            <button type="submit">가입하기</button>
        </form>
    </section>

    <footer>
        <%@ include file="footer.jsp" %>
    </footer>
    <!-- <script>
        $(document).ready(function () {
            let isIdAvailable = false;
            $("#company_birth").keyup(function () {
                let birth = $(this).val();
                let birthPattern = /^[0-9]{4}[0-9]{2}[0-9]{2}$/;

                let birthErrorMsg = $("#birth_error_msg");

                if (!birthPattern.test(birth)) {
                    birthErrorMsg.html("생년월일 형식에 맞게 입력해주세요 (YYYYMMDD)");
                } else {
                    // 생년월일의 유효성 검사
                    let year = parseInt(birth.substring(0, 4));
                    let month = parseInt(birth.substring(4, 6)) - 1; // 월은 0부터 시작
                    let day = parseInt(birth.substring(6, 8));

                    let date = new Date(year, month, day);

                    if (date.getFullYear() !== year || date.getMonth() !== month || date.getDate() !==
                        day) {
                        birthErrorMsg.html("유효하지 않은 날짜입니다.");
                    } else {
                        birthErrorMsg.html("");
                    }
                }
                // 생년월일 자릿수 제한
                if (birth.replace(/[^0-9]/g, '').length > 8) {
                    $(this).val(birth.substring(0, 8));
                }
            });
            
            // 아이디 중복 확인 버튼 클릭 시
            $("#id_check").click(function () {
                let company_id = $("#company_id").val();
                let idCheckMsg = $("#id_check_msg");

                // 아이디 유효성 검사
                let idPattern = /^[a-z][a-z0-9]{4,11}$/;

                if (!idPattern.test(company_id)) {
                    idCheckMsg.html(
                        "아이디는 영문 소문자로 시작하고, 영문 소문자와 숫자로만 구성되어야 합니다. 길이는 5자 이상 12자 이하여야 합니다."
                    );
                } else {
                    // 유효한 아이디인 경우, 중복 확인 AJAX 요청 보내기
                    $.ajax({
                        url: "/spam/member/check/id", // 아이디 중복 확인 주소로 변경
                        type: "GET",
                        data: {
                            company_id: company_id
                        },
                        success: function (response) {
                            if (response === "exists") {
                                idCheckMsg.html("이미 사용 중인 아이디입니다.");
                                isIdAvailable = false;
                            } else {
                                idCheckMsg.html(
                                    "<span style='color: blue;'>사용 가능한 아이디 입니다.</span>"
                                );
                                isIdAvailable = true;
                            }
                        },
                        error: function () {
                            idCheckMsg.html("아이디 중복 확인 중 오류가 발생했습니다.");
                            isIdAvailable = false;
                        }
                    });
                }
            });

            // 가입하기 버튼 클릭 시
            $("button[type='submit']").click(function (event) {
                if (!isIdAvailable) {
                    event.preventDefault();
                    alert("아이디 중복 확인을 먼저 해주세요.");
                } else {
                    let password = $("#company_pwd").val();
                    let confirmPassword = $("#company_pwd_re").val();
                    let passwordErrorMsg = $("#password_mismatch_msg");

                    if (password !== confirmPassword) {
                        passwordErrorMsg.html("비밀번호가 일치하지 않습니다.");
                        event.preventDefault();
                    } else {
                        passwordErrorMsg.html(""); // 비밀번호 불일치 메시지 초기화

                        // 비밀번호 유효성 검사 추가
                        let passwordPattern =
                            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                        if (!passwordPattern.test(password)) {
                            passwordErrorMsg.html(
                                "비밀번호는 대문자, 소문자, 숫자, 특수문자를 혼합하여 8자 이상으로 설정해야 합니다."
                            );
                            event.preventDefault();
                        } else {
                            // 여기에 폼을 서버로 제출하는 로직을 추가할 수 있습니다.
                        }
                    }
                }
            });


            // 비밀번호 확인 입력란 값 변경 시
            $("#company_pwd_re").keyup(function () {
                let password = $("#company_pwd").val();
                let confirmPassword = $(this).val();
                let mismatchMsg = $("#password_mismatch_msg");

                if (password !== confirmPassword) {
                    mismatchMsg.html("비밀번호가 일치하지 않습니다.");
                } else {
                    mismatchMsg.html("<span style='color: blue;'>비밀번호가 일치합니다.</span>");
                }
            });
            // 전화번호 입력 필드에 자동으로 하이픈 추가 및 유효성 검사
            $("#company_phone").keyup(function () {
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
                    $(this).val(phoneNumber.substring(0, 11));
                }
            });

            // 전화번호 입력 필드에 자동으로 하이픈 추가하는 함수
            const autoHyphen = (target) => {
                target.value = target.value
                    .replace(/[^0-9]/g, '')
                    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
                    .replace(/(\-{1,2})$/g, "");
            };
        });
    </script> -->

</body>

</html>