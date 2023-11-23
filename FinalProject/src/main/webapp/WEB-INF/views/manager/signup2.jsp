<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- signup css -->
<link rel="stylesheet" href="<c:url value='/resources/css/signup.css'/>">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.8.1/css/all.css"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4efc38a6ad2e481f05e226066782e8c&libraries=services"></script>
<title>회원가입 페이지</title>
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
			style="background-color: rgba(255, 255, 255, 0.7) !important; font-family: 'BM HANNA Pro', sans-serif;">
			<h3 style="text-align: center;">사업자 회원가입</h3>
			<hr>
			<form id="infoView" action="/manager/signup2" method="POST"
				autocomplete="off" class="form-horizontal" role="form">
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_manager">사업자명</label>
					</div>
					<div class="col-md-9" style="display: flex; align-items: flex-end;">
						<input type="text" class="form-control" id="bm_manager"
							placeholder="사업자명을 입력하세요" name="bm_manager" required="">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_id">아이디</label>
					</div>
					<div class="col-md-9" style="display: flex; align-items: flex-end;">
						<input type="text" class="form-control" id="bm_id"
							placeholder="아이디를 입력하세요" name="bm_id" required="">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_num">사업자 번호</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="bm_num" name="bm_num"
							placeholder="사업자번호를 입력하세요" required="">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_store_name">매장명</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="bm_store_name"
							name="bm_store_name" placeholder="매장명을 입력하세요" required="">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_phone">매장 전화번호</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="bm_phone"
							name="bm_phone" placeholder="매장 전화번호를 입력하세요" required="">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_pw">비밀번호</label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="bm_pw"
							name="bm_pw" placeholder="비밀번호를 입력하세요" required="">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_pw2">비밀번호 확인</label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="bm_pw2"
							name="bm_pw2" placeholder="동일한 비밀번호를 입력하세요" required="">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="postcodify_search_button">우편번호</label>
					</div>
					<div class="col-md-3">
						<input type="text" name="bm_post" id="bm_post"
							class="form-control postcodify_postcode5" value="${address[0] }">
					</div>
					<div class="col-md-3">
						<button type="button" class="btn btn-primary"
							id="postcodify_search_button" name="postcodify_search_button"
							style="border: 1px solid black; background-color: floralwhite; color: black;">검색</button>
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address">도로명 주소</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_address"
							name="bm_address" id="address" value="${address[1] }">
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address2">상세주소</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_details"
							name="bm_address2" id="address2" placeholder="상세주소를 입력하세요"
							value="${address[2] }">
					</div>
				</div>
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit"
					style="border: 1px solid black; background-color: floralwhite; color: black;"
					onclick="fnSubmit(); return false;">회원가입</button>
				<a type="button" class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/member/signup2" class="btn btn-default">일반 회원가입 바로가기</a> <a
					type="button" class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/" class="btn btn-default">취소</a>
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4efc38a6ad2e481f05e226066782e8c&libraries=services"></script>
	<script>
		$(document).ready(function() {
			$("#login-tab").click(function() {

				// 모든 탭을 숨김
				$("#login").show();
				$("#register").hide();

			});
		});

		$(document).ready(function() {
			$("#register-tab").click(function() {

				// 모든 탭을 숨김
				$("#login").hide();
				$("#register").show();

			});
		});
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
		ps.keywordSearch('이태원 맛집', placesSearchCB);

		//키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('address1').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[0]);
				}

			}

		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(place.y, place.x)
			});
			document.getElementById('manager_latitude').value = marker
					.getPosition().getLat();
			document.getElementById('manager_longitude').value = marker
					.getPosition().getLng();
		}
	</script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<script>
		$(function() {
			$("#postcodify_search_button2").postcodifyPopUp();
		});
	</script>
</body>
</html>