<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <div class="logo me-auto">
        <h1><a href="main">CJ Hotel</a></h1>
      </div>
		
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="main">홈</a></li>
          <c:set var="name" value="${uvo.name}"></c:set>
          <c:choose>
          	<c:when test="${!empty name && name ne '관리자'}">
          		<li><a class="nav-link scrollto" href="logout">로그아웃</a></li>
          		<li class="dropdown"><a><span>마이 페이지</span> <i class="bi bi-chevron-down"></i></a>
          		 <ul>
                  <li><a href="userinfo">개인 정보</a></li>
                  <li><a href="reservationinfo?name=${uvo.name}">예약관리</a></li>
                </ul>
              </li>
          	</c:when>
          	<c:when test="${name eq '관리자'}">
          		<li><a class="nav-link scrollto" href="logout">로그아웃</a></li>
          		<li class="dropdown"><a><span>관리자 페이지</span> <i class="bi bi-chevron-down"></i></a>
          		 <ul>
                  <li><a href="adminuser">회원목록</a></li>
                  <li><a href="adminreservation">회원예약관리</a></li>
                </ul>
          	</c:when>
          	<c:otherwise>
          		<li><a class="nav-link scrollto" href="login">로그인</a></li>
			</c:otherwise>
          </c:choose>
          <li><a class="nav-link scrollto" href="boardview">질문게시판</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <div class="header-social-links d-flex align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
      </div>

    </div>
  </header><!-- End Header -->
</body>
</html>