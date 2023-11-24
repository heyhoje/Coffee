<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.form-check {
	width: 15%;
	margin-right: 5px;
}
</style>
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
	<br>
	<br>
		<div class="bg-white rounded shadow-sm container p-3"
			style="background-color: rgba(255, 255, 255, 0.7) !important;">
			<form id="infoView" action="/member/infoUpdate" method="POST"
				autocomplete="off" class="form-horizontal" role="form">
				<h3 id="Mypage-title">회원정보 수정</h3>
				<hr>

				<!-- 아이디 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="me_user_id">아이디</label>
					</div>
					<div class="col-md-9" style="display: flex; align-items: flex-end;">
						<input type="text" name="me_user_id" class="form-control"
							value="${user.me_user_id}" id="me_user_id" readonly>
					</div>
				</div>

				<!-- 포인트 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="memberPoint">포인트</label>
					</div>
					<div class="col-md-9">
						<input type="text" id="me_point" name="me_point"
							class="form-control" value="${user.me_point}" id="me_point"
							readonly>
					</div>
				</div>

				<!-- 이름 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="me_name">이름</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="me_name"
							name="me_name" value="${user.me_name}">
					</div>
				</div>


				<!-- 이메일 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="me_email">Email</label>
					</div>
					<div class="col-md-9">
						<input type="email" class="form-control" id="me_email"
							name="me_email" value="${user.me_email}">
					</div>
				</div>
				<br>

				<!-- 주소 -->
				<!-- 오픈소스 도로명 주소 API -->
				<!-- https://www.poesis.org/postcodify/ -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="postcodify_search_button">우편번호</label>
					</div>
					<div class="col-md-3">
						<input type="text" name="me_post" id="me_post"
							class="form-control postcodify_postcode5" value="${user.me_post}">
					</div>
					<div class="col-md-3">
						<button type="button" class="btn btn-primary"
							id="postcodify_search_button" name="postcodify_search_button"
							style="border: 1px solid black; background-color: floralwhite; color: black;">검색</button>
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address1">도로명 주소</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_address"
							name="me_address" id="me_address" value="${user.me_address}">
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address2">상세주소</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_details"
							name="me_address2" id="me_address2" value="${user.me_address2}">
					</div>
				</div>


				<!-- 관심분야 -->
				<hr class="mb-4">
				<div class="row">
					<div class="col-md-3">
						<label>관심 브랜드</label>
					</div>

					<div class="col-md-9 custom-control custom-checkbox">
						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="twosome" value="투썸플레이스"> <label
								class="form-check-label custom-control-label" for="twosome">투썸플레이스</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="ANGELINUS" value="엔제리너스"> <label
								class="form-check-label custom-control-label" for="ANGELINUS">엔제리너스</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox" name="memberInterest" id="hollyscoffee"
								value="할리스커피" class="form-check-input custom-control-input">
							<label class="form-check-label custom-control-label"
								for="hollyscoffee">할리스커피</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="starbucks" value="스타벅스"> <label
								class="form-check-label custom-control-label" for="starbucks">스타벅스</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="megacoffee" value="메가커피"> <label
								class="form-check-label custom-control-label" for="megacoffee">메가커피</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="Caffe Bene" value="카페베네"> <label
								class="form-check-label custom-control-label" for="Caffe Bene">카페베네</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="paik's coffee" value="빽다방"> <label
								class="form-check-label custom-control-label"
								for="paik's coffee">빽다방</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="ediya" value="이디야"> <label
								class="form-check-label custom-control-label" for="ediya">이디야</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="compose" value="컴포즈"> <label
								class="form-check-label custom-control-label" for="compose">컴포즈</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="coffeebean" value="커피빈"> <label
								class="form-check-label custom-control-label" for="coffeebean">커피빈</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="PaulBassett" value="폴바셋"> <label
								class="form-check-label custom-control-label" for="PaulBassett">폴바셋</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="tomntom" value="탐탐"> <label
								class="form-check-label custom-control-label" for="tomntom">탐탐</label>
						</div>

						<div class="form-check form-check-inline">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="etc" value="기타"> <label
								class="form-check-label custom-control-label" for="etc">기타</label>
						</div>

						<div class="form-check form-check-inline" style="width: 150px;">
							<input type="checkbox"
								class="form-check-input custom-control-input"
								name="memberInterest" id="not" value="관심 브랜드가 없습니다."> <label
								class="form-check-label custom-control-label" for="not">관심
								브랜드가 없습니다.</label>
						</div>

					</div>
				</div>

				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit"
					style="border: 1px solid black; background-color: floralwhite; color: black;"
					onclick="fnSubmit(); return false;">회원정보 수정</button>
				<a type="button" class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/member/mypageHome" class="btn btn-default">취소</a>
			</form>
		</div>
	</div>
	<br>
	<br>
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<script>
		function fnSubmit() {
			var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

			if ($("#me_name").val() == null || $("#me_name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#me_name").focus();
				return false;
			}

			if ($("#me_email").val() == null || $("#me_email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#me_email").focus();
				return false;
			}

			if (!email_rule.test($("#me_email").val())) {
				alert("이메일을 형식에 맞게 입력해주세요. ex) 1234@naver.com");
				$("#me_email").focus();
				return false;
			}

			if ($("#me_post").val() == null || $("#me_post").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#me_post").focus();
				return false;
			}

			if ($("#me_address").val() == null || $("#me_address").val() == "") {
				alert("도로명 주소를 입력해주세요.");
				$("#me_address").focus();
				return false;
			}

			if ($("#me_address2").val() == null
					|| $("#me_address2").val() == "") {
				alert("상세주소를 입력해주세요.");
				$("#me_address2").focus();
				return false;
			}

			var selectedInterests = [];
			$("input[name='memberInterest']:checked").each(function() {
				selectedInterests.push($(this).val());
			});

			// 기존 관심사를 Hidden input에서 제거
			$("input[name='memberInterests']").remove();

			// 새로운 관심사를 Hidden input에 추가
			$('#infoView').append(
					'<input type="hidden" name="memberInterests" value="'
							+ selectedInterests.join(',') + '">');

			// 선택된 관심사 확인 (콘솔 출력)
			console.log(selectedInterests);

			if (confirm("수정하시겠습니까?")) {
				$('#infoView').submit();
				return false;
			}
		}
	</script>
</body>
</html>