<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/reservationlist.css" rel="stylesheet">
<style>
	.loginForm{
		width: 300px;
		margin : 0 auto;
	}
	.input_border{
		border: none;	
	}
	
	.boardbtn{
	  position: absolute;
	  left : 60%;
	  bottom : 40%;
	  width: 150px;
	  padding: 0;
	  margin-top: 1px;
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
          <h2>상세보기</h2>
          <ol>
            <li><a href="main">Home</a></li>
            <li>상세보기</li>
          </ol>
        </div>
		<hr/>
      </div>
    </section><!-- End Breadcrumbs -->

      <div class="container">
    <section class="article-detail table-common con row">
        <table class="cell" border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
            <tbody>
                <tr class="article-title">
                    <th>제목</th>
                    <td colspan="3">${readview.title}</td>
                </tr>
                <tr class="article-info">
                	<th>작성자</th>
                	<td>${readview.writer}</td>
                    <th>날짜</th>
                    <td><f:formatDate value="${readview.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <th>조회수</th>
                    <td>${readview.viewcnt}</td>
                </tr>
                <tr class="article-body">
                    <td colspan="4">${readview.content}<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></td> 
        </table>
         <!-- 글 삭제 & 수정 -->
     <div class="boardbtn">
			<c:set var="name" value="${sessionScope.uvo.name}"/>
			<c:set var="writer" value="${readview.writer}"/>
			<input type="text" id="bno" value="${readview.bno}" hidden="true">
			<c:if test="${name eq writer}">
				<input type="button" id="deleteBtn" value="삭제"/>
				<form action="boardupdate" method="get">
				<input type="text" name="bno" value="${readview.bno}" hidden="true">
				<input type="submit" id="updateBtn" value="수정"/>
				</form>
			</c:if>
			<c:if test="${name eq '관리자'}">
			<input type="button" id="deleteBtn" value="삭제"/>
			</c:if>
	</div>
		<!-- END 글 삭제 & 수정 -->	
        <hr/>
        
        <!-- 댓글 작성 -->	
        <h4>댓글 입력</h4>
    <section class="reply-form">
        <form>
            <div>
                <input type="text" id="rwriter" name="rwriter" value="${sessionScope.uvo.name}" readonly>
                <input type="text" id="rid" name="rid" value="${sessionScope.uvo.name}" hidden="true">
                <input type="text" id="bnum" name="bnum" value="${readview.bno}" hidden="true"> 
            </div>
            <div>
                <textarea id="rcontent" name="rcontent"></textarea>
                <input id="replyBtn" value="작성" type="button">
            </div>
        </form>
    </section>
	   <!-- END 댓글 작성 -->	
    <h4>댓글 목록</h4>
    <section class="reply-list table-common">
        <table border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
     				<c:forEach var="reply" items="${replylist}">
					<tr>
						<td>${reply.rwriter}</td>
						<td style="display:none;">${reply.rnum}</td>
						<td>${reply.rcontent}</td>
						<td style="display:none;"><input type="text" id="updatecontent" name="updatecontent"/></td>
						<td><f:formatDate value="${reply.rregdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<!-- 댓글 삭제 & 수정 -->
						<td>    		
						     <div>
									<c:set var="id" value="${sessionScope.uvo.name}"/>
									<c:set var="writer" value="${reply.rwriter}"/>
									<c:if test="${id eq writer}">
										<input type="button" name="replyDelete" value="삭제"/>
										<input type="button" name="replyUpdate" value="수정"/>
										<input type="button" name="replyUpdateOk" value="완료"/>
										<input type="button" name="replyUpdateCancel" value="취소"/>
									</c:if>
							</div>
						</td>
			<!-- END 댓글 삭제 & 수정 -->	
					</tr>
			</c:forEach>
        </table>
    </section>
    </section>
</div>
	<hr/>   
  </main><!-- End #main -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	$("[name=replyUpdateOk]").hide();
	$("[name=replyUpdateCancel]").hide();
	
	$(function () {
		$("#replyBtn").on("click", replyBtn);
		$("#deleteBtn").on("click", deleteBtn);
		$("[name=replyUpdate]").on("click", replyUpdate);
		$("[name=replyUpdateOk]").on("click", replyUpdateOk);
		$("[name=replyDelete]").on("click", replyDelete);
		$("[name=replyUpdateCancel]").on("click", replyUpdateCancel);
	});
	
		function replyBtn() {
			
			var logincheck = "${sessionScope.uvo}";
			if( logincheck == ""){
				alert("로그인을  해주세요");
				return false;
			} else{
				$.ajax({
					type:"POST",
					url:"reply",
					dataType:"json",
					data:{"bnum" : $("#bnum").val(),
						  "rid" : $("#rid").val(),
						  "rwriter" : $("#rwriter").val(),
						  "rcontent" : $("#rcontent").val()
						  },
					success: function(data) {
						if(data.msg != null && data.msg != ""){
							alert(data.msg);
							location.reload();
						}
							
					}
				});
			}
		}
		
		function deleteBtn() {
			$.ajax({
				type:"POST",
				url:"deleteboard",
				dataType:"json",
				data:{"bno" : $("#bno").val()},
				success: function(data) {
					if(data.msg != null && data.msg != ""){
						alert(data.msg);
						location.replace("boardview");
					}
						
				}
			});
		}
		
		function replyUpdate() {

			$("[name=replyUpdate]").hide();
			$("[name=replyDelete]").hide();
			$("[name=replyUpdateOk]").show();
			$("[name=replyUpdateCancel]").show();
			var currentRow = $(this).closest('tr');
			currentRow.find('td:eq(3)').css("display","block");
			currentRow.find('td:eq(2)').css("display","none");

		}
		
		function replyUpdateCancel() {
				location.reload();
		}
		
		function replyUpdateOk() {
			var currentRow = $(this).closest('tr');
			var rnum = currentRow.find('td:eq(1)').text();
			var rcontent = currentRow.find('td:eq(3)').text();
			if(rcontent != "" && rcontent != null){
	   			$.ajax({
					type:"POST",
					url:"replyUpdate",
					dataType:"json",
					data:{"rcontent" : rcontent,
						  "rnum" : rnum},
					success: function(data) {
						if(data.msg != null && data.msg != ""){
							alert(data.msg);
							location.reload();
						}					
					}
				}); 
			} else{
				alert("내용을 입력해주세요");
			}
		}
	
		function replyDelete() {
			var currentRow = $(this).closest('tr');
			var col = currentRow.find('td:eq(1)').text();
 			$.ajax({
				type:"POST",
				url:"replyDelete",
				dataType:"json",
				data:{"rnum" : col},
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