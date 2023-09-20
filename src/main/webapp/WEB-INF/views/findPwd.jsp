﻿<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/spam/css/findID.css">
</head>

<body>
    <%@ include file="header.jsp" %>
    
    <section class="find-id-form">
        <h1>비밀번호 찾기</h1>
        <form action="/spam/member/find/pwd" method="post">
            <div class="int-area">
            <label for="customer_name">아이디:</label>
            <input type="text" id="customer_id" name="customer_id" required>
        </div>
            <br>
            <div class="int-area">
            <label for="customer_email">이메일:</label>
            <input type="email" id="customer_email" name="customer_email" required>
        </div>
            <br>
            <div class="btn-area">
            <button type="submit">비밀번호 찾기</button>
        </div>
        </form>
    </section>
    <%@ include file="footer.jsp" %>
</body>

</html>