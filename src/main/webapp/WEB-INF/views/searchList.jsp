<!DOCTYPE html>
<%@ include file="header.jsp" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 필요한 추가 스타일이나 스크립트 -->
</head>
<body>

    <!-- 기존의 내용 -->
    <div class="input-group" >  
        <span class="input-group-addon" id="basic-addon1">지역별</span>
        <div class="btn-group">         
            <select id="cda_type" name="cda_mapping" style="height:30px;">
                <option>서울</option>
                <option>인천</option>
                <option>경기</option>
                <option>대전</option>
                <option>대구</option>
                <option>부산</option>
                <option>제주</option>
            </select>
        </div>
                <c:forEach var="group" items="${groupList}">
                    <option value="${group.code_type_no}">${group.code_type_name}</option>
                </c:forEach>
            </select>
        <div>
    
            <form action="/search" method="get">
                <input type="text" name="keyword" placeholder="독서실 이름">
                <button type="submit">검색</button>
            </form>
        </div>
    </div>

    <!-- 조회버튼 <div align="right">
        <button class="btn btn-primary" name="btnSearch" id="btnSearch">조회</button>
    </div> -->

    <!-- 독서실 검색 추가 부분 -->
   

    <!-- 기존의 스크립트 -->
    <!--조회버튼 <script>
        $(document).on('click', '#btnSearch', function(e) {
            e.preventDefault();
            var url = "${pageContext.request.contextPath}/inspection/list";
        url = url + "?cda_mapping=" + $('#cda_type').val();
        url = url + "&inspect_group=" + $('#groupList').val();
        url = url + "&inspect_group_list=" + $('#insSelectList').val();

        location.href = url;
        console.log(url);
        });
    </script> -->
</body>

<%@ include file="footer.jsp" %>
</html>
