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
    <script src="/spam/js/i_join.js"></script>
</head>

<body>
    <header>
    </header>
    <h1>JOIN</h1>
    <section class="join-form">
        <form action="/spam/member/i_login" method="post">
            <div class="join-area">
                <label for="customer_id">아이디:</label>
                <input type="text" id="customer_id" name="customer_id" required>
                <input type="button" id="id_check" value="중복확인"></input>
                <span id="id_check_msg" style="color: red;"></span>
                <br><br>
            </div>
            <div class="join-area">
                <label for="customer_pwd">비밀번호:</label>
                <input type="password" id="customer_pwd" name="customer_pwd" required><br><br>
            </div>
            <div class="join-area">
                <label for="customer_pwd">비밀번호 확인:</label>
                <input type="password" id="customer_pwd_re" name="customer_pwd_re" required>
                <span id="password_mismatch_msg" style="color: red;"></span>
                <br><br>
            </div>
            <div class="join-area">
                <label for="customer_name">이름:</label>
                <input type="text" id="customer_name" name="customer_name" required><br><br>
            </div>
            <div class="join-area">
                <label for="customer_email">이메일:</label>
                <input type="email" id="customer_email" name="customer_email" required><br><br>
            </div>
            <div class="join-area">
                <label for="customer_birth">생년월일:</label>
                <input type="text" id="customer_birth" name="customer_birth" required maxlength="8">
                <span id="birth_error_msg" style="color: red;"></span><br><br>
            </div>
            <div class="join-area">
                <label for="customer_phone">전화번호:</label>
                <input type="tel" id="customer_phone" name="customer_phone" required maxlength="13"
                    pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" title="전화번호 형식에 맞게 입력해주세요 (010-1234-5678)">
                <span id="phone_error_msg" style="color: red;"></span><br><br>
            </div>

            <button type="submit">가입하기</button>
        </form>
    </section>

    <footer>
        <%@ include file="footer.jsp" %>
    </footer>

</body>

</html>