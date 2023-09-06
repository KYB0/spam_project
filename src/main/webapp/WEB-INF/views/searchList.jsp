<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독서실 검색</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="/spam/css/searchList.css">
</head>
<body>
    <div id="container_id" class="container_class">
        <div id="search_id" class="search_class"> 
            <div class="search_option">
                <form action="ReadingRoomList.jsp" method="get">
                    <div class="search_section">
                        <select id="region" name="region" class="search_input">
                            <option value="">지역</option>
                            <option>전체</option>
                            <option>서울</option>
                            <option>인천</option>
                            <option>경기</option>
                        </select>
                        <input type="text" name="searchKeyword" id="total_ipt_keyword" class="search_input search_keyword" maxlength="30" placeholder="검색어 입력" autocomplete="off">
                        <button type="submit" id="btn_search" class="btn_search">검색</button>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="bg"></div>
        
        <section class="section_search" id="ska_info">
            <div id="ska_info_list">
                <div class="content">
                    <div class="item_ska">
                        <div class="area_ska_info">
                            <h2 class="info_tit">
                                <a target="_blank" title="인천 학익 작살난 독서실" onclick="try{s_trackApply(this, 'search', 'generic')}catch(e){};" rel="" class="data_layer" href="/zf_user/jobs/???"><span>인천 학익 작살난 독서실</span></a>
                            </h2>
                        </div>
                    </div>                
                </div>
            </div>
        </section>
        
        <section class="list-form">
            <ul>
                <c:forEach var="readingRoom" items="${readingRooms}">
                    <li>${readingRoom.name} - ${readingRoom.region}</li>
                </c:forEach>
            </ul>
        </section>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
