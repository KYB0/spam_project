﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM : 기업:등록 및 수정</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .c_insert {
            position: relative;
            /* 상대 위치 지정 */
            left: 20%;
            top: 20%;
            transform: translate(-20%, -20%);
            /* 화면 중앙 정렬을 위한 transform 사용 */
        }

        .c_insert h1 {
            position: fixed;
            /* 고정 위치 지정 */
            left: 20%;
            /* 왼쪽에서 20% */
            top: -100%;
            /* 위에서 20% */
            transform: translate(-20%, 100%);
            /* 화면 중앙 정렬을 위한 transform 사용 */
        }

        .std-button {
            /* 스타일을 원하는 대로 설정 */
            padding: 10px 20px;
            background-color: #E6E6FA;
            color: #B19CD9;
            border: none;
            cursor: pointer;
            width: 120px;
            max-width: 200px;
            height: 50px;
            border-radius: 30px;
            /* 모서리 둥글게 설정 */
            position: relative;
            left: 75%;
            margin-top: 5%;
        }

        .c_menu {
            display: flex;
            /* Flexbox 사용 */
            flex-direction: column;
            /* 세로로 정렬 */
            align-items: center;
            /* 가운데 정렬 */
            position: absolute;
            left: 5%;
            /* 왼쪽에서 10% 여백 */
            top: 30%;
            /* 위에서 20% 여백 */
        }

        .btn_cmenu {
            display: flex;
            flex-direction: column;
            /* 세로로 정렬 */
            gap: 10px;
            /* 버튼 사이의 간격 조절 */
            width: 100%;
        }

        .btn_cmenu button {
            /* 버튼 스타일 */
            padding: 10px 20px;
            background-color: #322A31;
            color: #DCE682;
            border: none;
            cursor: pointer;
            width: 120px;
            /* 버튼 상자 너비 설정 */
            max-width: 200px;
            /* 최대 가로 너비 설정 (원하는 크기로 조정 가능) */
            height: 50px;
            /* 버튼 상자 높이 설정 */
        }

        .container {
            margin-top: 10%;
            /* 또는 padding-top: 20px; */

        }

        .panel {
            background: linear-gradient(to right, #E6E6FA, #B19CD9);
            padding: 0;
            border-radius: 10px;
            border: none;
            box-shadow: 0 0 0 5px rgba(0, 0, 0, 0.05), 0 0 0 10px rgba(0, 0, 0, 0.05);
        }

        .panel .panel-heading {
            padding: 20px 15px;
            border-radius: 10px 10px 0 0;
            margin: 0;
        }

        .panel .panel-heading .title {
            color: #fff;
            font-size: 28px;
            font-weight: 500;
            text-transform: capitalize;
            line-height: 40px;
            margin: 0;
        }

        .panel .panel-heading .btn {
            color: rgba(255, 255, 255, 0.5);
            background: transparent;
            font-size: 16px;
            text-transform: capitalize;
            border: 2px solid #fff;
            border-radius: 50px;
            transition: all 0.3s ease 0s;
        }

        .panel .panel-heading .btn:hover {
            color: #fff;
            text-shadow: 3px 3px rgba(255, 255, 255, 0.2);
        }

        .panel .panel-heading .form-control {
            color: #fff;
            background-color: transparent;
            width: 35%;
            height: 40px;
            border: 2px solid #fff;
            border-radius: 20px;
            display: inline-block;
            transition: all 0.3s ease 0s;
        }

        .panel .panel-heading .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            box-shadow: none;
            outline: none;
        }

        .panel .panel-heading .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
            font-size: 15px;
            font-weight: 500;
        }

        .panel .panel-body {
            padding: 0;
        }

        .panel .panel-body .table thead tr th {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.2);
            font-size: 16px;
            font-weight: 500;
            text-transform: uppercase;
            padding: 12px;
            border: none;
        }

        .panel .panel-body .table tbody tr td {
            color: #fff;
            font-size: 15px;
            padding: 10px 12px;
            vertical-align: middle;
            border: none;
        }

        .panel .panel-body .table tbody tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        .panel .panel-body .table tbody .action-list {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .panel .panel-body .table tbody .action-list li {
            display: inline-block;
            margin: 0 5px;
        }

        .panel .panel-body .table tbody .action-list li a {
            color: #fff;
            font-size: 15px;
            position: relative;
            z-index: 1;
            transition: all 0.3s ease 0s;
        }

        .panel .panel-body .table tbody .action-list li a:hover {
            text-shadow: 3px 3px 0 rgba(255, 255, 255, 0.3);
        }

        .panel .panel-body .table tbody .action-list li a:before,
        .panel .panel-body .table tbody .action-list li a:after {
            content: attr(data-tip);
            color: #fff;
            background-color: #111;
            font-size: 12px;
            padding: 5px 7px;
            border-radius: 4px;
            text-transform: capitalize;
            display: none;
            transform: translateX(-50%);
            position: absolute;
            left: 50%;
            top: -32px;
            transition: all 0.3s ease 0s;
        }

        .panel .panel-body .table tbody .action-list li a:after {
            content: '';
            height: 15px;
            width: 15px;
            padding: 0;
            border-radius: 0;
            transform: translateX(-50%) rotate(45deg);
            top: -18px;
            z-index: -1;
        }

        .panel .panel-body .table tbody .action-list li a:hover:before,
        .panel .panel-body .table tbody .action-list li a:hover:after {
            display: block;
        }

        .panel .panel-footer {
            color: #fff;
            background-color: transparent;
            padding: 15px;
            border: none;
        }

        .panel .panel-footer .col {
            line-height: 35px;
        }

        .panel-footer ul.pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left:120%; /* 오른쪽으로 20% 이동 */
    }

    .panel-footer ul.pagination li {
        display: inline-block;
        margin: 0 5px; /* 각 li 요소 사이의 간격 조절 */
    }

        .pagination {
            margin: 0;
        }

        .pagination li a {
            color: #fff;
            background-color: transparent;
            border: 2px solid transparent;
            font-size: 18px;
            font-weight: 500;
            text-align: center;
            line-height: 31px;
            width: 35px;
            height: 35px;
            padding: 0;
            margin: 0 3px;
            border-radius: 50px;
            transition: all 0.3s ease 0s;
        }

        .pagination li a:hover {
            color: #fff;
            background-color: transparent;
            border-color: rgba(255, 255, 255, 0.2);
        }

        .pagination li a:focus,
        .pagination li.active a,
        .pagination li.active a:hover {
            color: #fff;
            background-color: transparent;
            border-color: #fff;
        }

        .pagination li:first-child a,
        .pagination li:last-child a {
            border-radius: 50%;
        }

        @media only screen and (max-width:767px) {
            .panel .panel-heading .title {
                text-align: center;
                margin: 0 0 10px;
            }

            .panel .panel-heading .btn_group {
                text-align: center;
            }
        }
    </style>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="js/code.jquery.com_jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>
