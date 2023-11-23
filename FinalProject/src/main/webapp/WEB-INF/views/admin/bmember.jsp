<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 승인 페이지</title>
 <link rel="stylesheet" type="text/css" href="/resources/css/bmember.css">
</head>
<body>

	<div class="container">
	<div class="bmember-title-layout">
	<h4 class="bmember-title">사업자회원 승인</h4>	
	</div>
		<table class="table table-hover" id="bmember-table" style="font-size:25px;">
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
						<!-- id로 pass/reject값을 주면 c:forEach 각각의 버튼에 적용되는게 아니라 1개밖에 안된다. class 안에 넣고 $('.pass')로 써야함 -->
						<td><button class="btn btn-outline-primary pass" data-target="${bm.bm_id}">승인</button>
						&nbsp;<button class="btn btn-outline-danger reject" data-target="${bm.bm_id}">거절</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%-- ${bmList} --%>
	</div>
	
	<script type="text/javascript">
		// 승인버튼
		$('.pass').click(function(){
			console.log("확인");
			let bm_id = $(this).data('target'); 
				// $(this).closest('tr').find('td:first').text(); // 해당 행의 첫 번째 열(td)에서 bm_id 값을 가져옴
			let obj = {
					// 승인/거절 정보 + 누구에 대한 승인여부인지, bm기본키
					// 버튼을 클릭하면 승인정보를 1로 바꿔줘라 -> ajax 설정하고 -> controller에서 update시키는 쿼리까지 작업 
					bm_id : bm_id,
					bm_approval : 1
			}
			
			if(!confirm('정말 승인하시겠습니까?')){
				alert('승인을 취소했습니다.')
				return;
			}
				
			$.ajax({
				async : true, //비동기 : true(비동기), false(동기)
				url : '<c:url value="/admin/bmember"/>', 
				type : "post", 
				data : JSON.stringify(obj), 
				contentType : "application/json; charset=utf-8",
				dataType : "json", 
				success : function (data){
					console.log(data.res);
						bm_approval = 1;
						alert('가입을 승인했습니다');
						// makeStore(); <- 새로운 function & ajax로 안하고, Controller에서 일시키기만 추가하면됨!!!
						// alert가 안뜨고, st_bm_id가 중복으로 저장됨..... 
						location.reload(); // 현재 페이지 새로고침
				}, 
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
		});
		
		
		/* function makeStore() {
		let bm_id = 
		let store = {
				// 넘겨줄 매개변수는 id만. st_approval = 0 으로 초기값.
				st_bm_id : bm_id,
				st_approval : 0
		}
		
		$.ajax({
			async : true, //비동기 : true(비동기), false(동기)
			url : '<c:url value="/admin/bmember"/>', 
			type : "post", 
			data : JSON.stringify(store), 
			contentType : "application/json; charset=utf-8",
			dataType : "json", 
			success : function (data){
				console.log(data.store);
					// insert 해줘라 bm_id를 st_bm_id에게. 조건은... 없다...?없을 수 있나???? 있다. 
					alert('매장 번호가 발급되었습니다. 로그인 후, 매장정보를 수정해주세요'); 
					// 그 매장번호는 어떻게 알려줄 것인가, 사업자 로그인하고 첫 페이지에서? 대기중0/승인1 정보를 보여준...다....?
			}, 
			error : function(jqXHR, textStatus, errorThrown){
			}
		});
	} */
	
	
		// 거절버튼
		$('.reject').click(function(){
			let bm_id = $(this).data('target'); 
				// $(this).closest('tr').find('td:first').text(); // 해당 행의 첫 번째 열(td)에서 bm_id 값을 가져옴
			let obj = {
					// 승인/거절 정보 + 누구에 대한 승인여부인지, bm기본키
					bm_id : bm_id,
					bm_approval : 2
			}
			
			if(!confirm('정말 거절하시겠습니까?')){
				alert('거절을 취소했습니다.')
				return;
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
					bm_approval = 2;
					alert('가입을 거절했습니다');
					location.reload(); // 현재 페이지 새로고침
				}, 
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
		});
	</script>

</body>
</html>