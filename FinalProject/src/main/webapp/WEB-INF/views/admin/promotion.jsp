<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로모션 승인 페이지</title>
</head>
<body>

	<div class="container">
	<h4 class="pt-4">프로모션 승인</h4>
		            
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>타입</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<tbody>
				<!-- ${prList}에서 객체를 하나 꺼내서 pr에 넣는다. 객체.속성명 -->
				<c:forEach items="${prList}" var="pr">
					<tr>
						<td>${pr.pr_num}</td>
						<td>${pr.pr_subject}</td>
						<td>${pr.pr_contents}</td>
						<td>${pr.pr_type}</td>
						<td><button class="btn btn-outline-primary pass" data-target="${pr.pr_num}">승인</button>
						&nbsp;<button class="btn btn-outline-danger reject" data-target="${pr.pr_num}">거절</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${prList}
	</div>
</body>

	<script type="text/javascript">
	// 승인 버튼
	$('.pass').click(function(){
		let pr_num = $(this).data('target');
			// $(this).closest('tr').find('td:first').text(); // 해당 행의 첫 번째 열(td)에서 pr_num 값을 가져옴
		let obj = {
				pr_num : pr_num,
				pr_approval : 1
		}
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/admin/promotion"/>', 
			type : 'post', 
			data : JSON.stringify(obj), 
			contentType : "application/json; charset=utf-8",
			dataType : "json", 
			success : function (data){
				console.log(data.res);
				pr_approval = 1;
				alert('프로모션 등록을 승인했습니다.')
				location.reload();
				
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	});
	
	// 거절 버튼
	$('.reject').click(function(){
		let pr_num = $(this).data('target');
			// $(this).closest('tr').find('td:first').text(); // 해당 행의 첫 번째 열(td)에서 pr_num 값을 가져옴
		let obj = {
				pr_num : pr_num,
				pr_approval : 2
		}
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/admin/promotion"/>', 
			type : 'post', 
			data : JSON.stringify(obj), 
			contentType : "application/json; charset=utf-8",
			dataType : "json", 
			success : function (data){
				console.log(data.res);
				pr_approval = 2;
				alert('프로모션 등록을 거절했습니다.')
				location.reload();
				
			}, 
			error : function(jqXHR, textStatus, errorThrown){
	
			}
		});
	});
	</script>
</html>