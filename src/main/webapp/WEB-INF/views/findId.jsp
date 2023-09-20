<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/spam/css/findID.css">

   <style>

   </style>
</head>

<body>
    <section class="find-id-form">
        <h1>아이디 찾기</h1>
        <form action="/spam/member/find/id" method="post">
            <div class="int-area">
            <label for="customer_name">이름</label>
            <input type="text" id="customer_name" name="customer_name" required>
        </div>
            <br>
            <div class="int-area">
            <label for="customer_email">이메일</label>
            <input type="email" id="customer_email" name="customer_email" required>
        </div>
            <br>
            <div class="btn-area">
            <button type="submit">아이디 찾기</button>
<<<<<<< HEAD
            <a href="/spam/member/i_login">로그인 화면으로</a>
=======
        </div>
>>>>>>> f362d9e05f2cd58d4e63a6fe25ec9f391ad32c55
        </form>
    </section>
    <%@ include file="footer.jsp" %>
</body>

</html>