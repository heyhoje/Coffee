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

	<!-- 대분류 이름 및 버튼박스 -->
	<c:forEach var="category" begin="1" end="3" varStatus="loop">
	    <c:if test="${loop.index == ca_num}">
	        <h2 class="lc">
	            <c:choose>
	                <c:when test="${category == 1}">음료</c:when>
	                <c:when test="${category == 2}">푸드</c:when>
	                <c:when test="${category == 3}">상품</c:when>
	            </c:choose>
	        </h2>
	    </c:if>
	</c:forEach>
	
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
		<div class="image-group clearfix">
			<div class="image-main">
				<ul class="list-image">
					<c:forEach items="${menuList}" var="menu">
						<li class="item-image">
							<a href="<c:url value='/store/detail/${menu.mn_num}'/>" class="link-image">
								<span class="box-image-menu">
									<image class="image-menu" src="<c:url value='/image/menu/${menu.image.im_name}'/>" width="200px" height="200px" alt="">
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
			console.log(1);
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
			}
			location.href = url.pathname + '?' + searchParams.toString();
			//window.history.pushState({}, '', newUrl);
		}
	</script>
	
</body>
</html>