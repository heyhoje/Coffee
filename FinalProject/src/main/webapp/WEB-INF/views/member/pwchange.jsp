<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
</head>
<body>
	<form action="/member/pwUpdate" method="post" id="pwUpdateForm"
		name="pwUpdateForm">
		<input type="hidden" id="me_user_id" name="me_user_id" value="${user.me_user_id}">
		<h3 id="Mypage-title">비밀번호 변경</h3>
		<hr style="width: 900px;">
		<div class="bg-white rounded shadow-sm container p-3"
			id="mypage-container" style="margin: 0 auto; width: 900px;">
			<input type="hidden" id="memberId" name="memberId"
				value="${login.me_user_id}">
			<div class="row mb-3 form-row">
				<div class="col-md-3" style="margin-top: 10px;">
					<label for="newpw">현재 비밀번호</label>
				</div>
				<div class="col-md-6">
					<input style="width: 653px;" type="email" class="form-control"
						id="me_pw" name="me_pw" value="" placeholder="현재 비밀번호">
				</div>
			</div>


			<div class="row mb-3 form-row">
				<div class="col-md-3">
					<label for="newpw1">새 비밀번호</label>
				</div>
				<div class="col-md-6">
					<input style="width: 653px;" type="email" class="form-control"
						id="me_pw1" name="me_pw1" value="" placeholder="새 비밀번호">
				</div>
			</div>
			<div class="row mb-3 form-row">
				<div class="col-md-3">
					<label for="newpw2">새 비밀번호 확인</label>
				</div>
				<div class="col-md-6">
					<input style="width: 653px;" type="email" class="form-control"
						id="me_pw2" name="me_pw2" value="" placeholder="새 비밀번호 확인">
				</div>
				<br>
				<div class="col-md-6"></div>
				<hr>
				<button type="button" id="pwUpdate" name="pwUpdate"
					class="btn btn-primary btn-lg btn-block"
					style="margin-bottom: 10px; width: 100%; border: 1px solid black; background-color: floralwhite; color: black;">비밀번호
					변경</button>
				<a type="button" class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/member/mypageHome" class="btn btn-default">취소</a>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#pwUpdate").on("click", function() {
				if ($("#me_pw").val() == "") {
					alert("현재 비밀번호를 입력해주세요");
					$("#me_pw").focus();
					return false;
				}
				if ($("#me_pw1").val() == "") {
					alert("변경할 비밀번호를 입력해주세요");
					$("#me_pw1").focus();
					return false;
				}
				if ($("#me_pw2").val() == "") {
					alert("변경할 비밀번호를 다시 입력해주세요");
					$("#me_pw2").focus();
					return false;
				}
				if ($("#me_pw1").val() != $("#me_pw2").val()) {
					alert("변경 비밀번호가 일치하지 않습니다.");
					$("#me_pw2").focus();
				}				
				// 여기서부터 수정
				$.ajax({
					url : "/member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#pwUpdateForm").serializeArray(),
					success : function(data) {
						if (data == 0) {
							alert("비밀번호가 틀렸습니다.");
							return;
						} else {
							if (confirm("변경하시겠습니까?")) {
								$("#pwUpdateForm").submit();
							}
						}
					}
				})
			});
		})
	</script>

</body>
</html>