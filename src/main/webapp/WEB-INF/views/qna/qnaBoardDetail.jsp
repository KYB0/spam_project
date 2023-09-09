<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>게시글 상세보기</title>
            <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        </head>

        <body>
            <h1>게시글 상세보기</h1>

            <c:if test="${not empty board}">
                <table>
                    <tr>
                        <td>게시글 번호:</td>
                        <td>${board.board_id}</td>
                    </tr>
                    <tr>
                        <td>작성자:</td>
                        <td>${board.user_id}</td>
                    </tr>
                    <tr>
                        <td>제목:</td>
                        <td>${board.board_title}</td>
                    </tr>
                    <tr>
                        <td>내용:</td>
                        <td>${board.board_content}</td>
                    </tr>
                    <tr>
                        <td>작성일:</td>
                        <td>${board.board_date}</td>
                    </tr>
                </table>

                <!-- Edit and Delete Buttons -->
                <c:if test="${loggedInUserId eq board.user_id}">
                    <a href="${pageContext.request.contextPath}/qna/edit?board_id=${board.board_id}">수정</a>
                    <a href="#" onclick="confirmDelete('${board.board_id}')">삭제</a>
                </c:if>
            </c:if>

            <a href="${pageContext.request.contextPath}/qna/list">목록으로 돌아가기</a>

            <script>
                // JavaScript function to confirm deletion
                function confirmDelete(boardId) {
                    if (confirm("게시글을 삭제하시겠습니까?")) {
                        var form = document.createElement("form");
                        form.method = "POST";
                        form.action = "${pageContext.request.contextPath}/qna/delete?board_id=" + boardId;
                        document.body.appendChild(form);
                        form.submit();
                    }
                }

            </script>
        </body>

        </html>