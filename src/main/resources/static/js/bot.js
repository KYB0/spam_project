function showChatbot() {
    const modal = document.getElementById("chatbotModal");
    modal.style.display = "block";
}

function closeModal() {
    const modal = document.getElementById("chatbotModal");
    modal.style.display = "none";
}

function stopPropagation(event) {
    event.stopPropagation();
}

function sendMessage(message) {
    const modal = document.getElementById("chatbotModal");
    // ... 메시지 전송 및 응답 처리 등의 로직
    // 백엔드와 통신하여 응답을 받아온다고 가정하면, 응답 내용을 모달 안에 추가할 수 있습니다.
    const responseMessage = document.createElement('div');
    responseMessage.className = 'chat-message bot';
    responseMessage.textContent = message;

    const modalContent = modal.querySelector('.modal-content');
    modalContent.appendChild(responseMessage);

    closeChatbot(); // 선택 후 모달 닫기
}
