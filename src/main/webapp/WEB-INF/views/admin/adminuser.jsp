<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/join.css" rel="stylesheet">
<link href="resources/reservationlist.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
 <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>회원 목록</h2>
          <ol>
            <li><a href="main">Home</a></li>
            <li>회원 목록</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	<hr/>
    <section class="inner-page">
      <div class="container">
        <div class="wrapper">
            <section class="article-list table-common con">
        <table border="1">
            <thead>
                <tr>
                    <th>회원이름</th>
                    <th>회원이메일</th>
                    <th>회원가입일</th>
                </tr>
            </thead>
            <tbody>
    				<c:forEach var="userlist" items="${userlist}">
					<tr>
						<td>${userlist.name}</td>
						<td>${userlist.email}</td>
						<td><f:formatDate value="${userlist.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><input type="button" name="deleteUserBtn" value="회원탈퇴"/></td>
					</tr>
			</c:forEach>
                   
            </tbody>
        </table>
    </section>
	  </div>
      </div>
    </section>
	<hr/>
  </main><!-- End #main -->
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function () {
			$("[name=deleteUserBtn]").on("click", deleteUserBtn);
		});
	
	
		function deleteUserBtn() {
			var currentRow = $(this).closest('tr');
			var col = currentRow.find('td:eq(0)').text();
 				$.ajax({
				type:"POST",
				url:"removeuser",
				dataType:"json",
				data:{"num" : col},
				success: function(data) {
					if(data.msg != null && data.msg != ""){
						alert(data.msg);
						location.reload();
					}					
				}
			});  
		}
	
	
	</script>
</body>
</html>