<body>
    <%@ include file="header.jsp" %>
    <% int size = 5; %>
    <section class=" c_insert">
    <h1>등록 및 수정</h1>
    </section>
    <div class="container" style="margin-left: 30%;">
        <div class="row">
            <div class="col-md-offset-1 col-md-10">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col col-sm-3 col-xs-12">
                                <h4 class="title">독서실 <span>목록</span></h4>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table" id="roomTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>독서실명</th>
                                    <th>영업 시간</th>
                                    <th>시간별 가격</th>
                                    <th>일별 가격</th>
                                    <th>지역</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${roomDataList}" var="room">
                                    <tr>
                                        <td>${room.room_id}</td>
                                        <td>${room.room_name}</td>
                                        <td>${room.room_description}</td>
                                        <td>${room.time_price}</td>
                                        <td>${room.day_price}</td>
                                        <td>${room.region}</td>
                                        <td>
                                            <ul class="action-list">
                                                <li><a href="/spam/c_mypage/seatInsert?room_id=${room.room_id}" data-tip="좌석 등록"><i class="fa fa-chair"></i></a></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-sm-6 col-xs-6">
                                <ul class="pagination hidden-xs pull-right" id="PageNavigation">
                                    <c:if test="${currentPage > 1}">
                                            <li>
                                                <a href="/spam/c_mypage/insert?page=${currentPage - 1}&size=${size}">&laquo; </a>
                                            </li>
                                    </c:if>
                                    <c:forEach begin="1" end="${totalPages}" var="page">
                                                <li class="<c:if test="${currentPage eq page}">active</c:if>">
                                                    <a href="/spam/c_mypage/insert?page=${page}&size=${size}">${page}</a>
                                                </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages}">
                                                <li>
                                                    <a href="/spam/c_mypage/insert?page=${currentPage + 1}&size=${size}">&raquo;</a>
                                                </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="std-insert">
        <a href="/spam/c_mypage/insert/write"><button class="std-button">등록</button></a>
    </section>
    <section class="c_menu">
        <div class="btn_cmenu">
            <a href="/spam/c_mypage"><button id="cmyp">마이페이지</button></a>
            <a href="/spam/c_mypage/list"><button id="clist">고객 수</button></a>
            <a href="/spam/c_mypage/insert"><button id="cinsert">등록 및 수정</button></a>
            <a href="/spam/c_mypage/resign"><button id="cresign">퇴점 신청</button></a>
        </div>
    </section>
    <%@ include file="footer.jsp" %>
    </body>
    <script>
        
  $(document).ready(function(){
    
    
    // 페이지 버튼 클릭 이벤트 핸들러
    $(document).on('click', '#PageNavigation a', function(e){
        e.preventDefault();
        const page = $(this).data('page');
        
        // AJAX 요청
        $.ajax({
            url: `/spam/c_mypage/insert?page=${page}&size=<%= size %>`,
            method: 'GET',
            success: function(data){
                // 성공 시 목록 갱신
                updateRoomList(data);
            },
            error: function(){
                console.error('데이터를 불러오는데 실패했습니다.');
            }
        });
    });
    
    // 목록 갱신 함수
    function updateRoomList(data) {
        const roomTable = $('#roomTable');
        const tbody = roomTable.find('tbody');
        
        tbody.empty();
        
        data.roomDataPage.forEach((room) => {
            const row = $('<tr>');
            row.html(`
                <td>${room.room_id}</td>
                <td>${room.room_name}</td>
                <td>${room.room_description}</td>
                <td>${room.time_price}</td>
                <td>${room.day_price}</td>
                <td>${room.region}</td>
                <td><a href="/spam/c_mypage/seatInsert?room_id=${room.room_id}" data-tip="좌석 등록"><i class="fa fa-chair"></i></a></td>
            `);
            
            tbody.append(row);
        });
        
        const pagination = $('#PageNavigation');
        pagination.empty();
        
        for (let i = 1; i <= data.totalPages; i++) {
            const li = $('<li>');
            li.addClass(data.currentPage === i ? 'active' : '');
            li.html(`<a href="#" data-page="${i}">${i}</a>`);
            pagination.append(li);
        }
    }
});

    </script>

</html>