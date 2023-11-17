<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로모션 승인 페이지</title>
 <link rel="stylesheet" type="text/css" href="/resources/css/ad.css">
</head>
<body>

	<div class="container" id="ad-container">
	<h4 class="pt-4" id="ad-title">프로모션/광고 승인</h4>
		            
		<table class="table table-hover" id="ad-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>이미지</th>
					<th>해당매장</th>
					<th>내용</th>
					<th>광고기간</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<tbody>
				<!-- ${adList}에서 객체를 하나 꺼내서 ad에 넣는다. 객체.속성명 -->
				<c:forEach items="${adList}" var="ad">
					<tr>
						<td>${ad.ad_num}</td>
						<td>${ad.ad_image}</td>
						<td>${ad.ad_br_name}</td>
						<td>${ad.ad_contents}</td>
						<td>${ad.ad_date}</td>
						<td><button class="btn btn-outline-primary pass" data-target="${ad.ad_num}">승인</button>
						&nbsp;<button class="btn btn-outline-danger reject" data-target="${ad.ad_num}">거절</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%-- ${adList} --%>
	</div>
</body>

	<script type="text/javascript">
	// 승인 버튼
	$('.pass').click(function(){
		let ad_num = $(this).data('target');
			// $(this).closest('tr').find('td:first').text(); // 해당 행의 첫 번째 열(td)에서 pr_num 값을 가져옴
		let obj = {
				ad_num : ad_num,
				ad_approval : 1
		}
		
		if(!confirm('정말 승인하시겠습니까?')){
			alert('승인을 취소했습니다.')
			return;
		}
		
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/admin/ad"/>', 
			type : 'post', 
			data : JSON.stringify(obj), 
			contentType : "application/json; charset=utf-8",
			dataType : "json", 
			success : function (data){
				console.log(data.res);
				
				ad_approval = 1;
				alert('프로모션 등록을 승인했습니다.')
				location.reload();
				
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	});
	
	// 거절 버튼
	$('.reject').click(function(){
		let ad_num = $(this).data('target');
			// $(this).closest('tr').find('td:first').text(); // 해당 행의 첫 번째 열(td)에서 pr_num 값을 가져옴
		let obj = {
				ad_num : ad_num,
				ad_approval : 2
		}
			
		if(!confirm('정말 거절하시겠습니까?')){
			alert('거절을 취소했습니다.')
			return;
		}
		
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/admin/ad"/>', 
			type : 'post', 
			data : JSON.stringify(obj), 
			contentType : "application/json; charset=utf-8",
			dataType : "json", 
			success : function (data){
				console.log(data.res);
				
				ad_approval = 2;
				alert('프로모션 등록을 거절했습니다.')
				location.reload();
				
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	});
	</script>
</html>