<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/gallery.css'/>">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="/resources/css/jquery-fab-button.css" rel="stylesheet">
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-fab-button.js"></script>

</head>
<body>

	<!-- Gallery -->
	<div class="row" id="gallery">
		
		<div class="col-lg-4 col-md-12 mb-4 mb-lg-0" ">
			<img
				src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.18169-9/13713_454264621405951_7878769274095452567_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=7f8c78&_nc_ohc=k0XN4EZ00IQAX9wm4RO&_nc_ht=scontent-ssn1-1.xx&oh=00_AfD0eXI9ecm3I8uxllYSpHbhPaQ9sEtKOqVCcD22OYmCMA&oe=65610C7D"
				class="w-100 shadow-1-strong rounded mb-4 test" 
				alt="Boat on Calm Water"
				 />

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
		
		<div class="fixed-action-btn horizontal" style="bottom: 45px; right: 24px;">
  <a class="btn-floating btn-large red" href="<c:url value='/gallery/GalleryList'/>">
    <i class="large material-icons">mode_edit</i>
  </a>
  
</div>
		
		
</body>
</html>