<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CJ Hotel</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/assets/img/favicon.png" rel="icon">
  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-center align-items-center">
    <div class="container text-center text-md-left" data-aos="fade-up">
      <h1>Welcome to <span>CJ Hotel</span></h1>
      <c:choose>
     	 <c:when test="${!empty uvo}">
     	 	<a href="reservation" class="btn-get-started scrollto">예약 하기</a>
     	 </c:when>
     	 <c:otherwise>
     	 	<a href="login" class="btn-get-started scrollto">로그인 하러가기</a>
     	 </c:otherwise>
      </c:choose>
 
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= What We Do Section ======= -->
    <section id="what-we-do" class="what-we-do">
      <div class="container">
      
        <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center">


                <div class="swiper-slide">
                  <img src="resources/assets/img/portfolio/hotel2.jpg" alt="">
                </div>

              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>객실</h3>
              <ul>
                <li>초고층 타워의 전 객실에서 부산의 환상적인 경관을 파라노믹뷰로 조망할 수 있습니다</li>
                <li><strong>여유로운</strong> 면적의 최고급 객실</li>
                <li><strong>세련미와 편안함</strong>이 어우러진 격조 높은 인테리어</li>
                <li><strong>최상의 평온함</strong>을 위한 Super-premium Bedding System</li>
              </ul>
            </div>
            <div class="portfolio-description">
              <h2>호텔 소개</h2>
              <p>
               내 최고층 건물인 CJ호텔에 위치한 CJ Hotel은 한국의 아름다움을 현대적인 감각으로 풀어낸 객실(1실)에서
			  부산의 파노라믹한 스카이라인과 환상적인 야경을 조망할 수 있으며 일몰과 일출을 한 자리에서 감상할 수 있는 국내 유일의 호텔입니다.
				<br/>			
				[ Live beyond expectations. ]
				CJ Hotel은 ‘럭셔리를 넘어, 서비스를 넘어, 기대를 넘어, 상상하는 모든 것 그 이상의 가치를 제공’합니다.
              </p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Details Section -->

        <div class="section-title">
          <h2>찾아오는길</h2>
        </div>

        <div class="row mt-5 justify-content-center">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13047.09009664771!2d128.9742399345882!3d35.16229348509481!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568c1d965baeefd%3A0xbc4ee1dc075f729b!2z67aA7IKw6rSR7Jet7IucIOyCrOyDgeq1rCDqtJHsnqXroZw!5e0!3m2!1sko!2skr!4v1646806514988!5m2!1sko!2skr"
		 width="600" height="450" style="border:0; margin-bottom:20;"></iframe>
          <div class="col-lg-10">

            <div class="info-wrap">
              <div class="row">
                <div class="col-lg-4 info">
                  <i class="bi bi-geo-alt"></i>
                  <h4>위치</h4>
                  <p>부산광역시 사상구 광장로</p>
                </div>

                <div class="col-lg-4 info mt-4 mt-lg-0">
                  <i class="bi bi-envelope"></i>
                  <h4>관리자 이메일</h4>
                  <p>jcj145@naver.com</p>
                </div>

                <div class="col-lg-4 info mt-4 mt-lg-0">
                  <i class="bi bi-phone"></i>
                  <h4>관리자 번호</h4>
                  <p>010-6262-4318</p>
                </div>
              </div>
            </div>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->
  </main><!-- End #main -->
  
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/purecounter/purecounter.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>

</body>

</html>