<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>리뷰 등록</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- style css -->
		<link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>">
	<style>
	/* 개별 css파일로 관리 */
	</style>
</head>
<body>	
	<div class="review-container">
		<h2 class="mt-4">주문내역</h2>
		<p>주문내역 리스트? 최근 주문내역 불러오기?</p>
		<form action="<c:url value='/review/insert'/>" method="post">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th></th>
						<th>주문번호</th>
						<th>매장이름</th>
						<th>주문한음료</th>
					</tr>
				</thead>
				// 주문메뉴번호 주문시간 주문상태(완료가 된 음료만 리뷰를 남길 수 있겠지...) 주문메뉴이름 주문메뉴번호
				<tbody>
					<tr>
						<td><input type="checkbox" name="reviewcheck"></td>
			            <td>(내가 주문한) (제조 완료된 음료) 주문내역 불러주세요ㅠ</td>
					</tr>
					<c:forEach items="${orderList}" var="order" varStatus="reviewStatus">
						<tr>
							<td><input type="checkbox" name="reviewcheck"></td>
				            <td>얜 무슨 데이터를 받고 5개를 출력하고 있는걸까?</td>
				            
						</tr>
					</c:forEach>
					<c:forEach items="${orderList}" var="order" varStatus="reviewStatus">
			            <tr>
			            	<td>${review.re_or_num}</td>
			                <!-- <td><input type="checkbox" class="reviewcheck" type="hidden" name="re_or_num" id="re_or_num"></td> -->
			                <td>${order.or_num}</td>
			                <td>${order.or_drinks}</td>
			                <td>${order.or_manuNum}</td>
			            </tr>
			        </c:forEach>
				</tbody>
			</table>
			
			
			<!-- 추가된 부분: 리뷰 관련 정보를 담을 hidden input -->
    		<input type="hidden" name="re_or_num" id="re_or_num">
    		${orderList}
    	
			<h2> 리뷰내용</h2>
			<textarea name="re_contents" rows="2" cols="50"></textarea>
			<label for="rating">별점:</label>
			    <select name="re_star" id="rating">
			        <option value="5">5점</option>
			        <option value="4">4점</option>
			        <option value="3">3점</option>
			        <option value="2">2점</option>
			        <option value="1">1점</option>
			    </select>
			<button class="btn btn-primary" type="submit">등록</button>
		</form>
		${review}
		${review.re_mn_name}
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	/* $(document).ready(function () {
		console.log("제발요");
        $('.reviewcheck').click(function () {
        	var orderNumber = $(this).val();

            // hidden input에 주문번호 설정
            $('#re_or_num').val(orderNumber);
        });
    }); */
	var lastChecked;
	
	function sendDataToServer(checkbox) {
	       if (checkbox.checked) {
	    	   console.log("checked")
	       	  // 이전에 선택된 체크박스를 해제합니다.
	          /*  if (lastChecked && lastChecked !== checkbox) {
	               lastChecked.checked = false;
	           }
	           lastChecked = checkbox;
	       		
	           var row = checkbox.closest('tr'); // 현재 체크박스가 포함된 행 가져오기
	           // 행에서 각 셀의 데이터 가져오기
	           var or_num = row.cells[1].innerText;
	
	           // 서버로 데이터 전송 (Ajax를 사용하는 경우)
	           // 아래는 jQuery를 사용한 Ajax 호출 예시입니다.
	           obj = {
	        	   
	           }
	           $.ajax({
	        	   async : false
	               url: '/review/insert', // 실제 서버 엔드포인트로 수정해야 합니다.
	               type: 'POST',
	               data: JSON.stringify(obj),
	               success: function (response) {
	            	   
	                   console.log('Data successfully sent to server:', response);
	               },
	               error: function (error) {
	                   console.error('Error sending data to server:', error);
	               }
	           });
	       } else {
	            // 체크박스가 해제된 경우, lastChecked 변수를 초기화합니다.
	            lastChecked = null;
	       } */
	   }
	</script>
	
</body>
</html>