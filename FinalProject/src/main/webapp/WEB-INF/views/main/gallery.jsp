<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/gallery.css'/>">

</head>
<body>
	<div class="main">
		<div class="main_bar">
			<a href="<c:url value='/gallery/coffee'/>">
			<img class="image" alt="coffee" src="https://cdn-icons-png.flaticon.com/512/5194/5194358.png">
			</a>
			<br>
			커피
		</div>
		<div class="main_bar">
			<a href="<c:url value='/gallery/noncoffee'/>">
			<img class="image" alt="frappe" src="https://cdn-icons-png.flaticon.com/512/4721/4721225.png">
			</a>
			<br>
			프라페&스무디
		</div>
		<div class="main_bar">
			<a href="<c:url value='/gallery/beverages'/>">
			<img class="image" alt="beverages" src="https://cdn-icons-png.flaticon.com/512/5848/5848602.png">
			<br>
			</a>
			주스&에이드&티
		</div>
		<div class="main_bar">
			<a href="<c:url value='/gallery/food'/>">
			<img class="image" alt="food" src="https://cdn-icons-png.flaticon.com/512/6584/6584248.png">
			<br>
			</a>
			푸드
		</div>
		<div class="main_bar">
			<a href="<c:url value='/gallery/cafestore'/>">
			<img class="image" alt="MD" src="https://cdn-icons-png.flaticon.com/512/6213/6213065.png">
			<br>
			</a>
			MD상품
		</div>
		<div class="main_bar">
			<a href="<c:url value='/gallery/cafestore'/>">
			<img class="image" alt="store" src="https://cdn-icons-png.flaticon.com/512/1892/1892627.png">
			<br>
			</a>
			카페사진
		</div>
	</div>
	<!-- Gallery -->
	<div class="row" id="gallery">
		<div class="col-lg-4 col-md-12 mb-4 mb-lg-0" ">
			<img
				src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.18169-9/13713_454264621405951_7878769274095452567_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=7f8c78&_nc_ohc=k0XN4EZ00IQAX9wm4RO&_nc_ht=scontent-ssn1-1.xx&oh=00_AfD0eXI9ecm3I8uxllYSpHbhPaQ9sEtKOqVCcD22OYmCMA&oe=65610C7D"
				class="w-100 shadow-1-strong rounded mb-4 test" 
				alt="Boat on Calm Water"
				 />
			<div class="front_works"></div>

			<img
				src="https://i.pinimg.com/550x/26/cf/80/26cf803cbc4f48ae672c919fa1434d83.jpg"
				class="w-100 shadow-1-strong rounded mb-4 test"
				alt="Wintry Mountain Landscape" />
		</div>

		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://png.pngtree.com/background/20210716/original/pngtree-delicious-fruit-sandwich-bread-coffee-picture-image_1329594.jpg"
				class="w-100 shadow-1-strong rounded mb-4 test"
				alt="Mountains in the Clouds" /> <img
				src="https://en.idei.club/uploads/posts/2023-06/thumbs/1686277249_en-idei-club-p-vertical-cafe-dizain-krasivo-19.jpg"
				class="w-100 shadow-1-strong rounded mb-4 test" alt="Boat on Calm Water" />
		</div>

		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://png.pngtree.com/thumb_back/fw800/background/20230927/pngtree-coffee-cup-in-a-coffee-maker-image_13356727.jpg"
				class="w-100 shadow-1-strong rounded mb-4 test" alt="Waves at Sea" />

			<img
				src="https://png.pngtree.com/background/20211216/original/pngtree-winter-coffee-warm-day-synthetic-background-picture-image_1551632.jpg"
				class="w-100 shadow-1-strong rounded mb-4 test"
				alt="Yosemite National Park" />
		</div>
	</div>	
	
</body>
</html>