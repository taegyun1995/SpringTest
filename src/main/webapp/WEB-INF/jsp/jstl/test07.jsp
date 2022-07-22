<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script   src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/style.css" type="text/css">

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

</head>
<body>

	<div id="wrap">
		<div class="d-flex">
			<jsp:include page="nav.jsp" />
			
			<form method="get" action="/jstl/test07/insert">
				<section class="border-bottom">
				
					<h2 class="pt-3 pl-5"> 날씨 입력 </h2>
					
					<div class="form-inline justify-content-between pt-4 pl-5">
						<div class="form-group">
							<label class="d-flex align-items-center"> 날짜 </label>
							<input type="text" name="date" class="form-control ml-3"/> 
						</div>
						 
						<div class="form-group">
							<label class="d-flex align-items-center "> 날씨 </label>
							<select class="form-control ml-3" name="weather"> 
								<option value="맑음"> 맑음 </option> 
								<option value="구름조금"> 구름조금 </option> 
								<option value="흐림"> 흐림 </option> 
								<option value="비"> 비 </option> 
							</select>
						</div>
						
						<div class="form-group">
							<label class="d-flex align-items-center" > 미세먼지 </label>
							<select class="form-control ml-3" name="microDust"> 
								<option value="좋음"> 좋음 </option> 
								<option value="보통"> 보통 </option> 
								<option value="나쁨"> 나쁨 </option> 
								<option value="최악"> 최악 </option> 
							</select>
						</div>
					</div>
					
					<div class="form-inline justify-content-between pt-4 pl-5">
						<div class="form-group input-group">
							<label class="d-flex align-items-center"> 기온 </label>
							<input type="text" name="temperatures" class="form-control ml-3"/>
						</div>
						
						<div class="form-group">
							<label class="d-flex align-items-center"> 강수량</label>
							<input type="text" name="precipitation" class="form-control ml-3"/> 
						</div>
						
						<div class="form-group">
							<label class="d-flex align-items-center"> 풍속 </label>
							<input type="text" name="windSpeed" class="form-control ml-3"/> 
						</div>
					</div>
					
					<div class="d-flex flex-row-reverse pt-4 pb-4">
						<input type="submit" class="btn btn-success" value="저장" />
					</div>
				
				</section>
			</form>
		
		</div>
		
		<jsp:include page="footer.jsp" />
		
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#date").datepicker({
				date.Format:"yy-mm-dd";
			});
		
		});
	</script>

</body>
</html>