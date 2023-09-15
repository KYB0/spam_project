<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 및 리뷰 내역</title>
    <link rel="stylesheet" href="/spam/css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/cancelButton.js"></script>
    

</head>

<body>

    <section class="i_menu">
        <div class="btn_i_menu">
            <a href="${pageContext.request.contextPath}/i_mypage" class="active"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>마이페이지</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list/like_list" id="button--open"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>찜 목록</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>예약 및 리뷰</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/myqna"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>나의 문의 내역</button></a>
            <!-- 원하는 메뉴 항목들을 추가할 수 있습니다. -->
        </div>
    </section>
    <section class="list-form">
        <a href="/spam/i_mypage/list">예약 내역</a>
        <a href="/spam/i_mypage/list/review_list">내가 작성한 리뷰</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">예약 ID</th>
                    <th scope="col">고객 ID</th>
                    <th scope="col">좌석 번호</th>
                    <th scope="col">시작 시간</th>
                    <th scope="col">종료 시간</th>
                    <th scope="col">예약 여부</th>
                    <th scope="col">예약 상태</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reservationList}" var="reservation">
                    <tr>
                        <td>${reservation.reservation_id}</td>
                        <td>${reservation.customer_id}</td>
                        <td>${reservation.seat_number}</td>
                        <td>${reservation.start_time}</td>
                        <td>${reservation.end_time}</td>
                        <td>${reservation.status}</td>
                        <td>
                            <script>
                                var status = "${reservation.status}";
                                var start_time = "${reservation.start_time}";
                                var end_time = "${reservation.end_time}";
                                var currentTime = new Date().getTime();
            
                                if (status === '0') {
                                    document.write("취소 완료");
                                } else if (currentTime < new Date(start_time).getTime()) {
                                    document.write("예약 완료");
                                } else if (currentTime > new Date(end_time).getTime()){
                                    document.write("이용 완료");
                                } else {
                                    document.write("취소 불가");
                                }
                            </script>
                        </td>
                        <td>
                            <form action="/spam/{room_name}/cancel" method="post" onsubmit="return confirmCancel('${reservation.status}', '${reservation.start_time}');">
                                <input type="hidden" name="reservation_id" value="${reservation.reservation_id}">
                                <button type="submit">예약 취소</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                
            </tbody>
        </table>

        <!-- 페이징 -->
        <div class="pagination">
            <c:if test="${totalPages > 1}">
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/i_mypage/list?page=${currentPage - 1}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">이전</span>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                    <c:url var="pageUrl" value="${pageContext.request.contextPath}/i_mypage/list">
                        <c:param name="page" value="${pageNumber}" />
                    </c:url>
                    <c:choose>
                        <c:when test="${pageNumber == currentPage}">
                            <span class="current-page">${pageNumber}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageUrl}">${pageNumber}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/i_mypage/list?page=${currentPage + 1}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">다음</span>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>

    </section>
</body>

</html>