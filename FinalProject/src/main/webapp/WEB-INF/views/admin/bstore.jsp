<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 승인 페이지</title>

</head>
<body>

	<div class="container">
	<h4 class="pt-4">매장 등록 승인</h4>
		            
		<table class="table table-hover">
			<thead>
				<tr>
					<th>매장번호</th>
					<th>사업자아이디</th>
					<th>브랜드명</th>
					<th>매장명</th>
					<th>영업시작</th>
					<th>영업종료</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<tbody>
				<!-- ${bsList} 리스트에서 객체 하나를 꺼내서 bs에 넣는다. 객체.속성명 -->
				<c:forEach items="${bsList}" var="bs">
					<tr>
						<td>${bs.st_num}</td>
						<td>${bs.st_bm_id}</td>
						<td>${bs.st_br_name}</td>
						<td>${bs.st_store_name}</td>
						<td>${bs.st_opentime}</td>
						<td>${bs.st_closetime}</td>
						<td><button class="btn btn-outline-primary pass" data-target="${bs.st_num}">승인</button>
							&nbsp;<button class="btn btn-outline-danger reject" data-target="${bs.st_num}">거절</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${bsList}
	</div>
	
	<script type="text/javascript">
		// 승인버튼
		$('.pass').click(function(){
			let st_num = $(this).data('target');
			// $(this).closest('tr').find('td:first').text(); // 해당 행의 첫 번째 열(td)에서 bs_num 값을 가져옴

			let obj = {
				st_num : st_num,
				st_approval : 1
			}
			
			if(!confirm('정말 승인하시겠습니까?')){
				alert('승인을 취소했습니다.')
				return;
			}
			
			$.ajax({
				async : true, //비동기 : true(비동기), false(동기)
				url : '<c:url value="/admin/bstore"/>', 
				type : "post", 
				data : JSON.stringify(obj), 
				contentType : "application/json; charset=utf-8",
				dataType : "json", 
				success : function (data){
					console.log(data);
					st_approval = 1;
					alert('매장등록을 승인했습니다');
					location.reload(); // 현재 페이지 새로고침
				}, 
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
		});
		
		// 거절버튼
		$('.reject').click(function(){
			let st_num = $(this).data('target');
			let obj = {
				st_num : st_num,
				st_approval : 2
			}
			
			if(!confirm('정말 거절하시겠습니까?')){
				alert('거절을 취소했습니다.')
				return;
			}
			
			$.ajax({
				async : true, //비동기 : true(비동기), false(동기)
				url : '<c:url value="/admin/bstore"/>', 
				type : "post", 
				data : JSON.stringify(obj), 
				contentType : "application/json; charset=utf-8",
				dataType : "json", 
				success : function (data){
					console.log(data);
					st_approval = 2;
					alert('매장등록을 거절했습니다');
					location.reload(); // 현재 페이지 새로고침
				}, 
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
		});	
	</script>

</body>
</html>