<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="/WEB-INF/views/footer.jsp" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 작성</title>
    <link rel="stylesheet" href="/spam/css/qnaboard.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <!-- 추가한 스타일시트와 스크립트 파일의 경로를 정확하게 지정해주세요 -->
</head>

<body>

    <div class="container"  style="margin-left: 40%; margin-top: 10%;">

    <form action="${pageContext.request.contextPath}/qna/write" method="post">
        <label for="board_title">제목:</label>
        <input type="text" id="board_title" name="board_title" required>
        <br>
        <label for="board_content">내용:</label>
        <textarea id="board_content" name="board_content" rows="5" required></textarea>
        <br>
        <input type="submit" value="작성">
    </form>

</div>
</body>

</html>