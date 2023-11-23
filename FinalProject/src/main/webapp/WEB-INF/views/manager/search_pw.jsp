<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
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
<title>비밀번호 찾기</title>
</head>
<div class="bg-video">
	<video class="bg-video__content" autoplay muted loop>
		<source src="/resources/images/barista2.mp4" type="video/mp4" />
		<source src="img/video.webm" type="video/webm" />
	</video>
</div>
<form commandName="manager" id="createForm"
	action="${path}/manager/search_result_pw" method="post">
	<input type="hidden" id="bm_id_yn" name="bm_id_yn" value="N" />
	<body>
		<div class="container mt-5">
			<div class="row justify-content-center" style="font-family: 'BM HANNA Pro', sans-serif;">
				<div class="col-md-6"
					style="border: 1px solid black; border-radius: 10px; background-color: rgba(255, 255, 255, 0.7) !important;">
					<h2 class="text-center mb-4">사업자회원 비밀번호찾기</h2>
					<div class="form-group">
						<input type="text" class="form-control form-control-user"
							id="bm_id" name="bm_id" placeholder="가입된 계정의 아이디를 입력하세요.">
					</div>
					<div class="form-group">
						<input type="text" class="form-control form-control-user"
							id="bm_manager" name="bm_manager"
							placeholder="가입된 계정의 사업자명을 입력하세요.">
					</div>
					<div class="form-group">
						<input type="text" class="form-control form-control-user"
							id="bm_num" name="bm_num" placeholder="가입된 계정의 사업자번호을 입력하세요.">
					</div>
					<br> <input type="text" id="Confirm" name="Confirm"
						style="display: none" value=""> <a
						href="javascript:void(0)" onclick="fnSubmit(); return false;"
						class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;">
						비밀번호 찾기</a>
					<hr>
					<a class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
						href="/manager/search_id">아이디 찾기 바로가기</a> <a
						class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
						href="/member/signup2">회원가입 바로가기</a> <a
						class="btn btn-primary btn-user btn-block"
						style="margin-bottom: 15px; border: 1px solid black; background-color: floralwhite; color: black;"
						href="/">로그인 바로가기</a>
				</div>
			</div>
		</div>
	</body>
</form>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<script>
<!-- 비밀번호 찾기 -->
	var path = "${pageContext.request.contextPath }";

	$(document).ready(function() {
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
	});

	function fnSubmit() {

		var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

		if ($("#bm_id").val() == null || $("#bm_id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#bm_id").focus();

			return false;
		}

		if ($("#bm_manager").val() == null || $("#bm_manager").val() == "") {
			alert("사업자명을 입력해주세요.");
			$("#bm_manager").focus();

			return false;
		}

		if ($("#bm_num").val() == null || $("#bm_num").val() == "") {
			alert("사업자번호를 입력해주세요.");
			$("#bm_num").focus();

			return false;
		}

		if (confirm("비밀번호를 찾으시겠습니까?")) {

			$("#createForm").submit();

			return false;
		}
	}
</script>
</html>