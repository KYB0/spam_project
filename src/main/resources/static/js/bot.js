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

    if (message === '개인정보') {
        showOptions(['가입/탈퇴', '로그인', '정보변경', '민원처리신청']);
    } else if (message === '독서실') {
        showOptions(['예약상품 결제', '단체예약/장소대관', '비품대여']);
    } else if (message === '사업자 등록') {
        showOptions(['등록/입점', '퇴점신청', '탈퇴', '가격/정보변경']);
    } else if (message === '기타상담') {
        showOptions(['칭찬/불만사항 작성', '스팸/광고/제휴 문의']);
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
        optionButton.onclick = () => showSubOptions(option);
        modalContent.appendChild(optionButton);
    }
}

function showSubOptions(parentOption) {
    const modalContent = document.querySelector('.modal-content');
    modalContent.innerHTML = ''; // 기존 내용 초기화

    const subOptions = [];
    // 여기에 해당 parentOption 에 따른 하위 옵션을 추가 예정
    if (parentOption === '가입/탈퇴') {
        subOptions.push('회원 탈퇴는 어떻게 하나요?', '미성년자는 가입 못 하나요?', '회원가입 시 휴대폰 본인인증 오류가 발생됩니다');
    } else if (parentOption === '로그인') {
        subOptions.push('로그인 시 등록되지 않은 아이디라고 나옵니다.', '로그인이 안되는 경우는 어떻게 하나요?', '로그인 시 휴먼계정 안내가 됩니다');
    }
    // 나머지 parentOption 에 따른 하위 옵션 추가 예정
    showOptions(subOptions);


    modalContent.innerHTML = ''; // 기존 내용 초기화
    // 하위 옵션 버튼 생성 및 클릭 이벤트 할당
    for (const optionText of subOptions) {
        const optionButton = document.createElement('button');
        optionButton.className = 'chat-button';
        optionButton.textContent = optionText;
        optionButton.onclick = function() {
            handleOptionClick(optionText);
        };
        modalContent.appendChild(optionButton);
    }
}

// 1안 새로운 버튼 처리 코드 추가 
function handleOptionClick(option) {
    if (option === '회원 탈퇴는 어떻게 하나요?') {
        console.log(11111);
        const modalContent = document.querySelector('.modal-content');
        modalContent.innerHTML = ''; // 기존 내용 초기화

        const responseMessage = document.createElement('div');
        responseMessage.className = 'chat-message bot';
        responseMessage.textContent = '회원 탈퇴를 원하시면 아래 링크를 클릭해주세요.';

        const link = document.createElement('a');
        link.href = "/spam/member/withdrawal"; // 회원 탈퇴 페이지 링크
        link.textContent = '회원 탈퇴 페이지로 이동하기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
    }
}



