<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/favorstyle.css" type="text/css">
</head>
<body>
	<div class="container">
	
		<h1> 즐겨 찾기 목록 </h1>
		
		<table class="table">
			<thead>
				<tr>	
					<th> No  </th>
					<th> 이름 </th>
					<th> 주소 </th>
					<th>     </th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="favorite" items="${favor }" varStatus="status">
				<tr>
					<td class="id"> ${status.count} </td>
					<td> ${favorite.name } </td>
					<td> ${favorite.url }  </td>
					<td> <button type="button" class="delete-Btn btn btn-sm btn-danger" data-favorite-id="${favorite.id}"> 삭제 </button>  </td>
				</tr>
			</c:forEach>
			</tbody>
				
		</table>
		
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".delete-Btn").on("click", function(){
				// 지금 클릭된 버튼이 포함된 행의 id 얻어오기 $(this)
				let favoriteId = $(this).data("favorite-id");
				
				// id를 전달해서 해당 즐겨찾기를 삭제해주는 API 활용
				$.ajax({
					url:"/ajax/favorite/delete",
					type:"get",
					data:{"id":favoriteId},
					
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