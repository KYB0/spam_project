<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 작성</title>
    <!-- <link rel="stylesheet" href="/spam/css/css.css"> -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <!-- 추가한 스타일시트와 스크립트 파일의 경로를 정확하게 지정해주세요 -->
</head>

<body>
    <header>
        <jsp:include page="/WEB-INF/views/header.jsp" />
    </header>

    <h1>글 작성</h1>

    <!-- 글 작성 폼 -->
    <form action="${pageContext.request.contextPath}/qna/write" method="post">
        <label for="board_title">제목:</label>
        <input type="text" id="board_title" name="board_title" required>
        <br>
        <label for="board_content">내용:</label>
        <textarea id="board_content" name="board_content" rows="5" required></textarea>
        <br>
        <input type="submit" value="작성">
    </form>

    <footer>
        <!-- 푸터 내용을 추가하거나 수정하세요 -->
    </footer>
</body>

</html>