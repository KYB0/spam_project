<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM</title>
    <style>

.rdetail {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

        .rdetail h1{
            position: fixed; /* 고정 위치 지정 */
            top: 20%; /* 위에서 */
        }

        .rimage{
            flex-direction: column;
            top:60%;
        }

        .stc-img-container {
    max-width: 500px; /* 최대 너비 설정 */
    width: 100%;
    height: auto;
}
    
    </style>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
<div class = "wrap">
    <section class = "rdetail"  style="display: flex; justify-content: center;">
        <h1>${room_name}</h1>
        <div  class="stc-img-container">
            <img src="image/stc_1.jpg" class="rimage"  style="width: 500px;">
        </div>
    </section>
</div>


    <%@ include file="footer.jsp" %>
</body>
</html>