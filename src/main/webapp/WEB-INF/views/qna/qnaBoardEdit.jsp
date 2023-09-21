<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <link rel="stylesheet" href="/spam/css/qnaboard.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        .container {
            text-align: center;
            margin-left: 14%;
            margin-top: 9%;
        }

        /* 폼 요소의 스타일 수정 */
        form {
            max-width: 600px;
            /* 원하는 최대 너비 설정 */
            margin: 0 auto;
            /* 가운데 정렬을 위한 왼쪽/오른쪽 마진 자동 설정 */
            margin-bottom: 50px;
        }

        /* 입력 필드와 텍스트 에어리어의 스타일 수정 */
        form input[type="text"],
        form textarea {
            width: 100%;
            /* 가로 폭 100%로 설정하여 부모 폼 너비에 맞게 확장 */
            padding: 10px;
            /* 원하는 패딩 설정 */
            margin-bottom: 10px;
            /* 필요한 경우 여백 조절 */
        }

        form textarea {
            height: 300px;
            /* 원하는 높이로 설정하세요 */
            margin-bottom: 50px;
        }

        .aa {
            text-decoration: none;
            color: #6D8B74;
        }

        .aa:hover {
            color: #1A3C40;
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <div class="container">
        <form action="${pageContext.request.contextPath}/qna/update" method="POST">
            <input type="hidden" name="board_id" value="${board.board_id}">
            <input type="text" id="board_title" name="board_title" value="${board.board_title}" placeholder="제목을 입력하세요"
                required>
            <br>
            <textarea id="board_content" name="board_content" placeholder="내용을 입력하세요"
                required>${board.board_content}</textarea>
            <br>
            <input type="submit" value="수정">
        </form>

        <a href="${pageContext.request.contextPath}/qna/list" class="aa">목록으로 돌아가기</a>
    </div>
    <jsp:include page="/WEB-INF/views/footer.jsp" />
</body>

</html>