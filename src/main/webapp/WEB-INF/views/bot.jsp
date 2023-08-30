<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Button Chatbot</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/bot.js"></script>
    <link rel="stylesheet" href="/spam/css/bot.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <button type="button" style="border:0" class="btn_bot" onclick="showChatbot()">
        <img src="/spam/img/bot.png" alt="챗봇 아이콘" class="chatbot-icon">
    </button>
    
  <!-- 모달 창 -->
  <div id="chatbotModal" class="modal" onclick="closeModal()">
    <div class="modal-content" onclick="stopPropagation(event)">
        <span class="close" onclick="closeChatbot()">&times;</span>
        
        <button class="chat-button" onclick="showOptions(['회원가입', '로그인', '아이디찾기'])">로그인 관련</button>
        <button class="chat-button" onclick="showOptions(['리뷰는 어디에 남기나요?', '리뷰페이지', '내가 작성한 리뷰 페이지를 보고싶어요'])">리뷰 관련</button>
        <button class="chat-button" onclick="showOptions(['비품대여 방법을 알고싶어요', '내가 대여한 비품', '대여가능한 비품 종류'])">비품 관련</button>
        
    </div>

</div>
    
     
    </body>
    </html> 


    <%@ include file="footer.jsp" %>
</body>
</html>