<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디와 비밀번호 찾기</title>
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<h2 class="text-center mb-4">아이디와 비밀번호 찾기</h2>
				<form>
					<div class="form-group">
						<label for="name">이름</label> <input type="name"
							class="form-control" id="name" placeholder="이름을 입력하세요">
					</div>
					<div class="form-group">
						<label for="email">이메일 주소</label> <input type="email"
							class="form-control" id="email" placeholder="이메일을 입력하세요">
					</div>
					<div class="form-group">
						<label for="verify">인증번호</label> <input type="verify"
							class="form-control" id="verify" placeholder="인증번호 6자 입력하세요">
					</div>
					<button type="submit" class="btn btn-primary">아이디 찾기</button>
					<button type="submit" class="btn btn-primary">비밀번호 찾기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>