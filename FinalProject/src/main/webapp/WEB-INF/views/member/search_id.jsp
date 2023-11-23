<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<title>아이디 찾기</title>
</head>
<div class="bg-video">
		<video class="bg-video__content" autoplay muted loop>
			<source src="/resources/images/barista2.mp4" type="video/mp4" />
			<source src="img/video.webm" type="video/webm" />
		</video>
	</div>
<form commandName="member" id="createForm"
	action="${path}/member/search_result_id" method="post">
	<body>
		<div class="container mt-5">
			<div class="row justify-content-center" style="font-family: 'BM HANNA Pro', sans-serif;">
				<div class="col-md-6"
					style="height: 440px; border: 1px solid black; border-radius: 10px; background-color: rgba(255, 255, 255, 0.7) !important;">
					<h2 class="text-center mb-4">일반회원 아이디찾기</h2>
					<div class="form-group">
						<input type="text" class="form-control form-control-user"
							id="me_name" name="me_name" placeholder="가입된 계정의 이름을 입력하세요.">
					</div>
					<div class="form-group">
						<input type="email" class="form-control form-control-user"
							id="me_email" name="me_email" placeholder="가입된 계정의 이메일을 입력하세요.">
					</div>
					<a href="javascript:void(0)" onclick="fnSubmit(); return false;"
						class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;">
						아이디 찾기 </a>
					<hr>
					<a class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
						href="/member/search_pw">비밀번호 찾기 바로가기</a> <a
						class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
						href="/member/signup2">회원가입 바로가기</a> <a
						class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
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
			alert("이메일 형식에 맞게 입력해주세요.");
			return false;
		}

		if (confirm("아이디를 찾으시겠습니까?")) {

			$("#createForm").submit();

			return false;
		}
	}
</script>
</html>