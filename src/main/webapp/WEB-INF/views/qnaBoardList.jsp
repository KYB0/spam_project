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
    <h1>Q&A 게시판</h1>
    
    <!-- 게시물 목록을 표시하기 위한 테이블 -->
    <table border="1">
        <tr>
            <th>ID</th>
            <th>작성자 유형</th>
            <th>작성자 ID</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성일</th>
        </tr>
        <!-- qnaBoardDtoList에 있는 게시물을 반복해서 표시 -->
        <c:forEach items="${qnaBoardDtoList}" var="board">
            <tr>
                <td>${board.board_id}</td>
                <td>${board.writer_type}</td>
                <td>${board.writer_id}</td>
                <td>${board.board_title}</td>
                <td>${board.board_content}</td>
                <td>${board.board_date}</td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- 여기에 페이징이나 다른 UI 요소를 추가할 수 있습니다. -->
</body>
</html>
