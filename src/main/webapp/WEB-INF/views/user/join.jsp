<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/join.css" rel="stylesheet">
<style>
	#Msg_true{color:#fff; display: none;}
	#Msg_false{color:#6A82FB; display: none;}
	#checkpassword_true{color:#fff; display: none;}
	#checkpassword_false{color:#6A82FB; display: none;}
	
#emailBtn {
	position: absolute;
	margin-left: 44%;
	top: 372px;
	display : none;
}

#emailcheck {
	position: absolute;
	margin-left: 44%;
	top: 372px;
}

.checkText{
	position: absolute;
	margin-left: 44%;
	top: 450px;
}

.checkText_ok{
	position: absolute;
	margin-left: 44%;
	top: 520px;
	display: none;
}
.next{
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
 <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <ol>
            <li><a href="/">Home</a></li>
            <li>회원가입${joincode}</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
	<hr/>
    <section class="inner-page">
      <div class="container">
      <input  type="button" value="인증번호 발송" id="emailBtn" />
      <input  type="button" value="중복검사" id="emailcheck" />
   	    <span class="checkText_ok" id="checkpassword_true">비밀번호 일치</span>
        <div class="next"><span class="checkText" id="checkpassword_pw">비밀번호는 특수문자/문자/숫자 포함 6~15자</span></div>
        <span class="checkText_ok" id="checkpassword_false">비밀번호를 제대로 입력해주세요.</span>
      	<form class="joinForm">     
      	<h2>회원 가입</h2>                                                                         
	      <div class="textForm">
	        <input name="email" id="email" type="email" class="cellphoneNo" placeholder="이메일" required> 	
	      </div>
	      <div class="first">
	      	 <div class="textForm">
	        	<input  id="code" type="text" class="cellphoneNo" placeholder="인증번호" required> 	
	      	</div>
	      		<input type="button" class="btn" id="emailSuccess" value="인증 완료"/>
	      </div>
	      <div class="next">
	      	  <div class="textForm">
		        <input name="name" id="name" type="text" class="name" placeholder="이름" required>
		      </div>
		      <div class="textForm">
		        <input name="pw" type="password" class="pw" id="pw" placeholder="비밀번호" required>
		      </div>
		       <div class="textForm">
		        <input name="rpw" type="password" class="pw" id="rpw" oninput ="pwcheck()" placeholder="비밀번호 확인" required>
		      </div>
		      <input type="button" class="btn" id="joinBtn" value="가입 완료"/>
	      </div>
    	</form>
      </div>
    </section>
   </main><!-- End #main -->
	<hr/>
 <jsp:include page="/WEB-INF/views/common/footer.jsp" />
 
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	var correctColor = "#00ff00";
	var wrongColor = "#ff0000";
	var checkpw = 0;
	var passwordRules = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //특수문자/문자/숫자 포함 6~15
	var joincode = <%= (String)session.getAttribute("joincode")%>;
	
	$(function () {
		$("#emailcheck").on("click", emailcheck);
		$("#joinBtn").on("click", joinBtn);
		$("#emailBtn").on("click", emailBtn);
		$("#emailSuccess").on("click", emailSuccess);
	});
	
	
	// 인증완료 버튼
	function emailSuccess() {
		
		if(joincode == $("#code").val()){
			<% session.removeAttribute("joincode");%>
			$(".next").show();
			$(".first").hide();
		} else{
			alert("인증번호를 다시 입력해주세요.")
		}
		
	}
	
	// 이메일 전송
	function emailBtn() {
		var mail = $("#email").val();
		sessionStorage.setItem('mail', mail);
		if(joincode != null){
			alert("이미 인증번호를 전송하였습니다.");
		} else{
		 	$.ajax({
				url : "sendMail",
				type : "post",
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(){
					alert("인증메일을 발송하였습니다.");	
					location.reload();
				},
				error : function() {
					alert("이메일이 존재하지 않거나 잘못되었습니다.");
					<% session.removeAttribute("joincode");%>
					location.reload();
				}
			});	
		}
	}
	
	// 회원가입 버튼
	function joinBtn() {
		if(checkpw == 0){
			alert("비밀번호를 다시 입력해주세요");
		}else{
		 	$.ajax({
				url : "login",
				type : "post",
				dataType : "json",
				data : {"pw" : $("#pw").val(),
						"name" : $("#name").val(),
						"email" : $("#email").val()},
				success : function(data){
						alert(data.msg);
						location.href="login";	
					},
				error : function() {
					
				}
			});
		}
	}
	
	// 이메일 체크
	function emailcheck() {
		if($("#email").val() != ""){
		 	$.ajax({
				url : "emailcheck",
				type : "post",
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data){
					if(data.result != 0){
						alert("이미 사용중인 이메일 입니다.")
					}else{
						$("#emailBtn").show();
						$("#emailcheck").hide();
					}
				}
			});
		} else{
			alert("이메일을 입력해 주세요.");
		}

	}

	// 비밀번호 체크
	function pwcheck(){
		var password = document.getElementById('checkpassword_true');
		var repassword = document.getElementById('checkpassword_false');
		if($("#pw").val() == $("#rpw").val() && passwordRules.test($("#pw").val())){
			checkpassword_true.style.color = correctColor;
		    $('#checkpassword_true').css("display","inline-block"); 
            $('#checkpassword_false').css("display", "none");
            checkpw = 1;
		}else if(!passwordRules.test($("#pw").val())){
			checkpassword_false.style.color = wrongColor;
           $('#checkpassword_true').css("display", "none");
           $('#checkpassword_false').css("display", "inline-block");
           checkpw = 0;
		}
		else{
			checkpassword_false.style.color = wrongColor;		
			 $('#checkpassword_false').css("display","inline-block");
            $('#checkpassword_true').css("display", "none");
            checkpw = 0;
		}
	}
	
	document.addEventListener('DOMContentLoaded', function() {
		$("#email").val(sessionStorage.getItem("mail"));
		sessionStorage.clear();
	});
	
</script>
</body>
</html>