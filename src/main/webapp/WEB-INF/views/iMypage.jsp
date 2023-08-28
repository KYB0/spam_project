<!DOCTYPE html>
<%@ include file="Cheader.jsp" %>
<%@ include file="footer.jsp" %>
<html>
<head>
    <title>마이 페이지</title>
</head>
<body>
   <br> <div>
        <p><label for="name">이름:</label>
        <input type="text" id="name" /> </p>
    </div>
    <div>
        <p><label for="id">아이디:</label>
        <input type="text" id="id" /></p>
    </div>
    <div>
        <p><label for="pw">패스워드:</label>
        <input type="password" id="pw" /></p>
    </div>
    <div>
        <p><label for="pwc">패스워드 확인:</label>
        <input type="password" id="pwc" /></p>
    </div>
    <div>
        <p><label for="pNum">휴대전화:</label>
        <input type="text" id="pNum" /></p>
    </div>
    <div>
        <p><label for="email">이메일:</label>
        <input type="text" id="email" /></p>
    </div>
    <!-- 나머지 필드들도 동일한 방식으로 추가 -->
    
    <button id="resignButton">회원 탈퇴</button>
    <button id="updateButton">수정 완료</button>
    <script src="mypage.js"></script>
</body>
</html>