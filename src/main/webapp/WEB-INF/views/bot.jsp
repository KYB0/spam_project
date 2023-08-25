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
    <button type="button" class="btn_bot" onclick="showChatbot()">
        <img src="/spam/img/botbot.png" alt="챗봇 아이콘" class="chatbot-icon">
    </button>
    
<!-- 모달 창 -->
<div id="chatbotModal" class="modal" onclick="closeModal()">
    <div class="modal-content" onclick="stopPropagation(event)">
        <span class="close" onclick="closeChatbot()">&times;</span>
        <button class="chat-button" onclick="sendMessage('로그인 관련')">로그인 관련</button>
        <button class="chat-button" onclick="sendMessage('리뷰 남기기')">리뷰 남기기</button>
        <button class="chat-button" onclick="sendMessage('비품 관련')">비품 관련</button>
    </div>
</div>

     
    </body>
    </html> 


    <%@ include file="footer.jsp" %>
</body>
</html>