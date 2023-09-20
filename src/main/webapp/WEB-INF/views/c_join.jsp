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
    <link rel="stylesheet" href="/spam/css/join.css">
</head>
<style>
         body{
            background-color: #f0e9e4 !important;  /* 밝은 베이지 */
        }
</style>

<body>
    <header>
    </header>
    <h1>JOIN</h1>
    <section class="join-form">
        <form action="" method="post">
            <div class="join-area">
                <input type="hidden" name="company_id" id="customer_id">
                <label for="company_id">아이디:</label>
                <input type="text" id="company_id" name="company_id" autocomplete="off" required>
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

</body>

</html>