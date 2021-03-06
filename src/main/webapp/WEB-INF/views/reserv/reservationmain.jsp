<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
 <link href='resources/fullcalendar/main.css' rel='stylesheet' />
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src='resources/fullcalendar/main.js'></script>
    <script>
		$(function () {
			$("#reservationBtn").on("click", reservationBtn);
		});
		
		function reservationBtn(){		
			$.ajax({
				type:"POST",
				url:"reservation",
				dataType:"json",
				data:{"cstart" : $("#cstart").val(),
					  "cend" : $("#cend").val(),
					  "cname" : $("#cname").val(),
					  "room" : $("#room").val(),
					  "person" : $("#person").val()
					  },
				success: function(data) {
					if(data.msg != null && data.msg != ""){
						alert(data.msg);
						location.reload();
					}
						
				}
			});
			
		}

      document.addEventListener('DOMContentLoaded', function() {  
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
          initialDate: '2021-03-11',
          initialView: 'dayGridMonth',
          selectable: true,
          //droppable: true,
          //editable: true,
          locale : 'ko',
	 		
          events:
        	  [
        	  <c:forEach var="reserv" items="${list}">
        	    {
	        	  title : '${reserv.cname}',
	        	  start : '${reserv.cstart}',
	        	  end : '${reserv.cend}'
          		},
	 		</c:forEach>
          		]
        });
        calendar.render();
        
      }); 
    </script>
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
          <h2>?????? ??????</h2>
          
          <ol>
            <li><a href="main">Home</a></li>
            <li>??????</li>
          </ol>
        </div>
			<div>
				??????<select id="room" name="room">
						<option value="101">101???</option>
						<option value="101">201???</option>
						<option value="101">301???</option>
						<option value="101">401???</option>
						<option value="101">501???</option>
					</select>
				?????????<input type="date" id="cstart" value="2021-03-11" name="cstart"/>
				?????????<input type="date" id="cend" value="2021-03-11" name="cend"/>
				?????????<input style="width:5%" min="0" max="5" type="number" id="person" value="1" name="person"/>
					<input type="submit" id="reservationBtn" value="????????????"/>
		
			</div>
			<div>
				<input type="hidden" id="cname" value="${sessionScope.uvo.name}" name="cname"/>
			</div>
      </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
      <div class="container">

		
		<h3>????????????</h3>

		 
	    <div id='calendar'></div>
	

      </div>
    </section>

  </main><!-- End #main -->
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>