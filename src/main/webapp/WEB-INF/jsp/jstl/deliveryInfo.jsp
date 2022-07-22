<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/style2.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<jsp:include page="header2.jsp" />
		
		<section>
			<div class="display-3 d-flex align-items-center pt-2"> 우리동네 가게 </div>
			
			<c:forEach var="store" items="${str}" >
			<div class="pt-3">
				<div class="border border-info rounded p-4">
						<div> <h2> ${store.name } </h2> </div>
						<div class="storeNum">전화 번호 : ${store.phoneNumber }</div>
						<div class="storeadd">주소 : ${store.address }</div>
				</div>
			</div>
			</c:forEach>
			
		</section>
		
		<hr>
		
		<jsp:include page="footer2.jsp" />
	</div>
	
</body>
</html>