<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/spam/css/review.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/review.js"></script>
</head>

<body>
    <h1>이용 후기 리뷰</h1>

    <form id="" action="/spam/i_mypage/review">
        <ul id="libraryList">
            <li data-library-id="1">도서실 1</li>
            <li data-library-id="2">도서실 2</li>
            <!-- 다른 독서실 항목 추가 -->
        </ul>
    </form>



    <form class="mb-3" name="myform" id="myform" method="post">
        <fieldset>
            <span class="text-bold">별점을 선택해주세요</span>
            <input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
            <input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
            <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
            <input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
            <input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
        </fieldset>
        <div>
            <textarea class="col-auto form-control" type="text" id="reviewContents"
                placeholder="이용 후기를 작성해주세요."></textarea>
            <button type="submit" name="reviewEnter">작성 완료</button>
        </div>
    </form>

</body>

</html>