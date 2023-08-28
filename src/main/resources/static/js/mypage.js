document.addEventListener('DOMContentLoaded', function() {
    const updateButton = document.getElementById('updateButton');

    updateButton.addEventListener('click', async function() {
        const name = document.getElementById('name').value;
        const id = document.getElementById('id').value;
        const pwd = document.getElementById('pwd').value;
        const pwc = document.getElementById('pwc').value;
        const pNum = document.getElementById('pNum').value;
        const email = document.getElementById('email').value;
        // 나머지 필드들도 동일한 방식으로 가져옴

        const userData = {
            name: name,
            id: id,
            pw: pwd,
            pwc: pwc,
            pNum: pNum,
            email: email
            // 나머지 필드들도 동일하게 추가
        };

        try {
            const response = await fetch('/update-user', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(userData),
            });

            if (response.ok) {                                                                                                                                                               
                alert('정보가 성공적으로 업데이트되었습니다.');
            } else {
                alert('정보 업데이트 중 오류가 발생했습니다.');
            }
        } catch (error) {
            console.error('오류 발생:', error);
        }
    });
});
