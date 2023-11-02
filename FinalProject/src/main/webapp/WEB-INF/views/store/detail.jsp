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
	h2 {
	margin: 10px 0; text-align: center;
	}
	.container {
	border: 5px soild black; 
	max-width: 1000px; margin: 0 auto;
	display: flex; flex-direction: row; flex-wrap: wrap;
	}
	
	.image-box, .content-box {
	    flex: 1; 
	    box-sizing: border-box;
	    padding: 20px; 
	}
	.cocntent-box {height: 400;}
	
	@media (max-width: 600px) {
	    .box {
	        width: 100%;
	    }
	}
	/* .box {
	width: 50%; height: 400px; float: left;
	}
	.container::after {
	content: ''; display: block; clear: both; */
	}
	hr {
	height: 2px; background-color: black; border: none;
	width: 350px; float: left;
	}
	
	.btn-outline-warning{
	border-radius: 30px; font-size: 15px; padding: 10px;
	}
	
</style>
</head>

<body>
	<h2 class="menudetail">메뉴상세</h2>
	<div class="container">
		<div class="image-box box">
			<image class="image-menu" src="<c:url value='/image/menu/${menu.image.im_name}'/>" width="400px" height="400px" alt="">
		</div>
		<div class="content-box box">
			<h4 class="menu-title">${menu.mn_name}</h4>
			<p class="menu-price">${menu.mn_price} 원</p>
			<hr><br><br>
			<p class="menu-content">${menu.mn_contents}</p>	
			
			<h4><옵션></h4>
			<form action="/HotIceOption" method="post">
		        <label><input type="radio" name="option" value="hot" checked> 핫</label>
		        <label><input type="radio" name="option" value="ice"> 아이스</label>
		        <input type="submit" value="선택">
			</form>
			
			<form action="/SizeOption" method="post">
		        <label><input type="radio" name="option" value="small" checked> 스몰(기본)</label>
		        <label><input type="radio" name="option" value="medium"> 미디움</label>
		        <label><input type="radio" name="option" value="large"> 라지</label>
		        <input type="submit" value="선택">
			</form>
			
			<form action="/ShotOption" method="post">
		        <label><input type="radio" name="option" value="zeroShot"> 0샷</label>
		        <label><input type="radio" name="option" value="oneShot" checked> 1샷(기본)</label>
		        <label><input type="radio" name="option" value="twoShot"> 2샷</label>
		        <input type="submit" value="선택">
			</form>
		    <br> 
			<a href="<c:url value='/order/bag'/>" class="btn-outline-warning">장바구니 담기</a>
		</div>
	</div>
	
</body>
</html>