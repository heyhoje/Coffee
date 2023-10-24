<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>매장별 메뉴</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- style css -->
      <link rel="stylesheet" href="<c:url value='/resources/css/menu.css'/>">
  <style>
  	<!-- 개별 css파일로 관리 -->
  </style>
</head>
<body>

<div class="container">
	<h2>음료</h2>
	<div class="btn-group box" style="width: px;">
		<a href="<c:url value='/store/menu/1/drinks'/>" class="btn btn-success">음료</a>
		<a href="<c:url value='/store/menu/1/food'/>" class="btn btn-success">푸드</a>
		<a href="<c:url value='/store/menu/1/md'/>" class="btn btn-success">상품</a>
	</div>
	<br>
	<div class="checkbox box" >
		<p>메뉴검색/분류보기</p>
		<c:forEach items="${list}" var="category">
			<input type=checkbox> ${category.mc_name}
		</c:forEach>
		${medium_category} // 서버가 얘를 보냈는지 확인
		
	</div>
</div>
  
</body>
</html>