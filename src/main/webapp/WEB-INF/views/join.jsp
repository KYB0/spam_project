<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/spam/js/memberButton.js"></script>
</head>
<body>
    <h1>회원가입 화면</h1>
    <script>
        function redirectToLogin() {
            window.location.href = "/join"; // 회원가입 페이지의 URL로 변경
        }
        </script>
</body>
</html>