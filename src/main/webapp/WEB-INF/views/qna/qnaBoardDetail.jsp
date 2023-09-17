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

    <!-- 댓글 표시 영역 -->
    <h2>댓글</h2>
    <table>
        <thead>
            <tr>
                <th>작성자</th>
                <th>내용</th>
                <th>작성일</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody id="comments">
            <!-- 댓글이 여기에 동적으로 추가됩니다. -->
        </tbody>
    </table>

    <!-- 댓글 입력 폼 -->
    <h3>댓글 작성</h3>
    <form id="commentForm">
        <input type="hidden" name="board_id" value="${board.board_id}">
        <label for="comment_content">댓글 내용:</label>
        <textarea id="comment_content" name="comment_content" rows="4" cols="50"></textarea>
        <br>
        <input type="button" value="댓글 작성" onclick="addComment()">
    </form>

    <!-- 댓글 수정 폼 -->
    <h3>댓글 수정</h3>
    <form id="editCommentForm" style="display: none;">
        <input type="hidden" id="editCommentId" name="comment_id">
        <label for="editCommentContent">댓글 내용:</label>
        <textarea id="editCommentContent" name="comment_content" rows="4" cols="50"></textarea>
        <br>
        <input type="button" value="댓글 수정" onclick="editComment()">
    </form>

    <a href="${pageContext.request.contextPath}/qna/list">목록으로 돌아가기</a>

    <script>
        // 특정 페이지의 댓글을 로드하는 JavaScript 함수
        function loadComments(page) {
            let boardId = "${board.board_id}";

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/comments/getByBoardId/" + boardId + "?page=" + page,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 댓글 목록을 초기화
                    $("#comments").empty();

                    // 서버에서 가져온 댓글을 화면에 추가
                    for (let i = 0; i < data.length; i++) {
                        let commentHtml = "<tr>" +
                            "<td>" + data[i].user_id + "</td>" +
                            "<td>" + data[i].comment_content + "</td>" +
                            "<td>" + data[i].comment_date + "</td>" +
                            "<td><a href='#' onclick='openEditForm(" + data[i].comment_id + ", \"" + data[i]
                            .comment_content + "\")'>수정</a></td>" +
                            "<td><a href='#' onclick='deleteComment(" + data[i].comment_id +
                            ")'>삭제</a></td>" +
                            "</tr>";
                        $("#comments").append(commentHtml);
                    }
                },
                error: function () {
                    alert("댓글 불러오기 실패");
                }
            });
        }

        // 페이지 로드 시 초기 댓글 페이지를 로드합니다.
        $(document).ready(function () {
            loadComments(1);
        });
        // 페이지 로드 시 댓글 가져오기
        $(document).ready(function () {
            getComments();
        });

        // JavaScript function to confirm deletion
        function confirmDelete(boardId) {
            if (confirm("게시글을 삭제하시겠습니까?")) {
                let form = document.createElement("form");
                form.method = "POST";
                form.action = "${pageContext.request.contextPath}/qna/delete?board_id=" + boardId;
                document.body.appendChild(form);
                form.submit();
            }
        }

        // JavaScript function to open edit form
        function openEditForm(commentId, commentContent) {
            $("#editCommentId").val(commentId);
            $("#editCommentContent").val(commentContent);
            $("#editCommentForm").show();
        }

        // AJAX로 댓글 추가
        function addComment() {
            let boardId = "${board.board_id}";
            let commentContent = $("#comment_content").val();

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/comments/add",
                data: JSON.stringify({
                    board_id: boardId,
                    comment_content: commentContent
                }),
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 댓글 추가 성공 시 화면에 댓글 추가
                    getComments();
                    // 입력 폼 초기화
                    $("#comment_content").val("");
                },
                error: function () {
                    location.href = "/spam/member/i_login";
                    alert("댓글 추가 실패");
                }
            });
        }

        // AJAX로 댓글 수정
        function editComment() {
            let commentId = $("#editCommentId").val();
            let editedContent = $("#editCommentContent").val();

            $.ajax({
                type: "PUT",
                url: "${pageContext.request.contextPath}/comments/" + commentId,
                data: JSON.stringify({
                    comment_content: editedContent
                }),
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 댓글 수정 성공 시 화면 갱신
                    getComments();
                    // 폼 초기화 및 닫기
                    $("#editCommentId").val("");
                    $("#editCommentContent").val("");
                    $("#editCommentForm").hide();
                },
                error: function () {
                    alert("댓글 수정 실패");
                }
            });
        }

        // AJAX로 댓글 삭제
        function deleteComment(commentId) {
            $.ajax({
                type: "DELETE",
                url: "${pageContext.request.contextPath}/comments/" + commentId,
                success: function () {
                    // 댓글 삭제 성공 시 화면 갱신
                    getComments();
                },
                error: function () {
                    alert("댓글 삭제 실패");
                }
            });
        }

        // AJAX로 댓글 가져오기
        function getComments() {
            let boardId = "${board.board_id}";

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/comments/getByBoardId/" + boardId,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 댓글 목록을 초기화
                    $("#comments").empty();

                    // 서버에서 가져온 댓글을 화면에 추가
                    for (let i = 0; i < data.length; i++) {
                        let commentHtml = "<tr>" +
                            "<td>" + data[i].user_id + "</td>" +
                            "<td>" + data[i].comment_content + "</td>" +
                            "<td>" + data[i].comment_date + "</td>" +
                            "<td><a href='#' onclick='openEditForm(" + data[i].comment_id + ", \"" + data[i]
                            .comment_content + "\")'>수정</a></td>" +
                            "<td><a href='#' onclick='deleteComment(" + data[i].comment_id +
                            ")'>삭제</a></td>" +
                            "</tr>";
                        $("#comments").append(commentHtml);
                    }
                },
                error: function () {
                    alert("댓글 불러오기 실패");
                }
            });
        }
    </script>
</body>

</html>