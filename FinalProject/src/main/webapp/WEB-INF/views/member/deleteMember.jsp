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
</head>
<body>
	<form action="/member/delete" method="post" id="deleteForm"
		name="deleteForm">
		<input type="hidden" id="me_user_id" name="me_user_id"
			value="${user.me_user_id}">
		<h3 id="Mypage-title">회원 탈퇴</h3>
		<hr style="width: 900px;">
		<div class="bg-white rounded shadow-sm container p-3"
			id="mypage-container" style="margin: 0 auto; width: 900px;">
			<h3 class="Mypage-title" style="text-align: center;">회원탈퇴를 하려면
				비밀번호를 입력해주세요.</h3>
			<br>
			<div class="row mb-3 form-row">
				<div class="col-md-3" style="margin-top: 10px;">
					<label for="me_pw">비밀번호</label>
				</div>
				<div class="col-md-6">
					<input style="width: 653px;" class="form-control" type="password"
						id="me_pw" name="me_pw" placeholder="비밀번호">
				</div>
			</div>

			<div class="row mb-3 form-row">
				<div class="col-md-3">
					<label for="me_pw1">비밀번호 확인</label>
				</div>
				<div class="col-md-6">
					<input style="width: 653px;" class="form-control" type="password"
						id="me_pw1" name="me_pw1" placeholder="비밀번호 확인">
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
				href="/member/mypageHome" class="btn btn-default">취소</a>
		</div>
	</form>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#delete").on("click", function() {
			if ($("#me_pw").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#me_pw").focus();
				return false
			}
			if ($("#me_pw1").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#me_pw1").focus();
				return false
			}
			if ($("#me_pw").val() != $("#me_pw1").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#me_pw").focus();
				return false;
			}
			$.ajax({
				url : "/member/pwCheck",
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