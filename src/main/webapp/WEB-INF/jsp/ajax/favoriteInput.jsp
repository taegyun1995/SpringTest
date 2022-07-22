<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1> 즐겨 찾기 추가하기 </h1>
		<!-- <form method="get" action="/ajax/favoriteInsert">  -->
			<label> 제목 </label> <br>
			<input type="text" class="form-control" name="name" id="name" /> <br>
			<label> 주소 </label> <br>
			<input type="text" class="form-control" name="url" id="url"/> <br>
			<button type="button" class="btn btn-success form-control" id="add"> 추가 </button>
		<!--  </form>  -->
	</div>
	
	<script>
		
	$(document).ready(function(){
		
		$("#add").on("click", function(){
			
			let name = $("#name").val();
			let url = $("#url").val();
			
			if(name == "") {
				alert("제목을 입력해주세요");
				return;
			}
			if(url == "") {
				alert("주소를 입력해주세요");
				return;
			}
			
			if(!url.startsWith('http://')) {
				alert("주소를 제대로 입력해주세요..");
				return;
			}
			
			if(!url.startsWith('https://')) {
				alert("주소를 제대로 입력해주세요..");
				return;
			}
			
			$.ajax({
				url: "/ajax/favorite/insert",
				type: "GET",
				data: {"name":name, "url":url},
				
				success:function(data){
					if(data.result == "success") {
						location.href = "/ajax/favorite/list";
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