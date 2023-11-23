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
	<form action="/manager/delete" method="post" id="deleteForm"
		name="deleteForm">
		<input type="hidden" id="bm_id" name="bm_id" value="${buser.bm_id}">
		<br> <br>
		<div class="bg-white rounded shadow-sm container p-3"
			id="mypage-container"
			style="margin: 0 auto; width: 900px; background-color: rgba(255, 255, 255, 0.7) !important;">
			<h3 id="Mypage-title">회원 탈퇴</h3>
			<hr>
			<br>
			<div class="row mb-3 form-row">
				<div class="col-md-3" style="margin-top: 10px;">
					<label for="bm_pw">비밀번호</label>
				</div>
				<div class="col-md-6">
					<input style="width: 653px;" class="form-control" type="password"
						id="bm_pw" name="bm_pw" placeholder="비밀번호">
				</div>
			</div>

			<div class="row mb-3 form-row">
				<div class="col-md-3">
					<label for="bm_pw1">비밀번호 확인</label>
				</div>
				<div class="col-md-6">
					<input style="width: 653px;" class="form-control" type="password"
						id="bm_pw1" name="bm_pw1" placeholder="비밀번호 확인">
				</div>
			</div>

			<br>
			<div class="col-md-6"></div>
			<hr>

			<button type="button" id="delete" name="delete"
				class="btn btn-primary btn-lg btn-block"
				style="margin-bottom: 10px; width: 100%; border: 1px solid black; background-color: floralwhite; color: black;">회원탈퇴</button>

			<a type="button" class="btn btn-primary btn-lg btn-block"
				style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
				href="/manager/mypageHome" class="btn btn-default">취소</a>
		</div>
	</form>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#delete").on("click", function() {
			if ($("#bm_pw").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#bm_pw").focus();
				return false
			}
			if ($("#bm_pw1").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#bm_pw1").focus();
				return false
			}
			if ($("#bm_pw").val() != $("#bm_pw1").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#bm_pw").focus();
				return false;
			}
			$.ajax({
				url : "/manager/pwCheck",
				type : "POST",
				dataType : "json",
				data : $("#deleteForm").serializeArray(),
				success : function(data) {
					if (data == 0) {
						alert("비밀번호를 확인해주세요.");
						return;
					} else {
						if (confirm("탈퇴하시겠습니까?")) {
							$("#deleteForm").submit();
						}
					}
				}
			})
		});
	})
</script>
</html>