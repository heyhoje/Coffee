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
	<!-- style css -->
		<link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>">
	<style>
		<!-- 개별 css파일로 관리 -->
	.star-rating {
      unicode-bidi: bidi-override;
      direction: rtl;
      text-align: center;
    }

    .star-rating span {
      display: inline-block;
      position: relative;
      width: 1.1em;
    }

    .star-rating span:before {
      content: "\2605";
      position: absolute;
      color: #FFD700; /* 별의 색을 원하는 색으로 변경하세요 */
    }
	</style>
</head>
<body>
	
	<div>
<div class="container">
	<h2 class="mt-4">리뷰를 남겨주세요</h2>
	<p>이달의 신메뉴는 어땠나요?, 나만 아는 특별한 조합이 있다면 모두에게 공유해주세요!</p><br>
	<p>주문메뉴번호 필요없을것 같은디...</p>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>주문번호</th>
					<th>아이디</th>
					<th>주문한음료이름리스트?배열?</th>
					<th>리뷰내용</th>
					<th>별점</th>
					
					<th>주문메뉴번호 - 는 어디다 쓰게될까?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reList}" var="review" varStatus="reviewStatus">
					<tr>
						<td>${review.re_num}</td>
			            <td>${review.re_ol_num}</td>
			            <td>${review.re_user_id}</td>
			            <td>'음료리스트'</td>
			            <td>${review.re_contents}</td>
			            <td>${review.re_star}</td>
			            <td>${review.re_or_num}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${review}
</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		
	</script>
	
</body>
</html>