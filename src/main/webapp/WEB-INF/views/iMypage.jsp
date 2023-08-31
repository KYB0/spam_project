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
    <h1>마이 페이지</h1>
    <form action="${pageContext.request.contextPath}/member/i_mypage" method="post">
        <input type="hidden" name="userId" value="${member.customer_id}" />
        <p> <label for="username">이름:</label>
        <input type="text" id="username" name="username" value="${user.username}" /><br></p>

        <p> <label for="userID">아이디:</label>
        <input type="text" id="userID" name="userID" value="${user.userID}" /><br></p>

        <p> <label for="userID">패스워드:</label>
        <input type="password" id="userPw" name="userPw" value="${user.userPw}" /><br></p>

        <p> <label for="userID">패스워드 확인:</label>
        <input type="password" id="userPwc" name="userPwc" value="${user.userpWc}" /><br></p>

        <p> <label for="userID">휴대전화:</label>
        <input type="text" id="userpNum" name="userpNum" value="${user.userpNum}" /><br></p>

        <p> <label for="email">이메일:</label>
        <input type="text" id="userEmail" name="userEmail" value="${user.userEmail}" /><br></p>
        <!-- 필요한 정보 수정 필드 추가 -->

        <input type="submit" value="회원 탈퇴" />
        <input type="submit" value="정보 수정" />
    </form>
</body>
</html>
