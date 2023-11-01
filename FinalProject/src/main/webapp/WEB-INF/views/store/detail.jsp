<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>메뉴상세 주문</title>
	<!-- style css -->
    <link rel="stylesheet" href="<c:url value='/resources/css/detail.css'/>">
<style>
	.container {
	border: 5px soild black; width: 1000px;
	display: flex; flex-direction: column; align-items: center;
	/* margin: 0 auto; 컨테이너에 넣는거 아님 */
	}
	
	.box {
	width: 50%; height: 400px; float: left;
	}
	.container::after {
	content: ''; display: block; clear: both;
	}
	
	
	hr {
	height: 2px; background-color: black; border: none;
	width: 400px; float: left;
	}
	
	.tab {
          display: inline-block;
          margin-right: 10px;
          cursor: pointer;
     }
     .active {
         font-weight: bold;
     }
</style>
</head>

<body>
	<h2 class="mt-4 mb-4" style="text-align: center;">메뉴상세</h2>
	<div class="container">
		<div class="image-box box">
			<image class="image-menu" src="<c:url value='/image/menu/${menu.image.im_name}'/>" width="400px" height="400px" alt="">
		</div>
		<div class="content-box box">
			<h4 class="menu-title">${menu.mn_name}</h4>
			<p class="menu-price">${menu.mn_price}</p>
			<hr><br><br>
			<p class="menu-content">${menu.mn_contents}</p>	
			
			
			<p><옵션></p>
		   <form action="/processHotIceOption" method="post">
		        <label><input type="radio" name="option" value="hot"> 핫</label>
		        <label><input type="radio" name="option" value="ice"> 아이스</label>
		        <input type="submit" value="선택">
		    </form>
		    <br>
			<a href="#" class="btn-outline-warning">구매하기</a> 
			<a href="#" class="btn-outline-warning">장바구니 담기</a>
		</div>
	</div>
	
	<div class="container">
		<!-- 서브타이틀 -->
		<div class="sub_title_wrap">
			<div class="sub_title_inner">
				<h2 class="mt-5">서브 타이틀</h2>
			</div>
		</div>
		<!-- 제품 상세보기 -->
		<div class="content">
			<div class="product_view_wrap">
				<div class="product_view_pic">
					<image class="image-menu" src="<c:url value='/image/menu/${menu.image.im_name}'/>" width="400px" height="400px" alt="">
				</div>
				<h4>${menu.mn_name}</h4>
			</div>
		</div>
		
	</div>
	===================================================================${menu }
	<div>
		<ul class="image-item">
			<li class="image-list">
				<a href="#" class="image-link">
					<image class="image-menu" src="<c:url value='/image/menu/${menu.image.im_name}'/>" width="200px" height="200px" alt="">
				</a>
			</li>
		</ul>
		<div>
			<h4 class="menu-title">${menu.mn_name}</h4>
			<p class="menu-price">${menu.mn_price}</p>
			<p class="menu-content">${menu.mn_contents}</p>	
			<button>구매하기</button> <button>장바구니 담기</button>
		</div>
	</div>

    </script>
</body>
</html>