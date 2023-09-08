<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A 게시판</title>
    <link rel="stylesheet" href="/spam/css/css.css">
    <script src="/js/jquery-3.7.0.min.js"></script>
</head>

<body>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>작성자 유형</th>
                <th>작성자 ID</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${qnaBoardList}" var="board">
                <c:set var="writer_id" value="${not empty board.customer_id ? board.customer_id : board.company_id}" />
                <c:set var="writer_type" value="${not empty board.customer_id ? 'Customer' : 'Company'}" />
                <tr>
                    <td>${board.board_id}</td>
                    <td>${board.writer_type}</td>
                    <td>${board.writer_id}</td>
                    <td>${board.board_title}</td>
                    <td>${board.board_content}</td>
                    <td>${board.board_date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- <div class="board_wrap">
        <div class="board_title">
            <Strong>QnA 게시판</Strong>
            <p>aaaaa</p>
        </div>
        <div class="board_list_wrap">
            <div class="search-area">
                <select id="sel">
                    <option value="b_title" selected>제목</option>
                    <option value="b_contents">내용</option>
                </select> <input type="text" id="keyword">
                <button id="search">검색</button>
            </div>
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
            </div>
            <div class="board_page">

            </div>
            <div class="bt_wrap">
                <a href="#" class="on">목록</a>
                <a href="#">수정</a>
            </div>
        </div>
    </div> -->

</body>

</html>