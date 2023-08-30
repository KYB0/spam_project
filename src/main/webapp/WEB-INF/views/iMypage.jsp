<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
</head>
<body>
    <h1>Edit My Page</h1>
    <form action="/member/i_mypage" method="post">
        <label for="customer_name">이름:</label>
        <input type="text" id="customer_name" name="customer_name" value="${member.customer_name}" required><br>

        <label for="customer_id">아이디:</label>
        <input type="text" id="customer_id" name="customer_id" value="${member.customer_id}" required><br>

        <label for="customer_pwd">비밀번호:</label>
        <input type="password" id="customer_pwd" name="customer_pwd" value="${member.customer_pwd}" required><br>

        <label for="customer_pwc">비밀번호 확인:</label>
        <input type="password" id="customer_pwc" name="customer_pwc" value="${member.customer_pwd}" required><br>

        <label for="customer_email">이메일:</label>
        <input type="email" id="customer_email" name="customer_email" value="${member.customer_email}" required><br>

        <label for="customer_phone">전화번호:</label>
        <input type="text" id="customer_phone" name="customer_phone" value="${member.customer_phone}" required><br>
        <!-- 다른 필드들도 동일하게 작성 -->

        <button type="submit">회원 탈퇴</button>
        <button type="submit">수정 완료</button>
    </form>
</body>
</html>
