<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/pensionstyle.css" type="text/css">

</head>
<body>
	
	<div id="wrap">
		<jsp:include page="header.jsp" />
		
		<section class="d-flex justify-content-center">
			<section class="col-lg-7">
				<h1 class="text-center p-4"> 예약하기 </h1>
				<label>이름</label>
				<input type="text" class="form-control" name="name" id="name"/>
				<label class="pt-3">예약날짜</label>
				<input type="text" class="form-control" name="date" id="date"/>
				<label class="pt-3">숙박일수</label>
				<input type="text" class="form-control" name="day" id="day"/>
				<label class="pt-3">숙박인원</label>
				<input type="text" class="form-control" name="headcount" id="headcount"/>
				<label class="pt-3">전화번호</label>
				<input type="text" class="form-control" name="phoneNumber" id="phoneNumber"/>
				
				<button type="button" class="btn btn-block btn-warning mt-3" name="state" id="addBtn">예약하기</button>
				
			</section>
		</section>
	
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#date").datepicker({
				minDate:0, 
                dateFormat: "yy-mm-dd",
                dayNamesMin:['월', '화', '수', '목', '금', '토', '일'],
			});
			
			$("#addBtn").on("click", function(){
				
				let name = $("#name").val();
				let date = $("#date").val();
				let day = $("#day").val();
				let headcount = $("#headcount").val();
				let phoneNumber = $("#phoneNumber").val();
				
				if(name == "") {
					alert("이름을 입력해주세요");
					return;
				}
				
				if(date == "") {
					alert("예약날짜를 입력해주세요");
					return;
				}
				
				if(day == "") {
					alert("숙박일수를 입력해주세요");
					return;
				}
				
				if(headcount == "") {
					alert("숙박인원를 입력해주세요");
					return;
				}
				
				if(phoneNumber == "") {
					alert("전화번호를 입력해주세요");
					return;
				}
				
				$.ajax({
					url:"/ajax/pension/insert",
					type:"get",
					data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber},
					
					success:function(data){
						if(data.result == "success") {
							location.href = "/ajax/pension/list";
						} else {
							alert("삽입실패!!");	
						}
					},
					error:function() {
						alert("에러발생!!");
					}
					
				});
				
			});
			
		});
	
	</script>	
</body>
</html>