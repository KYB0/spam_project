<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Q&A 게시판</title>
    <!-- 여기에 필요한 CSS 파일이나 스타일링을 추가할 수 있습니다. -->
</head>

<body>
    <h1>게시판 목록</h1>
    <table border="1">
        <tr>
            <th>글 번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
        <c:forEach items="${qnaBoardDtoList}" var="board">
            <tr>
                <td>${board.board_id}</td>
                <td>${board.user_id}</td>
                <td>${board.board_title}</td>
                <td>${board.board_date}</td>
            </tr>
        </c:forEach>
    </table>

    <h2>글 작성</h2>
    <form action="/spam/qna/write" method="post">
        <input type="text" name="user_id" placeholder="작성자 아이디" required><br>
        <input type="text" name="board_title" placeholder="글 제목" required><br>
        <textarea name="board_content" placeholder="글 내용" rows="4" cols="50" required></textarea><br>
        <input type="submit" value="글 작성">
    </form>
</body>

</html>