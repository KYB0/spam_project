<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>


  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  

  <link rel="stylesheet" href="/spam/css/slider.css">

  <script>
    $(document).ready(function() {
      let m = "${msg}";
      if (m !== '') {
        alert(m);
      }

      // bxSlider 설정용 스크립트
      $(".slider").bxSlider({
        mode: "horizontal", //가로 슬라이드 모드
        auto: true,
        slideWidth: 600,
      });
    });
  </script>

</head>

<body>
  <div class="wrap">
    <section>
      <div class="content-home">
        <div class="slider">
          <div><img src="img/main_image1.jpg" alt="Image 1"></div>
          <div><img src="img/main_image2.jpg" alt="Image 2"></div>
          <div><img src="img/main_image3.jpg" alt="Image 3"></div>
          <div><img src="img/main_image4.jpg" alt="Image 4"></div>
          <div><img src="img/main_image5.jpg" alt="Image 5"></div>
          <div><img src="img/main_image6.jpg" alt="Image 6"></div>
          <div><img src="img/main_image7.jpg" alt="Image 7"></div>
        </div>
      </div>
    </section>
  </div>
</body>

</html>