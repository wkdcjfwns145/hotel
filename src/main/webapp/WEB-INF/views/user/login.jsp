<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/join.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
 <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>로그인 페이지</h2>
          <ol>
            <li><a href="main">Home</a></li>
            <li>로그인</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	<hr/>
    <section class="inner-page">
      <div class="container">
        <div class="wrapper">
		    <form class="joinForm" action="main" method="post">       
		      <h3>로그인</h3>
		      <div class="textForm">
		      	<input type="email" class="id" name="email" placeholder="이메일" required/>
		      </div>
		      <div class="textForm">
		      	<input type="password" class="pw" name="pw" placeholder="비밀번호" required/>  
		      </div>    
		      <button class="btn" type="submit">로그인</button>  
		      <button class="btn" onclick="location.href='join'" type="button">회원가입</button>   
		    </form>
	  </div>
      </div>
    </section>
	<hr/>
  </main><!-- End #main -->
  	<script>
		var msg = "${msg}";
		if(msg != null && msg != ''){
			alert(msg);
		} 
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
