<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰관리 페이지</title>
</head>
<body>

	<div class="container">
		<h4 class="pt-4">리뷰 관리</h4>
		          
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자아이디</th>
						<th>주문메뉴번호</th>
						<th>리뷰내용</th>
						<th>별점</th>
						<th>관리자권한</th>
					</tr>
				</thead>
				<tbody>
					<!-- ${reList}에서 객체를 하나 꺼내서 re에 넣는다. 객체.속성명 -->
					<c:forEach items="${reList}" var="re">
						<tr>
							<td>${re.re_num}</td>
							<td>${re.re_user_id}</td>
							<td>${re.re_or_num}</td>
							<td>${re.re_contents}</td>
							<td>${re.re_star}</td>
							<%-- <td><button class="btn btn-outline-danger delete" data-target="${re.re_num}">삭제</button></td> --%>
							<td><button class="btn btn-outline-danger" onclick="deleteReview(${re.re_num})">삭제</button></td>
						</tr>
					</c:forEach>
				
				
				</tbody>
			</table>
			${reList}
		</div>
</body>
	<script type="text/javascript">
		/* $('.delete').click(function(){
			let re_num = $(this).data('target');
		}) */
	
		function deleteReview(re_num){
			let obj = {
					re_num : re_num
			}
			// 삭제를 취소하는 코드는 성공주의인 ajax 앞 쪽에서 처리해야한다. 
			if(!confirm('정말 삭제하시겠습니까?')){
				alert('리뷰 삭제를 취소했습니다.')
				return;
			}
			$.ajax({
				async : true|false, //비동기 : true(비동기), false(동기)
				url : '<c:url value="/admin/review"/>', 
				type : 'post', 
				data : JSON.stringify(obj), 
				contentType : "application/json; charset=utf-8",
				dataType : "json", 
				success : function (data){
					console.log(data.res);
						if(data.res){
						
								alert('리뷰를 삭제했습니다.')
								location.reload();
							
						}else{
							alert('리뷰를 삭제하지 못했습니다.')
						}
				}, 
				error : function(jqXHR, textStatus, errorThrown){
				}
			});
		}
	</script>
</html>