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
          <h2>예약 관리</h2>
          <ol>
            <li><a href="main">Home</a></li>
            <li>예약 관리</li>
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
                    <th>예약번호</th>
                    <th>이름</th>
                    <th>호실</th>
                    <th>인원수</th>
                    <th>예약 시작일</th>
                    <th>예약 종료일</th>
                    <th>예약 취소</th>
                </tr>
            </thead>
            <tbody>
    				<c:forEach var="rlist" items="${rlist}">
					<tr>
						<td>${rlist.cnum}</td>
						<td>${sessionScope.uvo.name}</td>
						<td>${rlist.room}</td>
						<td>${rlist.person}</td>
						<td>${rlist.cstart}</td>
						<td>${rlist.cend}</td>
						<td><input type="button" value="예약취소" name="cancelBtn"/></td>
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
	   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script>
		$(function () {
			$("[name=cancelBtn]").on("click", cancelBtn);
		});
		
		function cancelBtn(){	
			var currentRow = $(this).closest('tr');
			var col1 = currentRow.find('td:eq(0)').text();
 			$.ajax({
				type:"POST",
				url:"reservationcancel",
				dataType:"json",
				data:{"cnum" : col1},
				success: function(data) {
					if(data.msg != null && data.msg != ""){
						alert(data.msg);
						location.reload();
					}
						
				}
			}); 
			
		}
		</script>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>