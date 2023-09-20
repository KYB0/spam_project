﻿<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        /* Reset some default browser styles */
        body,
        h1,
        form {
            margin: 0;
            padding: 0;
        }

        /* Apply some basic styling to the body */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }

        /* Style the header */
        h1 {
            background-color: #007acc;
            color: #fff;
            padding: 20px 0;
        }

        /* Style the form container */
        .find-id-form {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin: 20px auto;
            max-width: 400px;
        }

        /* Style form labels */
        label {
            display: block;
            margin-bottom: 10px;
        }

        /* Style form input fields */
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Style the submit button */
        button[type="submit"] {
            background-color: #007acc;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }

        /* Hover effect for the submit button */
        button[type="submit"]:hover {
            background-color: #005d9f;
        }
    </style>
</head>

<body>
    <section class="find-id-form">
        <h1>아이디 찾기</h1>
        <form action="/spam/member/find/id" method="post">
            <label for="customer_name">이름</label>
            <input type="text" id="customer_name" name="customer_name" required>
            <br>
            <label for="customer_email">이메일</label>
            <input type="email" id="customer_email" name="customer_email" required>
            <br>
            <button type="submit">아이디 찾기</button>
        </form>
    </section>
</body>

</html>