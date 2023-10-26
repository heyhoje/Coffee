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
			<!-- 전체를 forEach 밖에 빼야될까? (이유:음료/푸드/상품 으로 바뀔때 전체는 그대로 있음 => 그럼 다른 속성값에도 전체를 또 쓰면되지 않는가? ㅇㅇ) 
				전체를 forEach 안에 넣어야 한다! (이유:아래에 메뉴사진과 이름이 이미지리스트로 들어오면, 또 분류따라 사진이 남고 안남고가 설정되야한다.  
				=> 아닌가 그러한 이유로 밖에 넣어야 하나.... 아닌가 mc_name(바뀌는건 얘밖에 없음)에 따라 보이고 안보이고로 하면되나?(????뭔소리지?????)
				=> 그럼 음.... 되려나..... 이미지에 테이블명/테이블번호는 있어도 mc_name에 대한 정보는 없지 않나...... 어렵네~~~~~  -->
			<input type=checkbox> 전체
			<input type=checkbox> 신메뉴
			<c:forEach items="${list}" var="category">
				<input type=checkbox> ${category.mc_name}				
			</c:forEach>
			
		</div>
		<div class="image-container clearfix">
			<div class="image-main float-left">
				<p>메뉴사진 / 메뉴이름</p>
				<c:forEach items="${menuList}" var="menu">
					<ul class="list-image clearfix">
						<li class="item-image float-left">
							<a href="#" class="link-image">
								<span class="box-image-menu">
									<image class="image-menu" src="#" width="100px" height="150px" alt=""> 
								</span>
								<div class="hover">
									<p class="menu-title">${menu.mn_name}</p>
								</div>
							</a>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
		${menuList}
	</div>
	
	<script>
		
	</script>
	
</body>
</html>