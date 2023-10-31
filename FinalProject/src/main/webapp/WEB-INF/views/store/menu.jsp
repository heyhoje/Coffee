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

<div class="menu-container">
	<!-- 브랜드 breadcrumb -->
	<ul class="breadcrumb">
		<!-- 'c:forEach'로 브랜드명 리스트 자동으로 나오게 하고, 브랜드 검색창으로 넘어가도록 링크 연결해주시면 됩니다! -->
		<!-- ${st_num} 는 브랜드 번호가 아닌 '매장 번호'여서 지도 마크마다 매장 데이터를 넣어야 할 것 입니다.  -->
		<c:forEach items="brands" var="brand">
			<li class="breadcrumb-item active">
				<a href="<c:url value='http://localhost:8080/finalproject/store/menu/${st_num}/1'/>">스타벅스</a>
			</li>
			<li class="breadcrumb-item">
				<a href="#">투썸플레이스</a>
			</li>
			<li class="breadcrumb-item"><a href="#">할리스</a></li>
			<li class="breadcrumb-item"><a href="#">탐앤탐스</a></li>
			<li class="breadcrumb-item"><a href="#">메가커피</a></li>
			<li class="breadcrumb-item"><a href="#">이디야</a></li>
			<li class="breadcrumb-item"><a href="#">컴포즈</a></li>
			<li class="breadcrumb-item"><a href="#">빽다방</a></li>
			<li class="breadcrumb-item"><a href="#">커피빈</a></li>
			
	  	</c:forEach>
	</ul>
</div>
	<!-- 대분류 이름 및 버튼박스 -->
	<c:if test="${ca_num == 1}">
		<h2 class="lc">음료</h2>
	</c:if>
	<c:if test="${ca_num == 2}">
		<h2 class="lc">푸드</h2>
	</c:if>
	<c:if test="${ca_num == 3}">
		<h2 class="lc">상품</h2>
	</c:if>
	<div class="btn-group-box">
		<div class="btn-group">
			<a href="<c:url value='/store/menu/${st_num}/1'/>" class="btn btn-success">음료</a>
			<a href="<c:url value='/store/menu/${st_num}/2'/>" class="btn btn-success">푸드</a>
			<a href="<c:url value='/store/menu/${st_num}/3'/>" class="btn btn-success">상품</a>
		</div>
	</div>
	<br>

	<div class="menu-group">
		<!-- 중분류 체크박스 -->
		<div class="checkbox-group" >
			<p>분류보기</p>
			<input type=checkbox id="allCheckbox" value="true" name="allCheckbox" <c:if test="${allCheckbox}">checked</c:if>> 전체
			<c:forEach items="${list}" var="category">
				<input type=checkbox class="medium" value="${category.mc_num}" <c:if test="${mc_nums.indexOf(category.mc_num) >= 0}">checked</c:if>> ${category.mc_name}				
			</c:forEach>

		</div>
		<!-- 메뉴데이터 및 이미지파일 -->
		<div class="image-container clearfix">
			<div class="image-main">
				<p>메뉴사진 / 메뉴이름 -> 메뉴설명 들어가는걸 어떻게 처리? / 장바구니 담는것도 기본클릭을 할지 버튼이나 체크박스가 따로 있을지?</p>
				
				<ul class="list-image">
					<c:forEach items="${menuList}" var="menu">
						<li class="item-image">
							<a href="#" class="link-image">
								<span class="box-image-menu">
									<image class="image-menu" src="<c:url value='/image/menu/${menu.image.im_ori_name}'/>" width="200px" height="200px" alt="">
								</span>
								<div class="hover">
									<p class="menu-title">${menu.mn_name}</p>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		${pm }
		<!-- 페이지네이션 -->
		<!-- Center-aligned -->
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
			    <li class="page-item">
			    	<a class="page-link" href="<c:url value='/store/menu/${st_num}/${ca_num}${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
		    	</li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			    <li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>" >
			    	<a class="page-link" href="<c:url value='/store/menu/${st_num}/${ca_num}${pm.cri.getUrl(i)}'/>">${i}</a>
		    	</li>
			</c:forEach>
		    <c:if test="${pm.next}">
			    <li class="page-item"><a class="page-link" href="<c:url value='/store/menu/${st_num}/${ca_num}${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a></li>
			</c:if>
		</ul>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		/*  ex) /store/menu/가게번호/대분류?mc_numList=3&mc_numList=6 
			1. click이벤트 연습
			2. click하면 check상태가 되있는지 안되있는지 판별
			3. value값 4를 가져올 수 있는지
		*/
		$(".medium").click(function(){
			reloadPage(false)
		});
		$("#allCheckbox").click(function(){
			console.log(1)
			var state = $(this).is(':checked')
			$(".medium").prop('checked', state);
			reloadPage(state);
			
		})
		function reloadPage(all){
			var urlString = window.location.href;
			var url = new URL(urlString);
			var searchParams = new URLSearchParams(url.search);
			
			searchParams.delete('mc_numList');
			searchParams.delete('allCheckbox');
			//alert(searchParams.toString())
			
			$(".medium").each(function(i){
				if($(this).is(':checked')){
					searchParams.append('mc_numList', $(this).val())
				}
				
			});
			//alert(searchParams.toString())
			if(all){
				searchParams.append('allCheckbox', true)
			location.href = url.pathname + '?' + searchParams.toString();
			//window.history.pushState({}, '', newUrl);
			}
	</script>
	
</body>
</html>