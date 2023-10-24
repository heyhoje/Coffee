<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/gallery.css'/>">
<style type="text/css">

.image-container {
    position: relative; /* 컨테이너를 상대 위치로 설정 */
    display: inline-block;
}

.image-container:hover .image-title {
    display: block;
}

.image-title {
    position: absolute; /* 제목을 절대 위치로 설정 */
    bottom: 0;
    left: 0;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.7); /* 투명한 검은색 배경 */
    color: white;
    padding: 5px;
    text-align: center;
    display: none; /* 초기에는 숨김 상태 */
}


</style>
</head>
<body>
	<!-- Gallery -->
	<div class="row">
		<div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(73).webp"
				class="w-100 shadow-1-strong rounded mb-4" 
				alt="Boat on Calm Water"
				 />
				<div class="image-title">게시글 제목 1</div>

			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Vertical/mountain1.webp"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Wintry Mountain Landscape" />
				<div class="image-title">게시글 제목 2</div>
		</div>

		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Vertical/mountain2.webp"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Mountains in the Clouds" /> <img
				src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(73).webp"
				class="w-100 shadow-1-strong rounded mb-4" alt="Boat on Calm Water" />
				<div class="image-title">게시글 제목 3</div>
		</div>

		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(18).webp"
				class="w-100 shadow-1-strong rounded mb-4" alt="Waves at Sea" />
				<div class="image-title">게시글 제목 4</div>

			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Vertical/mountain3.webp"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Yosemite National Park" />
				<div class="image-title">게시글 제목 5</div>
		</div>
	</div>	
	
</body>
</html>