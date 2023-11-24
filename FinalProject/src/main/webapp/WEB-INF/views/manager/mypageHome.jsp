<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
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
			style="background-color: rgba(255, 255, 255, 0.7) !important;">
			<form method="POST" action="updateMember.do"
				onsubmit="return memberUpdateValidate();" class="form-horizontal"
				role="form">
				<h3 id="Mypage-title">Manager Page</h3>
				<hr>
				<!-- 아이디 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="memberId">사업자명</label>
					</div>
					<div class="col-md-6" style="display: flex; align-items: flex-end;">
						<h5 id="id">${buser.bm_manager}</h5>
					</div>
				</div>

				<!-- 포인트 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="memberPoint">사업자번호</label>
					</div>
					<div class="col-md-6">
						<h5 id="point">${buser.bm_num}</h5>
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="memberEmail">매장명</label>
					</div>
					<div class="col-md-6">
						<h5 id="point">${buser.bm_store_name}</h5>
					</div>
				</div>

				<!-- 주소 -->
				<!-- 오픈소스 도로명 주소 API -->
				<!-- https://www.poesis.org/postcodify/ -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="postcodify_search_button">우편번호</label>
					</div>
					<div class="col-md-6">
						<h5 id="point">${buser.bm_post}</h5>
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address1">도로명 주소</label>
					</div>
					<div class="col-md-6">
						<h5 id="point">${buser.bm_address}</h5>
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address2">상세주소</label>
					</div>
					<div class="col-md-6">
						<h5 id="point">${buser.bm_address2}</h5>
					</div>
				</div>

				<hr class="mb-4">
				<a type="button" class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/manager/mypage">사업자정보 수정</a> <a type="button"
					class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/manager/pwchange">비밀번호 변경</a> <a type="button"
					class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/manager/deleteManager">회원탈퇴</a><a type="button"
					class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/business/home">홈으로</a>
			</form>
		</div>
	</div>
	<br>
	<br>
</body>
</html>