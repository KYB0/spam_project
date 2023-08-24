<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/js/jquery-3.7.0.min.js"></script>
</head>

<body>
    <script>
        function checkLogin() {
            if (sessionStorage.getItem('loggedIn') !== 'true') {
                alert('로그인이 필요합니다.');
                window.location.href = "${pageContext.request.contextPath}/member/i_login"; // 로그인 페이지 URL로 변경
                return false; // 링크 클릭 동작 중지
            }
            return true; // 링크 클릭 동작 계속 진행
        }
    </script>
</body>
</html>