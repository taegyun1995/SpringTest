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
			<div class="d-flex">
			<input type="text" class="form-control" name="url" id="url"/>
			<button type="button" class="btn btn-info ml-2" id="overlapBtn"> 중복확인 </button>
			</div>
			<span id="overlaptext" class="small text-danger d-none">중복된 url 입니다.</span>
			<span id="nonoverlaptext" class="small text-info d-none">저장 가능한 url 입니다.</span>
			<button type="button" class="btn btn-success btn-block mt-4" id="add"> 추가 </button>
		<!--  </form>  -->
	</div>
	
	<script>
		
	$(document).ready(function(){
		
		var isCheckOverlap = false;
		var isOverlap = false;
		
		$("#url").on("input", function(){
			isCheckOverlap = false;
			isOverlap = false;
			$("#nonoverlaptext").addClass("d-none");
			$("#overlaptext").addClass("d-none");
		});
		
		$("#overlapBtn").on("click", function(){
			
			let url = $("#url").val();
			
			if(url == "") {
				alert("주소를 입력해주세요");
				return;
			}
			
			if(!url.startsWith("http://") && !url.startsWith("https://")) {
				alert("주소를 제대로 입력해주세요..");
				return;
			}
			
			$.ajax({
				url:"/ajax/favorite/overlap",
				type:"Post",
				data:{"url":url},
				
				success:function(data){
					
					isCheckOverlap = true;
					
					if(data.overlap){
						isOverlap = true;
						$("#overlaptext").removeClass("d-none");
						$("#nonoverlaptext").addClass("d-none");
					} else {
						isOverlap = false;
						$("#nonoverlaptext").removeClass("d-none");
						$("#overlaptext").addClass("d-none");
					}
				},
				error:function(){
					alert("에러 발생!!");
				}
			});
			
		});
		
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
			
			if(!url.startsWith("http://") && !url.startsWith("https://")) {
				alert("주소를 제대로 입력해주세요..");
				return;
			}
			
			// 중복 확인 진행 했는지
			if(isCheckOverlap == false) { // 중복체크를 하지 않은 상태
				alert("중복 체크 하세요!!");
				return;
			}
			
			// 중복된 상태인지
			if(isOverlap) {
				alert("url이 중복되었습니다.")
				return;
			}
			
			$.ajax({
				url:"/ajax/favorite/insert",
				type:"Post",
				data:{"name":name, "url":url},
				
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