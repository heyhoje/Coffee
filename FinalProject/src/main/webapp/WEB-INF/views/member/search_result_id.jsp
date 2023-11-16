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
<title>아이디 찾기</title>
</head>
	<body>
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-md-6"
					style="height: 400px; border: 1px solid black; border-radius: 10px;">
					<div class="text-center">
						<h1 style="margin-top: 10px" class="h4 text-gray-900 mb-2">아이디 확인</h1>
						<br>
						<c:choose>
							<c:when test="${empty member}">
								<p class="mb-4">조회결과가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<p class="mb-4">${member.me_user_id}</p>
							</c:otherwise>
						</c:choose>
						<br>
					</div>
					<hr>
					<a class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
						href="/member/search_id">아이디 찾기</a>
						<a class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
						href="/member/search_pw">비밀번호 찾기</a>
					<a class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
						href="/member/signup2">회원가입</a> <a
						class="btn btn-primary btn-user btn-block"
						style="border: 1px solid black; background-color: floralwhite; color: black;"
						href="/">로그인</a>
				</div>
			</div>
		</div>
	</body>
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

	});
</script>
</html>