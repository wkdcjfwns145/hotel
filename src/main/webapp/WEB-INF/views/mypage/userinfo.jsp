<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

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
          <h2>개인정보</h2>
          <ol>
            <li><a href="main">Home</a></li>
            <li>개인정보</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	<hr/>
    <section class="inner-page">
      <div class="container">
        <div class="wrapper">   
         <fieldset>
         	 <input type="text" value="${sessionScope.uvo.num}" id="num" hidden="true"/>
         	 <input type="text" value="${sessionScope.uvo.name}" id="name" hidden="true"/>
    		 <form id="fm" name="fm">                                                      
	      		<table class="tbl_model">
                <colgroup>
                    <col style="width:22%"><col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">           
                        <div class="thcell">
						     	   <span class="word_br">이름</span>  	   
						 </div>	
                    </th>
                    <td>
                     <hr/>
                        <div class="tdcell">
                            <p class="contxt_tit">${sessionScope.uvo.name}</p>
                            <p class="btn_area_btm">
                            </p>
                        </div>
                       <hr/>
                    </td>
                </tr>
                 <tr>
                    <th scope="row">
                        <div class="thcell">
						     	   <span class="word_br">이메일</span>
						     </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p class="contxt_tit">${sessionScope.uvo.email}</p>
                            <p class="btn_area_btm">
                            <input type="text" id="idupdateInput"/>
                                <a href="#" id="idupdateBtn" class="btn_model"><b class="btn2">수정</b></a>
                                <a href="#" id="idupdateBtn_ok" class="btn_model"><b class="btn2">완료</b></a>
                            </p>
                        </div>
                        <hr/>
                    </td>
                </tr>
                 <tr>
                    <th scope="row">
                        <div class="thcell">
						     	   <span class="word_br">비밀번호</span>
						     </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p class="contxt_tit">${sessionScope.uvo.pw}</p>
                            <p class="btn_area_btm">
                                <input type="password" id="pwupdateInput"/>
                                <input type="password" id="rpwupdateInput"/>
                                <a href="#" id="pwupdateBtn" class="btn_model"><b class="btn2">수정</b></a>
                                <a href="#" id="pwupdateBtn_ok" class="btn_model"><b class="btn2">완료</b></a>
                            </p>
                        </div>
                        <hr/>
                    </td>
                </tr>           
                <tr>
                    <th scope="row">
                        <div class="thcell">
						     <span class="word_br">회원탈퇴</span>
						</div>
                    </th>
                       <td>
                        <div class="tdcell">
                            <p class="contxt_tit"></p>
                            <p class="btn_area_btm">
                            	<input type="text" id="num" value="${sessionScope.uvo.num}" hidden="true"/>
                                <input type="button" id="deleteUser" value="회원탈퇴"/>
                            </p>
                        </div>
                        <hr/>
                    </td>
                    </tr>
                </tbody>
                </table>
    	</form>
    	</fieldset>
	  </div>
      </div>
    </section>
	<hr/>
  </main>
  <!-- End #main -->
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script>
  		$("#idupdateInput").hide();  // 아이디 수정
  		$("#idupdateBtn_ok").hide(); // 아이디 수정완료 버튼
 		$("#pwupdateInput").hide();  // 비밀번호 수정
 		$("#rpwupdateInput").hide();  // 비밀번호 재입력
  		$("#pwupdateBtn_ok").hide(); //  비밀번호 수정완료 버튼
 		$("#emailupdateInput").hide();  // 이메일 수정
  		$("#emailupdateBtn_ok").hide(); // 이메일 수정완료 버튼
  		
   
   		$ (function(){
   			$("#idupdateBtn").on("click", idupdateBtn);
   			$("#idupdateBtn_ok").on("click", idupdateBtn_ok);
   			$("#pwupdateBtn").on("click", pwupdateBtn);
   			$("#pwupdateBtn_ok").on("click", pwupdateBtn_ok);
   			$("#emailupdateBtn").on("click", emailupdateBtn);
   			$("#emailupdateBtn_ok").on("click", emailupdateBtn_ok);
   			$("#deleteUser").on("click", deleteUser);
   		});	
  		
  		// 회원탈퇴
  		function deleteUser() {
  			$.ajax({
				type: "POST",
				url: "removeuser",
				dataType:"json",
				data:{"num" : $("#num").val()},
				success: function(data) {
					if(data.msg != null && data.msg != ""){
						alert(data.msg);
						location.href="logout";
					}
				}
			});
		}
  		
  		// 비밀번호 수정
  		function pwupdateBtn_ok() {
  			if($("#pwupdateInput").val() == $("#rpwupdateInput").val()){
	  			$.ajax({
					type: "POST",
					url: "pwupdate",
					dataType:"json",
					data:{"pw" : $("#pwupdateInput").val(),
						  "id" : $("#id").val(),
						  "num" : $("#num").val()},
					success: function(data) {
						if(data.msg != null && data.msg != ""){
							alert(data.msg +"(다시 로그인 해주세요)");
							location.href="logout";
						}
					}
				});
  			} else{
  				alert("비밀번호를 다시 입력해주세요");
  			}
		}
  		// 이메일 수정
  		function emailupdateBtn_ok() {
  			$.ajax({
				type: "POST",
				url: "emailupdate",
				dataType:"json",
				data:{"email" : $("#emailupdateInput").val(),
					  "num" : $("#num").val()},
				success: function(data) {
					if(data.msg != null && data.msg != ""){
						alert(data.msg +"(다시 로그인 해주세요)");
						location.href="logout";
					}
				}
			});
		}
  		
   		function idupdateBtn() {
   			$("#idupdateInput").show();
   			$("#idupdateBtn").hide();
   			$("#idupdateBtn_ok").show();
   			
		}
   		function pwupdateBtn() {
   			$("#pwupdateInput").show();
   			$("#rpwupdateInput").show();
   			$("#pwupdateBtn").hide();
   			$("#pwupdateBtn_ok").show();
   			
		}
   		
   		function emailupdateBtn() {
   			$("#emailupdateInput").show();
   			$("#emailupdateBtn").hide();
   			$("#emailupdateBtn_ok").show();
		}
   </script>

	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
