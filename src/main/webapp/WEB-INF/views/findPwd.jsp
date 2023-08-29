<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>비밀번호 찾기</h1>
    <section class="find-id-form">
        <form action="/spam/member/find/pwd" method="post">
            <label for="customer_name">아이디:</label>
            <input type="text" id="customer_id" name="customer_id" required>
            <br>
            <label for="customer_email">이메일:</label>
            <input type="email" id="customer_email" name="customer_email" required>
            <br>
            <button type="submit">비밀번호 찾기</button>
        </form>
    </section>
</body>

</html>