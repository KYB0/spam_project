<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>아이디 찾기</h1>
    <section class="find-id-form">
        <form action="/spam/member/find/id" method="post">
            <label for="customer_name">이름:</label>
            <input type="text" id="customer_name" name="customer_name" required>
            <br>
            <label for="customer_email">이메일:</label>
            <input type="email" id="customer_email" name="customer_email" required>
            <br>
            <button type="submit">아이디 찾기</button>
        </form>
    </section>
</body>

</html>