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
	<h4 class="pt-4">사업자회원 승인</h4>
		            
		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>매장명</th>
					<th>매장주소</th>
					<th>담당자</th>
					<th>사업자번호</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<tbody>
				<!-- ${bmList} 리스트에서 객체 하나를 꺼내서 bm에 넣는다. 객체.속성명 -->
				<c:forEach items="${bmList}" var="bm">
					<tr>
						<td>${bm.bm_id}</td>
						<td>${bm.bm_store_name}</td>
						<td>${bm.bm_address}</td>
						<td>${bm.bm_manager}</td>
						<td>${bm.bm_num}</td>
						<td><button class="btn btn-outline-primary pass" data-target="${bm.bm_id}">승인</button>
						&nbsp;<button class="btn btn-outline-danger reject">거절</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${bmList}
	</div>
	
	<script type="text/javascript">
		$('.pass').click(function(){
			let bm_id = $(this).data('target'); 
				// $(this).closest('tr').find('td:first').text(); // 해당 행의 첫 번째 열(td)에서 bm_id 값을 가져옴
			let obj = {
					// 승인/거절 정보 + 누구에 대한 승인여부인지, bm기본키
					bm_id : bm_id,
					bm_approval : 1
			}
			$.ajax({
				async : true, //비동기 : true(비동기), false(동기)
				url : '<c:url value="/admin/bmember"/>', 
				type : "post", 
				data : JSON.stringify(obj), 
				contentType : "application/json; charset=utf-8",
				dataType : "json", 
				success : function (data){
					console.log(data);
					// bm_approval = 0을 1로 변경한다? 
					// 버튼1개 '가입승인'으로 배치한다.  
				}, 
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
		});
	</script>

</body>
</html>