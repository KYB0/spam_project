<%@ include file="footer.jsp" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
	<link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
	<script src="/js/jquery-3.7.0.min.js"></script>
	<link rel="stylesheet" href="/css/style.css">
<style>
.modal{
	opacity : 0;
	
	position: fixed;
	top: 0px; left: 0;
	width: 100%; height: 100%;
	
	max-width : 100%;
	max-height : 100%;

	display: flex;
	justify-content: center;
	align-items : center;
	
	transition : opacity 0.5s;
}
.modal.opaque{
	opacity : 1;
	transition : opacity 0.5s;
}
.modal.unstaged {
	top:-100px;
	height : 0;
}

.modal-overlay{
	position : absolute;
	
	width : 100%;
	height : 100%;
	background-color : RGBA(0, 0, 0, 0.6);
}

.modal-contents{
	display:flex;
	flex-direction : column;
	align-items : center;
	position: relative;
	
	padding: 60px 80px;
	width: auto;
	max-width : 80%;
	max-height : 80%;

	text-align: center;
	background-color: rgb(255,255,255);
	border-radius: 6px;
}

.modal-text{
	text-align:left;
	overflow: auto;
}

.modal-close{
	margin-top : 50px;
	padding : 5px 40px;
	
	color : #FFFFFF;
	font-weight : bolder;
	font-size : 20px;
	background-color : #ffaa00;
	border-radius : 7px;
	cursor : pointer;
	
	transition : all 0.5s;
}
.modal-close:hover{
	background-color : #ffd500;
}
.myButton {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background-color:transparent;
	border:1px solid #ffffff;
	display:inline-block;
	cursor:pointer;
	color:#030303;
	font-family:Courier New;
	font-size:14px;
	font-weight:bold;
	padding:6px 12px;
	text-decoration:none;
}
.myButton:hover {
	background-color:transparent;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>
</head>

<body>
  <a id="modal-open">비품 선택</a>	

  <div id="modal-container" class="modal unstaged">
    <div class="modal-overlay">
    </div>
    <div class="modal-contents">
        <div class="modal-text">
        <h2>비품을 선택해 주세요</h2><br>
      </div>
      <h4>독서대<input type="checkbox" id="checkbox"></h4><br>
      <h4>충전기<input type="checkbox" id="checkbox"></h4><br>
      <h4>담요<input type="checkbox" id="checkbox"></h4><br>
      <h4>간식<input type="checkbox" id="checkbox"></h4><br>
	  <a href="#" class="myButton">건너뛰기</a>
      <a id="modal-close" class="modal-close">완료</a>		
    </div>
  </div>
 
<script>
	//javascript

	  //open modal
	  document.getElementById('modal-open').addEventListener("click", function(e){
	    document.getElementById('modal-container').classList.toggle('opaque');
	      document.getElementById('modal-container').classList.toggle('unstaged');
        });
      
	  //close modal
	  document.getElementById('modal-close').addEventListener("click", function(e){
	    document.getElementById('modal-container').classList.toggle('opaque');

	    document.getElementById('modal-container').addEventListener('transitionend', function(e){
	      this.classList.toggle('unstaged');
	      this.removeEventListener('transitionend',arguments.callee);
	      });
	    });
</script>


</body>
</html>