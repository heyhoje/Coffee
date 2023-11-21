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
							<a href="<c:url value='/business/realCRUD/${menu.mn_num}'/>" class="link-image">
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
			    	<a class="page-link" href="<c:url value='/image/menu/${st_num}/${ca_num}${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
		    	</li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			    <li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>" >
			    	<a class="page-link" href="<c:url value='/image/menu/${st_num}/${ca_num}${pm.cri.getUrl(i)}'/>">${i}</a>
		    	</li>
			</c:forEach>
		    <c:if test="${pm.next}">
			    <li class="page-item"><a class="page-link" href="<c:url value='/image/menu/${st_num}/${ca_num}${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a></li>
			</c:if>
		</ul>
		<ul>
			<a class="page-link" onclick="makeMenu()" href="<c:url value='/business/realC/${st_num}'/>">메뉴 등록하기</a>
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
			}
			location.href = url.pathname + '?' + searchParams.toString();
			//window.history.pushState({}, '', newUrl);
		}
		
		function makeMenu() {
			var data = {
					st_num : ${st_num},
			};

			$.ajax({
		        type: "POST",
		        url: "/business/realC",
		        data: data,
		        success: function (response) {
		            // 서버 응답에 대한 처리가 필요하면 여기에서 수행
		            alert("메뉴 칸이 생성되었습니다 데이터를 입력해주세요");
		        },
		        error: function (error) {
		            // AJAX 요청 중에 발생한 오류를 처리
		            alert("아무튼 오류입니다.");
		        }
		    });
		}
		
		
	</script>
	
</body>
</html>