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
    const modalContent = modal.querySelector('.modal-content');

    if (message === '회원가입') {
        const responseMessage = document.createElement('div');
        responseMessage.className = 'chat-message bot';
        responseMessage.textContent = '회원가입을 원하시면 아래 링크를 클릭해주세요.';
        
        const link = document.createElement('a');
        link.href = '/your-registration-page'; // 여기에 실제 링크 주소를 넣어주세요
        link.textContent = '회원가입 페이지로 이동하기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
    } else if (message === '로그인 창') {
        // 로그인 창 관련 메시지와 링크 추가 처리
    } else if (message === '아이디 찾기') {
        // 아이디 찾기 관련 메시지와 링크 추가 처리
    } else {
        // 기타 메시지 처리
    }

    closeChatbot(); 

}

function showOptions(options) {
    const modalContent = document.querySelector('.modal-content');
    modalContent.innerHTML = ''; // 기존 내용 초기화
        
    for (const option of options) {
        const optionButton = document.createElement('button');
        optionButton.className = 'chat-button';
        optionButton.textContent = option;
        optionButton.onclick = () => sendMessage(option);
        modalContent.appendChild(optionButton);
    }
}

// function sendMessage(message) {
//     const modal = document.getElementById("chatbotModal");
//     // ... 메시지 전송 및 응답 처리 등의 로직
//     // 백엔드와 통신하여 응답을 받아온다고 가정하면, 응답 내용을 모달 안에 추가할 수 있습니다.
//     const responseMessage = document.createElement('div');
//     responseMessage.className = 'chat-message bot';
//     responseMessage.textContent = message;

//     const modalContent = modal.querySelector('.modal-content');
//     modalContent.appendChild(responseMessage);

//     closeChatbot(); // 선택 후 모달 닫기
// }
