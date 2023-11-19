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
<title>비밀번호 찾기</title>
</head>
<form commandName="member" id="createForm"
	action="${path}/member/search_result_pw" method="post">
	<input type="hidden" id="me_user_id_yn" name="me_user_id_yn" value="N" />
	<body>
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-md-6"
					style="border: 1px solid black; border-radius: 10px;">
					<h2 class="text-center mb-4">사업자회원 비밀번호찾기</h2>
					<div class="form-group">
						<input type="text" class="form-control form-control-user"
							id="me_user_id" name="me_user_id"
							placeholder="가입된 계정의 아이디를 입력하세요.">
					</div>
					<div class="form-group">
						<input type="text" class="form-control form-control-user"
							id="me_name" name="me_name" placeholder="가입된 계정의 이름을 입력하세요.">
					</div>
					<div class="form-group">
						<input type="email" class="form-control form-control-user"
							name="mail" id="mail" placeholder="가입된 계정의 이메일을 입력하세요.">
						<button type="button" id="sendBtn" name="sendBtn" class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
							onclick="sendNumber()">인증번호 받기</button>
					</div>
					<div class="form-group" id="mail_number" name="mail_number" style="display: none">
						<input class="form-control form-control-user" type="text" name="number" id="number" placeholder="잠시만기다려주세요. 알림창이 뜨면 전송된 인증번호를 입력하세요.">
						<button type="button" name="confirmBtn" id="confirmBtn" class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
							onclick="confirmNumber()">이메일 인증</button>
					</div>
					<br> <input type="text" id="Confirm" name="Confirm"
						style="display: none" value="">
						
						<a href="javascript:void(0)" onclick="fnSubmit(); return false;"
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

<script type="text/javascript">
<!-- 이메일 인증  -->
	function sendNumber() {
		$("#mail_number").css("display", "block");
				alert("잠시만 기다려주세요. 곧 인증번호가 발송됩니다.");
		$.ajax({
			url : "/mail",
			type : "post",
			dataType : "json",
			data : {
				"mail" : $("#mail").val()
			},
			success : function(data) {
				alert("인증번호 발송");
				$("#Confirm").attr("value", data);
			}
		});
	}

	function confirmNumber() {
		var number1 = $("#number").val();
		var number2 = $("#Confirm").val();

		if (number1 == number2) {
			alert("인증되었습니다.");
		} else {
			alert("번호가 다릅니다.");
		}
	}
</script>

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

		if ($("#me_user_id").val() == null || $("#me_user_id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#me_user_id").focus();

			return false;
		}

		if ($("#me_name").val() == null || $("#me_name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#me_name").focus();

			return false;
		}

		if ($("#mail").val() == null || $("#mail").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#mail").focus();

			return false;
		}

		if (!email_rule.test($("#mail").val())) {
			alert("이메일 형식에 맞게 입력해주세요.");
			return false;
		}
		
		if ($("#Confirm").val() == null || $("#Confirm").val() === "") {
	        alert("이메일 인증이 필요합니다.");
	        return false;
	    }

		if (confirm("비밀번호를 찾으시겠습니까?")) {

			$("#createForm").submit();

			return false;
		}
	}
</script>
</html>