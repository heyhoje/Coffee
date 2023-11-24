<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.bg-video {
	position: absolute;
	top: 0;
	left: 0;
	height: 1400px;
	width: 100%;
	z-index: -1;
}

.bg-video__content {
	height: 100%;
	width: 100%;
	object-fit: cover; //
	background-size: cover 와 비슷함.(HTML 요소 or 비디오와 작동)
}
</style>
</head>
<body>
	<div class="bg-video">
		<video class="bg-video__content" autoplay muted loop>
			<source src="/resources/images/barista2.mp4" type="video/mp4" />
			<source src="img/video.webm" type="video/webm" />
		</video>
	</div>
	<div class="col-sm-8" id="mypage-container" style="margin: 0 auto;">
		<br> <br>
		<div class="bg-white rounded shadow-sm container p-3"
			style="background-color: rgb(255 255 255/ 0.7) !important; border: 1px solid black; font-family: 'BM HANNA Pro', sans-serif;">
			<div class="manager-img-layout">
				<div
					style="justify-content: center; margin: 0 auto; width: 300px; height: 300px; text-align: center; margin-top: 50px; font-family: 'BM HANNA Pro', sans-serif; display: flex; margin-bottom: 10px;">
					<image class="image-menu"
						src="<c:url value='https://lh3.googleusercontent.com/p/AF1QipOdVf5kCB8mloB4lfb4d2_W1IuUOE4NXfN8vob_=s680-w680-h510'/>">
				</div>
				<h3 style="text-align: center;">${buser.bm_store_name}</h3>
			</div>
			<div class="row mb-3 form-row"></div>
			<div>
				<form action="/approvalcheck" method="POST">
					<input type="hidden" value="${buser.bm_id}">
					<button
						style="margin: 0 auto; display: block; margin-top: 10px; width: 200px; height: 50px; border: 1px solid black; border-radius: 5px; background-color: white;">승인상태확인하기</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>