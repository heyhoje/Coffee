<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="mb-3 text-center row">
			<!-- 아이디 찾기 -->
			<div class="col-sm-6">
				<h5>아이디 찾기</h5>
				<form action="searchForm" action="searchID" method="post">
					<div class="form-group row">
						<label for="mem_name" class="col-sm-4 col-form-label">이름</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="이름">
						</div>					
					</div>
					<div class="form-group row">
						<label for="mem_email" class="col-sm-4 col-form-label">이메일</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="이메일">
						</div>					
					</div>
					<div class="form-group row">
						<div class="col-sm-12 text-center">
							<button type="submit" class="btn btn-dark" id="btnfindID">아이디 찾기</button>
							<button type="submit" class="btn btn-dark" id="btnfindPW">비밀번호 찾기</button>
						</div>					
					</div>
				</form>
			</div>
			<div class="col-sm-6">
				<h5>인증코드 발급</h5>
				<form id="loginForm" action="TemporaryPW" method="post">
					<div class="form-group row">
						<label for="mem_id" class="col-sm-4 col-form-label">아이디</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디">
						</div>
					</div>
					<div class="form-group row">
						<label for="mem_email" class="col-sm-4 col-form-label">이메일</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="이메일">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12 text-center">
							<button type="submit" class="btn btn-dark" id="btntempPW">인증코드 발급</button>
							<button type="submit" class="btn btn-dark" id="btnlogin">로그인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>