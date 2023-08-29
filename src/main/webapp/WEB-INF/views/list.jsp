<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서실 목록</title>
<link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
<script src="/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/style.css">

<style>
    .board-form {
	max-width: 600px;
	padding: 15px;
	margin: 0 auto;
}

.user-info-sub {
	float: right;
	padding: 10px;
	background-color: #fff;
	border-radius: 5px;
}

.user-info-sub p {
	display: inline;
	margin-left: 5px;
	margin-right: 5px;
}

.user-info:before, .user-info:after, .board-title:before, .board-title:after,
	.title-row:before, .title-row:after, .data-row:before, .data-row:after
	{
	display: table;
	content: " ";
}

.user-info:after, .board-title:after, .title-row:after, .data-row:after
	{
	clear: both;
}

.title-row>div {
	display: block;
	float: left;
	height: 30px;
	font-size: 16px;
	line-height: 1.6;
	text-align: center;
	background-color: #fff;
	border: 1px solid #ccc;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

/*
	board content style
*/
.t_content {
	display: block;
	float: left;
	height: 30px;
	font-size: 16px;
	line-height: 1.6;
	text-align: center;
	background-color: pink;
	border: 1px solid #ccc;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.d_content {
	display: block;
	float: left;
	height: 30px;
	font-size: 16px;
	line-height: 1.6;
	text-align: center;
	background-color: #e7e7e7;
	border: 1px solid #ccc;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.content_h {
	height: 400px;
	line-height: 400px;
}

.content_in {
	overflow: auto;
	line-height: 1.6;
	text-align: left;
	box-sizing: border-box;
	height: 168px;
}

.content_tag {
	line-height: 1.6;
	text-align: left;
	height: 30px;
	box-sizing: border-box;
	margin-left: 5px;
}

.content_tag>a {
	text-decoration: none;
}
.content_tag>a:link {
	color: black;
}
.content_tag>a:visited {
	color: black;
}

.file_h {
	height: 60px;
	line-height: 55px;
	box-sizing: border-box;
}

.con_table {
	width: 100%;
}
/************************/
.data-row>div {
	display: block;
	float: left;
	height: 40px;
	font-size: 14px;
	line-height: 2.5;
	text-align: center;
	background-color: #e7e7e7;
	border: 1px solid #bfbfbf;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	overflow: hidden;
	padding: 2px;
}

.data-area {
	margin-bottom: 10px;
}

.btn-area .paging {
	width: 100%;
	margin: 0px auto;
	opacity: 0.8;
	text-align: center;
}

.paging .pno {
	background-color: #efefef;
	margin: 2px;
	border: 1px solid #6c6c6c;
	border-radius: 3px;
	line-height: 1.5;
	font-size: 15px;
	height: 20px;
}

.paging>a {
	text-decoration: none;
}

.paging>a:visited {
	color: #575757;
}

.btn-area {
	margin: 0px auto;
	width: 300px;
	text-align: center;
}

span.file-title {
	height: 40px;
	line-height: 40px;
	float: left;
	padding: 0 5px;
	margin-left: 5px;
	margin-bottom: 5px;
	background-color: #fff;
	border-radius: 5px;
	border: 1px solid gray;
}

.wr-btn {
	display: block;
	width: 80%;
	padding: 10px 16px;
	font-size: 16px;
	line-height: 1.5;
	border-radius: 6px;
	color: #DCE682;
	background-color: #322A31;
	border-color: #322A31;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
}

.p-10 {
	width: 10%;
}
.p-15 {
	width: 15%;
}
.p-20 {
	width: 20%;
}
.p-30 {
	width: 30%;
}
.p-35 {
	width: 35%;
}
.p-50 {
	width: 50%;
}
.p-85 {
	width: 85%;
}

.dp-10 {
	width: 10%;
}
.dp-15 {
	width: 15%;
}
.dp-20 {
	width: 20%;
}
.dp-30 {
	width: 30%;
}

.wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 58px; 
}
</style>

<script>
//로그인 실패 메세지
	let m='${msg}';
	if(m!=''){
		alert(m)
	}
$(()=>{
	let loginName='${mb.m_name}';
	$('#m_name').html(loginName+' 님');
	$('.suc').css('display','block');
	$('.bef').css('display','none');
		
}) //ready



</script>
</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>

		<section>
			<div class="content">
				<div class="board-form">
					<div class="user-info">
					</div>
					<h2 class="login-header">독서실 목록</h2>
					<div class="search-area">
						<select id="sel">
							<option value="b_title" selected>지역</option>
							<option value="b_contents">이름</option>
						</select> <input type="text" id="keyword">
						<button id="search">검색</button>
					</div>
					<div class="data-area">
						<div class="title-row">
							<div class="t-no p-10">번호</div>
							<div class="t-title p-30">제목</div>
							<div class="t-name p-15">작성자</div>
							<div class="t-date p-30">작성일</div>
						</div>
						<div class="data-row">
							<c:if test="${empty bList}">
								<div style="width: 100%">게시글이 없습니다.</div>
							</c:if>
							<c:if test="${!empty bList}">
								<c:forEach var="bitem" items="${bList}">
									<div class="t-no p-10">${bitem.b_num}</div>
									<div class="t-title p-30">
										<a href="/board/detail?b_num=${bitem.b_num}">${bitem.b_title}</a>
									</div>
									<div class="t-name p-15">${bitem.m_name}</div>
									<div class="t-date p-30">
										<fmt:formatDate value="${bitem.b_date}"
											pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
									</div>
									<div class="t-view p-15">${bitem.b_views}</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="btn-area">
						<div class="paging">${paging}</div>
						<button class="wr-btn" onclick="location.href='/board/write'">
							등록</button>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
	<!-- wrap -->
	<script>
		//검색기능
		$('#search').click(function(){
			let keyword = $('#keyword').val();
			if(keyword==''){
				alert('검색어를 입력하세요');
				return;
			}
			let select = $('#sel').val(); //b_title or b_contents
			console.log(keyword, select);
			location.href='/board/list?colname='+select+'&keyword='+keyword
					      +"&pageNum=1";
			//localhost/board/list?colname=b_title&keyword=33&pageNum=1
			
		}); //click end
	</script>
	
</body>
</html>