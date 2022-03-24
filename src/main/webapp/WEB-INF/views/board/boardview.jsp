<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.loginForm{
		width: 300px;
		margin : 0 auto;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
	  <link href="resources/board.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

 <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>QnA 게시판</h2>
          <ol>
            <li><a href="main">Home</a></li>
            <li>QnA</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	<hr/>
		
    <section class="inner-page">
      <div class="container">
	<section class="notice">  
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-name">작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-viewcnt">조회수</th>
                </tr>
                </thead>
                <tbody>
    				<c:forEach var="row" items="${list}">
					<tr>
						<td>${row.bno}</td>
						<td><a href="viewpage?bno=${row.bno}">${row.title}</a></td>
						<td>${row.writer}</td>
						<td><f:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${row.viewcnt}</td>
					</tr>
			</c:forEach>
                </tbody>
            </table>
            <div class="pm">
            <table>
            	<tr>
					<!-- pm -->
					<th colspan="10">
						<c:if test="${pm.first}">
							<a href="boardview?page=1">[<<]</a>
						</c:if>
						<c:if test="${pm.prev}">
							<a href="boardview?page=${pm.startPage-1}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
							<a href="boardview?page=${i}">[${i}]</a>
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="boardview?page=${pm.endPage+1}">[다음]</a>
						</c:if>
						<c:if test="${pm.last}">
							<a href="boardview?page=${pm.maxPage}">[>>]</a>
						</c:if>
					</th>
				</tr>
				<tr>
					<c:set var="email" value="${sessionScope.uvo.email}"/>
					<c:if test="${!empty email}">
						<td><input class="boardbtn" type="button" onclick="location.href='boardwrite';" value="게시글 작성"/></td>
					</c:if>
				</tr>
            </table>
            </div>
        </div>
    </div>
	</section>
	 </div>
    </section>
	<hr/>
  </main>
  <!-- End #main -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>