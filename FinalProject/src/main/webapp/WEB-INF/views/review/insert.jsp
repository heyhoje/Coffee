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
	.review-container{
		width: 1000px;
		margin: 0 auto; /* 이 부분이 컨테이너를 가운데 정렬합니다. */
	 }
	</style>
</head>
<body>	
	<div class="review-container">
		<form action="<c:url value='/review/insert'/>" method="post">
			<div class="orderList-box">
				<h2 class="mt-4">${user.me_user_id}님의 주문내역</h2>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th></th>
							<th>아이디</th>
							<th>주문번호</th>
							<th>주문날짜</th>
							<th>주문한음료</th>
							<th>선택한옵션</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="order" varStatus="orderStatus">
				            <tr>
				            	<td><input type= "radio" name="reviewCheck"  class="re_or_num" 
				            			value="${order.or_num}"></td>
				            	<td>${order.or_user_id}</td>
				                <td>${order.or_num}</td>
				                <td>${order.or_time}</td>
				                <td>${order.or_drinks}</td>
				                <td>${order.or_selectOption}</td>
				            </tr>
				        </c:forEach>
					</tbody>
				</table>
			</div>
	   		<%-- ${orderList} --%>
    		<div class="review-insert-box">
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
				<button  class="btn btn-primary btn-review" type="button">등록</button>
			</div>
		</form>
	</div>

	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
	 $(document).ready(function () { 
        $('.btn-review').click(function () { // 라디오를 눌렀을때가 아니라, '등록버튼'을 눌렀을때 이벤트가 발생해야한다.  
        	// 체크된 라디오박스의 값을 가져온다. (리뷰내용/별점 가져온다. 그다음에 ajax로 할 걸 생각한다.) 
        	// 가져와서 콘솔창이 나오면 다시 설명... 
			// $('[name=reviewcheck]').not(this).prop('checked', false);
        	
        	// 2. re_or_num 예외처리하고, 체크되었을때의 value를 let re_or_num에 담는다. 
        	let re_or_num = $('[name=reviewCheck]:checked').val();
        	if(re_or_num == undefined){
        		alert('리뷰를 남길 주문내역을 선택해주세요')
        		return;
        	}
        	// 1. 각각의 변수들의 value값을 묶은 obj 작성
        	// 내 방식에서 $([name]).value();를 쓴 이유는, 
        	// menu-detail은 그 값 그대로 화면에 보여주고 있지만,
        	// review-insert에서는 모두 입력 받거나 데이터 값이 아닌 다른 방식으로 정보를 받아오고 있기 때문에 
        	// 그것이 담고있는 value를 데려와야 해서
        	let obj = {
        			re_contents : $('[name=re_contents]').val(),
					re_star : $('[name=re_star]').val(),
					re_or_num : $('[name=reviewCheck]:checked').val()
        	} // 1-2. 콘솔 찍어보기(확인)
        	console.log(obj)
        	
        	// 3. 그리고 ajax..
        	$.ajax({
				async : false, //비동기 : true(비동기), false(동기)
				url : '<c:url value="/review/insert"/>', 
				type : 'post', 
				data : JSON.stringify(obj),
				contentType : "application/json; charset=utf-8",
				dataType : "json", 
				success : function (data){
					if(data.res){
						alert("리뷰등록에 성공했습니다! 감사합니다")
					} else {
						alert("리뷰등록에 실패했습니다. 다시 남겨주실래요?")
					}
				}, 
				error : function(jqXHR, textStatus, errorThrown){
					alert("안된다 짜샤")
				}
			});
        	//   console.log($('input[name="reviewCheck"]:checked').val());
        	/* var c = $('input[name="reviewCheck"]').is(':checked'); // 체크박스 체크 여부(checked)
        	var cv = $('input[name="reviewCheck"]:checked').val(); // 라디오 버튼 체크된 값(checked value)
        	console.log(cv) */
        	/* $("input[name='reviewCheck']").change(function(){
        		var test = $("input[name='reviewCheck']:checked").val();
        		alert(test);
        	}); */
        	/* var selectElement = document.getElementsByName("reviewCheck")[0];	
        	selectElement.addEventListener("change", function(){
        		var selectedValue = this.value;
        		console.log(selectedValue);
        	}) */
        	/* if((this).prop('checked')){
        		let check = $('[name=reviewcheck]').(':checked').val();
        		console.log("check");
        	} */
        	
        	// 아직 리뷰등록 전, re_or_num은 없다. 라디오박스의 value = or_num
        	
        		// let or_num = ${'[name=reviewcheck]'}.(':checked').val();
            	// if ($(this).is(':checked')) {
                /* let re_or_num = $(this).val();
                let re_contents = $('[name=re_contents]').val(); // 리뷰 내용 가져오기
				let re_star = $('[name=re_star]').val(); // 별점 가져오기
				
                $.ajax({
					async : false, //비동기 : true(비동기), false(동기)
					url : '<c:url value="/review/insert"/>', 
					type : post, 
					data : JSON.stringify({
							re_contents : re_contents,
							re_star : re_star,
							re_or_num : re_or_num
					}),
					contentType : "application/json; charset=utf-8",
					dataType : "json", 
					success : function (data){
						if(data.res){
							alert("리뷰등록에 성공했습니다! 감사합니다")
						} else {
							alert("리뷰등록에 실패했습니다. 다시 남겨주실래요?")
						}
					}, 
					error : function(jqXHR, textStatus, errorThrown){
				
					}
				});
            } */
        });
    });
	
	</script>
	
</body>
</html>