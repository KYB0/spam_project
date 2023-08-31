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
        subOptions.push('회원 탈퇴는 어떻게 하나요?', '미성년자(14세 미만)도 가입 가능한가요?', '회원가입 시 휴대폰 본인인증 오류가 발생됩니다.');
    } else if (parentOption === '로그인') {
        subOptions.push('로그인 시 등록되지 않은 아이디라고 나옵니다.', '로그인이 안되는 경우는 어떻게 하나요?', '로그인 시 휴먼계정 안내가 됩니다.');
    } else if (parentOption === '정보변경') {
        subOptions.push('회원 아이디, 비밀번호 변경', '휴대폰 번호, 이메일 주소 변경', '이름, 생년월일, 성별 변경', '개명 절차가 어떻게 되나요?');
    } else if (parentOption === '개인정보 민원처리신청') {
        subOptions.push('이용내역을 확인하려면 어떻게 하나요?', '예약내역을 삭제하고 싶습니다.', '작성한 게시글을 삭제하고 싶습니다.');
    
    }
    // 나머지 parentOption 에 따른 하위 옵션 추가 예정
    showOptions(subOptions);


// 추가 코드 //
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
// 추가 코드 //

// 1안 새로운 버튼 처리 코드 추가 
function handleOptionClick(option) {
    if (option === '회원 탈퇴는 어떻게 하나요?') {    // option 선택 if문으로 감싸기 !  추가 코드 //
        console.log(11111);
        const modalContent = document.querySelector('.modal-content');
        modalContent.innerHTML = ''; // 기존 내용 초기화

        const responseMessage = document.createElement('div');
        responseMessage.className = 'chat-message bot';
        responseMessage.textContent = '회원 탈퇴를 원하시면 아래 링크를 클릭해주세요.';

        const link = document.createElement('a');
        link.href = "/spam/member/withdrawal"; // 회원 탈퇴 페이지 링크
        link.textContent = '회원 탈퇴하기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);

    } else if (option === '미성년자(14세 미만)도 가입 가능한가요?') {    // option 선택 if문으로 감싸기 !  추가 코드 //
        console.log(2222);
        const modalContent = document.querySelector('.modal-content');
        modalContent.innerHTML = ''; // 기존 내용 초기화

        const responseMessage = document.createElement('div');
        responseMessage.className = 'chat-message bot';
        responseMessage.textContent = '미성년 회원의 이용이 가능합니다.\n회원가입을 원하시면 아래 링크를 클릭해주세요';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "/spam/member/withdrawal"; // 페이지 링크
        link.textContent = '회원가입으로 이동하기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);

    }else if (option === '회원가입 시 휴대폰 본인인증 오류가 발생됩니다.') {    // option 선택 if문으로 감싸기 !  추가 코드 //
        console.log(3333);
        const modalContent = document.querySelector('.modal-content');
        modalContent.innerHTML = ''; // 기존 내용 초기화

        const responseMessage = document.createElement('div');
        responseMessage.className = 'chat-message bot';
        responseMessage.textContent = '휴대폰 본인 인증으로 가입하시는 경우 본인 명의의 개통 정보로 가입하셔야 합니다. \n' +  
        '스팸 회원 가입 시 휴대폰 본인 인증 오류인 경우 농심신용평가정보㈜ 고객센터로 하시어 안내를 받으신 후 재가입 시도를 해주셔야 합니다. \n' +  
        '농심신용평가정보(주) 고객센터 :1588-8282';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "/spam/member/withdrawal"; // 페이지 링크
        link.textContent = '회원가입으로 이동하기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
    
    }else if (option === '로그인 시 등록되지 않은 아이디라고 나옵니다.') {    // option 선택 if문으로 감싸기 !  추가 코드 //
        console.log(4444);
        const modalContent = document.querySelector('.modal-content');
        modalContent.innerHTML = ''; // 기존 내용 초기화

        const responseMessage = document.createElement('div');
        responseMessage.className = 'chat-message bot';
        responseMessage.textContent = '스팸 회원 아이디는 이메일 주소 형식(예: spam@study.com)으로 대소문자를 구분합니다. \n ' +
        '첫 글자가 자동으로 대문자로 입력되지 않았는지 확인 부탁드립니다. \n ' + 
        '또한 아이디/비밀번호가 기억나지 않으실 경우 스팸 홈페이지에서 아이디/비밀번호 찾기를 통해 정확한 아이디 정보를 확인 후 로그인 해 주시기 바랍니다.';  
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "/spam/member/withdrawal"; // 페이지 링크
        link.textContent = '아이디 비밀번호 찾기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
    
    }else if (option === '로그인이 안되는 경우는 어떻게 하나요?') {    // option 선택 if문으로 감싸기 !  추가 코드 //
        console.log(4444);
        const modalContent = document.querySelector('.modal-content');
        modalContent.innerHTML = ''; // 기존 내용 초기화

        const responseMessage = document.createElement('div');
        responseMessage.className = 'chat-message bot';
        responseMessage.textContent = ' 아이디 또는 비밀번호를 다시 확인해 주세요. \n' +
        '스팸에 가입되지 않은 아이디이거나 아이디 또는 비밀번호를 잘못 입력하지 않았는지 확인해주세요 \n ' + 
        '스팸회원 아이디는 이메일 주소 형식(예: spam@study.com)을 대소문자를 구분하기 때문에 \n'+ 
        '아이디 첫 글자가 자동으로 대문자로 입력되지 않았는지 확인 부탁드리며, 아이디/비밀번호가 기억나지 않으실 경우 아래 링크를 통해 아이디/비밀번호 찾기를 이용해주시기 바랍니다';  
        responseMessage.style.whiteSpace = 'pre-line';
        
        const link = document.createElement('a');
        link.href = "/spam/member/withdrawal"; // 페이지 링크
        link.textContent = '아이디 비밀번호 찾기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
    
    }

}

