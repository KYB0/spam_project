<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서실 상세 보기</title>
<link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
<script src="/js/jquery-3.7.0.min.js"></script>

<style>
    .t_content {
	display: block;
	float: left;
	height: 30px;
	font-size: 16px;
	line-height: 1.6;
	text-align: center;
	background-color: #322A31;
	border: 1px solid black;
    color: #DCE682;
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
	background-color: white;
	border: 1px solid black;
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
	border: 1px solid #322A31;
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
	color: black;
}

.btn-area {
	margin: 0px auto;
	width: 300px;
	text-align: center;
}

.wr-btn {
	display: block;
	width: 80%;
	padding: 10px 16px;
	font-size: 16px;
	line-height: 1.5;
	border-radius: 6px;
	color: #fff;
	background-color: black;
	border-color: black;
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

.footer-bar {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: white;
	color: #fff;
	min-height: 58px;
	line-height: 58px;
	padding: 0px;
}

.footer-logo {
	width: 30px;
	border-radius: 5px;
}

.fcontents {
	text-align: center;
	padding: 0px;
}

.footer-logo, .footer-txt {
	margin: 0px auto;
	vertical-align: middle;
}

.ta {
	margin-top: 5px;
	margin-bottom: 5px;
	resize: none;
}

.write-form {
	max-width: 600px;
	padding: 15px;
	margin: 0px auto;
}

.write-form .write-input {
	position: relative;
	height: auto;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
	display: block;
	width: 100%;
	line-height: 1.5;
	color: black;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.btn-write {
	width: 50px;
	padding: 15px 15px;
	font-size: 14px;
	line-height: 1.5;
	border-radius: 10px;
	color: #DCE682;
	background-color: #322A31;
	border-color: #322A31;
	margin-top: 10px;
}

.btn-write[type="reset"], .btn-write[type="button"] {
	background-color: #322A31;
	border-color: #322A31;
}

.btn-sub {
	width: 50px;
	padding: 15px 15px;
	font-size: 14px;
	line-height: 1.5;
	border-radius: 10px;
	color: #DCE682;
	background-color: #322A31;
	border-color: #322A31;
	margin-top: 10px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: white;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-radius: 5px;
	width: 20%;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	width: 79%;
	height: 35px;
	font-size: 16px;
	padding: 0 10px;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-radius: 5px;
}

.rtbl-head {
	background-color: #322A31;
    color: #DCE682;
	text-align: center;
	height: 30px;
}

/*
 * Responsive css
 */
@media only screen and (max-width: 768px) {
	.content {
		max-width: 100%;
	}
	.board-form, .write-form {
		max-width: 360px;
		padding: 0px;
	}
	.title-row .t-date, .title-row .t-view, .data-row .t-date, .data-row .t-view
		{
		display: none;
	}
	.p-10 {
		width: 20%;
	}
	.p-15 {
		width: 25%;
	}
	.p-30 {
		width: 55%;
	}
	.p-85 {
		width: 75%;
	}
	.dp-30, .dp-20, .dp-15, .dp-10 {
		width: 75%;
	}
	.filebox label {
		text-align: center;
		width: 100%;
	}
	.filebox .upload-name {
		width: 100%;
	}
	.top-home {
		display: none;
	}
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"
	integrity="sha512-Gn0tSSjkIGAkaZQWjx3Ctl/0dVJuTmjW/f9QyB302kFjU4uTNP4HtA32U2qXs/TRlEsK5CoEqMEMs7LnzLOBsA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script>
	let m = "${msg}";
	if (m != "") {
		alert(m);
	}
	$(function() {
		$('#summernote').summernote({
			height : 300, 
			minHeight : null, 
			maxHeight : null, 
			focus : true, 
			lang : "ko-KR", 
			placeholder : '최대 2048자까지 쓸 수 있습니다'
		});
	
		$('#summernote').summernote('disable');
		
		
		let loginName = "${mb.m_name}";
		$("#m_name").html(loginName + "님");
		$(".suc").css("display", "block");
		$(".bef").css("display", "none");

		
	});
</script>
</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<section>
			<div class="content">
				<div class="write-form">
					<div class="user-info">
						<div class="t_content p-15">번호</div>
						<div class="d_content p-85">${board.b_num}</div>
					</div>
					<div>
						<div class="t_content p-15">작성자</div>
						<div class="d_content p-35">${board.m_name}</div>
						<div class="t_content p-15">작성일</div>
						<div class="d_content p-35">
							<fmt:formatDate value="${board.b_date}"
								pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
						</div>
					</div>
					<div>
						<div class="t_content p-15">독서실</div>
						<div class="d_content p-85">${board.b_title}</div>
					</div>
					<div>
						<div class="t_content p-15 content_h">내용</div>
<%-- 						<div class="d_content p-85 content_h">${board.b_contents}</div> --%>
						<textarea id="summernote" class="d_content p-85 content_h" readonly >${board.b_contents}</textarea>	
					</div>
					
					<div>
						<div class="t_content p-15 file_h">첨부파일</div>
						<div class="d_content p-85 file_h" style="overflow: auto;">
							<c:if test="${empty fList}">
                            첨부된 파일이 없습니다.
                        	</c:if>
							<c:if test="${!empty fList}">
								<c:forEach var="fitem" items="${fList}">
									<a href="/board/download?bf_sysname=${fitem.bf_sysname}
									        &bf_oriname=${fitem.bf_oriname}">
										<span class="file-title"> <i class="fa fa-file-o"
											style="font-size: 24px"></i> ${fitem.bf_oriname}
									</span>
									</a>
								</c:forEach>
							</c:if>
						</div>
					</div>

					

					<div class="btn-area">
						<button class="btn-write" id="upbtn"
							onclick="upload_board('${board.b_num}')">업</button>
						<button class="btn-write" id="delbtn"
							onclick="delete_board('${board.b_num}')">딜</button>
						<button class="btn-sub" onclick="backbtn()">백</button>
					</div>
					
					<form id="rform">
						
						<input type="hidden" name="r_bnum" id="r_bnum"
							value="${board.b_num}">
						<textarea name="r_contents" rows="3" class="write-input ta"
							id="r_contents" placeholder="댓글"></textarea>
						<input type="hidden" name="r_id" id="r_id" value="${mb.m_id}">
						<input type="button" value="작성" class="btn-write"
							onclick="replyInsert()" style="width: 100%; margin-bottom: 30px;">
					</form>
					<table style="width: 100%">
					
						<tr class="rtbl-head">
							<td class="p-20">닉네임</td>
							<td class="p-50">댓글</td>
							<td class="p-30">작성일</td>
						</tr>
					</table>

					<table style="width: 100%;" id="rtable">
						<c:forEach var="ritem" items="${rList}">
							<tr>
								<td class="p-20">${ritem.r_id}</td>
								<td class="p-50">${ritem.r_contents}</td>
								
								<td class="p-30"><fmt:parseDate value="${ritem.r_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
								<fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${parsedDateTime}" /></td>
								
<%-- 								<td class="p-30"> <fmt:formatDate value=" ${ritem.r_date}" --%>
<%-- 										pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td> --%>
								
<%-- 								<td class="p-30">${ritem.r_date}</td> --%>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</section>
		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>

	<template id="tr_template">
		<tr>
			<td class="p-20">{b_id}</td>
			<td class="p-50">{b_contents}</td>
			<td class="p-30">{b_date}</td>
		</tr>
	</template>
	<script>
		$('#upbtn').hide();
		$('#delbtn').hide();
		let mid = '${mb.m_id}';
		let bid = '${board.b_id}';
		console.log(mid, bid);
		if (mid == bid) {
			$('#upbtn').show();
			$('#delbtn').show();
		}
		function delete_board(bnum) {
			let conf = confirm("정말 삭제하겠습니까?");
			if (conf == true) {
				location.href = '/board/delete?b_num=' + bnum;
			}
		}
		function upload_board(bnum) {
			location.href = '/board/update?b_num=' + bnum;
		}

		function replyInsert() {
			let obj = $('#rform').serializeObject();
			console.log('obj:', obj);
			$.ajax({
				method : 'post', 
				url : '/board/reply2', 
	
	
			}).done(
					function(res) {
						console.log("res:", res); 

						if (res != null && res != '') {
							let reply = '';
							reply += '<tr><td class="p-20">' + res.r_id
									+ '</td>' + '<td class="p-50">'
									+ res.r_contents + '</td>'
									+ '<td class="p-30">' + res.r_date
									+ '</td></tr>'

							$('#rtable').prepend(reply);
							$('#r_contents').val('').focus();
						}

					}).fail(function(res) {
				console.log("err:", res);
			}); //ajax
		}//replyInsert
		const backbtn = function() {
			let url = "/board/list?";
			let col = '${sessionScope.sDto.colname}';
			let keyw = '${sDto.keyword}';

			if (col == null) {
				url += 'pageNum=${sessionScope.pageNum}';
			} else {
				url += 'colname=${sDto.colname}' + '&keyword=${sDto.keyword}'
						+ '&pageNum=${pageNum}'
			}
			location.href = url;
		}
	</script>
</body>
</html>