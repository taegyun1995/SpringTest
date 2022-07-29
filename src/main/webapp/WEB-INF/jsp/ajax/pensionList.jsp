<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 보기</title>
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
		
		<section>
			<h1 class="d-flex justify-content-center p-3"> 예약 목록 보기 </h1>
			<table class="table text-center">
				<thead>
					<tr>
						<th> 이름 </th>
						<th> 예약날짜 </th>
						<th> 숙박일수 </th>
						<th> 숙박인원 </th>
						<th> 전화번호 </th>
						<th> 예약상태 </th>
						<th>  </th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="reservation" items="${book}">
					<tr>
						<td> ${reservation.name } </td>
						<td> <fmt:formatDate value="${reservation.date}" pattern="yyyy년 M월 d일" /> </td>
						<td> ${reservation.day }일 </td>
						<td> ${reservation.headcount }명 </td>
						<td> ${reservation.phoneNumber } </td>
						<c:choose>
							<c:when test="${reservation.state eq '대기중'}">
								<td class="text-info"> ${reservation.state } </td>
							</c:when>
							<c:when test="${reservation.state eq '확정'}">
								<td class="text-success"> ${reservation.state } </td>
							</c:when>
							<c:otherwise>
								<td> ${reservation.state } </td>
							</c:otherwise>
						</c:choose>
						<td> <button type="button" class="delete-Btn btn btn-danger" data-pension-id="${reservation.id}"> 삭제 </button> </td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		
		<jsp:include page="footer.jsp" />
	
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".delete-Btn").on("click", function(){
				
				let pensionId = $(this).data("pension-id");
				
				$.ajax({
					url:"/ajax/pension/delete",
					type:"get",
					data:{"id":pensionId},
					success:function(data){
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제실패!!");
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