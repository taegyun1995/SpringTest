<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/style.css" type="text/css">

</head>
<body>

	<div class="d-flex">
		<nav class="bg-primary">
			<ul class="nav flex-column">
				<li class="nav-item"> <a href="#" class="nav-link text-white text-center mt-2"> 기상청 </a> </li>
				<li class="nav-item"> <a href="#" class="nav-link text-white mt-3"> 날씨 </a> </li>
				<li class="nav-item"> <a href="#" class="nav-link text-white"> 날씨입력 </a> </li>
				<li class="nav-item"> <a href="#" class="nav-link text-white"> 테마날씨 </a> </li>
				<li class="nav-item"> <a href="#" class="nav-link text-white"> 관측 기후 </a> </li>
			</ul>
		</nav>

		<section class="pl-5 pt-2">
			<div>
				<h2> 과거 날씨 </h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th> 날짜 </th>
							<th> 날씨 </th>
							<th> 기온 </th>
							<th> 강수량 </th>
							<th> 미세먼지 </th>
							<th> 풍속 </th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="weather" items="${weatherhis}" >
					<fmt:parseDate value="${weather.date}" pattern="yyyy-MM-dd" var="date" />
						<tr>
							<td> <fmt:formatDate value="${date}" pattern="yyyy년 M월 d일"/> </td>
							<td> ${weather.weather } </td>
							<td> ${weather.temperatures }℃ </td>
							<td> ${weather.precipitation}mm </td>
							<td> ${weather.microDust} </td>
							<td> ${weather.windSpeed}km/h </td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
	</div>
	<footer>
		<div class="d-flex text-secondary">
			<div class="logo d-flex align-items-center justify-content-center">기상청</div>
			<div class="info p-3">
				<div>(07062) 서울시 동작구 여의대방로 16길 61 </div>
				<div>Copyright@2020 KMA. All Rights RESERVED</div>
			</div>
		</div>
	</footer>
	
</body>
</html>