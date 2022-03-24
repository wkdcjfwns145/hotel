<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
 <main id="main">
 
     <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>게시글 수정</h2>
          <ol>
            <li><a href="main">Home</a></li>
            <li>글수정</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
      <div class="container">
		<form action="boardupdate" method="post">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" style="width: 860px" value="${board.title}" required/></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="${board.writer}" style="width: 200px" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows=20 cols=100>${board.content}</textarea></td>
					<td>	<input type="hidden" name="bno" value="${board.bno}"/></td>
				</tr>
				<tr>
					
					<td><input type="submit" value="작성완료"/></td>
				</tr>
			</table>
		</form>
      </div>
    </section>

  </main><!-- End #main -->
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>