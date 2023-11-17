<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>리뷰 게시판</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>">
	<!-- style css -->
	<style>
		/* 개별 css파일로 관리 */
		
	.star-rating {
      unicode-bidi: bidi-override;
      direction: rtl;
      text-align: center;
    }

    .star-rating span {
      display: inline-block;
      position: relative;
      width: 1.1em;
      
	  vertical-align: middle; /* 추가된 부분 */
	  line-height: 1; /* 추가된 부분 */
    }
    
    .star-rating .empty-star:before {
        position: absolute;
        content: "\2606"; /* 별 모양이 비어있는 유니코드 값 */
        color: #FFD700; /* 빈 별의 색을 원하는 색으로 변경하세요 */
    }

    .star-rating .filled-star:before {
        position: absolute;
        content: "\2605";
        color: #FFD700; /* 별의 색을 원하는 색으로 변경하세요 */
    }
	</style>
</head>
<body>
	
	<div>
<div class="container">
	<h2 class="mt-4">리뷰를 남겨주세요</h2>
	<p>* 이달의 신메뉴는 어땠나요?, 나만 아는 특별한 조합이 있다면 모두에게 공유해주세요!</p><br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>주문번호</th>
					<th>아이디</th>
					<th>매장이름</th>
					<th>주문한음료</th>
					<th>리뷰내용</th>
					<th class="col-2">별점</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rvList}" var="review" varStatus="reviewStatus">
					<tr>
						<td>${review.re_num}</td>
			            <td>${review.re_ol_num}</td>
			            <td>${review.re_user_id}</td>
			            <td>${review.re_store_name}</td>
			            <td>${review.re_mn_name}</td>
			            <td>${review.re_contents}</td>
			            <td class="star-rating">
						    <!-- Empty stars -->
						    <c:forEach begin="${review.re_star + 1}" end="5" varStatus="emptyStarStatus">
						        <span class="empty-star"></span>
						    </c:forEach>
						    <!-- Filled stars -->
							<c:forEach begin="1" end="${review.re_star}" varStatus="starStatus">
								<span class="filled-star"></span>
						    </c:forEach>
						</td>
			            
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${review}
		${review.re_mn_name}
</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		
	</script>
	
</body>
</html>