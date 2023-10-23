<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.8.1/css/all.css"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>

<style>

/* Login v4 */
.signup_v4 .social-area {
	text-align: center;
	padding-top: 14px;
}

.signup_v4 .social-area .title {
	font-size: 20px;
	text-transform: uppercase;
	font-weight: 600;
	display: inline-block;
	color: #007bff;
	position: relative;
}

.signup_v4 .social-area .text {
	font-size: 17px;
	font-weight: 400;
	color: #143250;
}

.signup_v4 .social-area .title::before {
	position: absolute;
	content: '';
	width: 40px;
	height: 1px;
	background: rgba(0, 0, 0, .2);
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	left: 100%;
	margin-left: 7px;
}

.signup_v4 .social-area .title::after {
	position: absolute;
	content: '';
	width: 40px;
	height: 1px;
	background: rgba(0, 0, 0, .2);
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	right: 100%;
	margin-right: 7px;
}

.signup_v4 ul.social-links {
	padding: 0;
	margin: 0;
}

.signup_v4 .social-area .social-links li {
	display: inline-block;
}

.signup_v4 .social-area .social-links li a i {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	line-height: 50px;
	display: inline-block;
	color: #fff;
	margin: 0 5px;
	-webkit-box-shadow: 0 5px 10px rgb(0 0 0/ 15%);
	box-shadow: 0 5px 10px rgb(0 0 0/ 15%);
}

.signup_v4 .social-area .social-links li a i.fa-facebook-f {
	background: #0069f7;
}

.signup_v4 .social-area .social-links li a i.fa-google-plus-g {
	background: #d1062c;
}

.signup_v4 .nav-tabs .nav-link.active {
	background: #007bff;
}

.signup_v4 .nav-tabs .nav-link {
	background: #143250;
}

.signup_v4 .nav-tabs .nav-link {
	border: 0;
	margin: 0;
	padding: 10px 0;
	text-align: center;
	border-radius: 0;
	color: #fff;
}

.signup_v4 .nav-tabs li.nav-item {
	width: 50%;
}

.signup_v4 .card-body {
	padding: 0px;
	
}

.signup_v4 .card-body .tab-content {
	padding: 0 1.25rem 1.75em;
}
.card{
	height: 850px;
	width: 500px;
	margin: 0 auto;
	
}
</style>
</head>
<body>
	<div class="card signup_v4 mb-30">
		<div class="card-body">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation"><a
					class="nav-link active" id="login-tab" data-toggle="tab"
					href="#login" role="tab" aria-controls="login" aria-selected="true">멤버</a>
				</li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="register-tab" data-toggle="tab" href="#register" role="tab"
					aria-controls="register" aria-selected="false">매니저</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="login" role="tabpanel"
					aria-labelledby="login-tab">
					<h4 class="text-center mt-4 mb-4"
						style="text-transform: uppercase;">멤버 회원가입</h4>
<form>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">이름</label> <input type="text"
									class="form-control" id="inputEmail4"
									placeholder="이름을 입력하세요" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="inputName">아이디</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="아이디를 입력하세요" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="inputName">전화번호</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="전화번호를 입력하세요" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">이메일</label> <input
									type="email" class="form-control" id="inputEmail4"
									placeholder="이메일을 입력하세요" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="inputName">비밀번호</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="비밀번호를 입력하세요" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">비밀번호 확인</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="동일한 비밀번호를 입력하세요." required="">
							</div>

						</div>
					
						<div class="form-group form-row">
							<div class="col-md-12">
								<label class="custom-control custom-checkbox checkbox-lg">
									<input type="checkbox" class="custom-control-input"
									id="customCheck1">
									<div class="custom-control-label" for="customCheck1">
										I agree with <a href="#" target="_blank">terms and
											conditions</a>
									</div>
								</label>
							</div>
						</div>
						<hr class="mt-3 mb-4">
						<div class="col-12">
							<div
								class="d-flex flex-wrap justify-content-between align-items-center">
								<div class="custom-checkbox d-block">
									<a href="<c:url value='/'/>"
										class="nav-link-inline font-size-sm">이미 계정이 있으신가요? 로그인</a>
								</div>
								<button class="btn btn-primary mt-3 mt-sm-0" type="submit">회원가입</button>
							</div>
						</div>
					</form>
					
				</div>
				<div class="tab-pane fade" id="register" role="tabpanel"
					aria-labelledby="register-tab">
					<h4 class="text-center mt-4 mb-4"
						style="text-transform: uppercase;">매니저 회원가입</h4>
					<form>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">이름</label> <input type="text"
									class="form-control" id="inputEmail4"
									placeholder="이름을 입력하세요" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="inputName">아이디</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="아이디를 입력하세요" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">이메일</label> <input
									type="email" class="form-control" id="inputEmail4"
									placeholder="이메일을 입력하세요" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="inputName">비밀번호</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="비밀번호를 입력하세요" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">비밀번호 확인</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="동일한 비밀번호를 입력하세요" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">사업자 등록 번호</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="사업자 등록 번호를 입력하세요" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">매장 전화번호</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="매장 전화번호를 입력하세요" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">매장 주소</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="매장 주소를 입력하세요" required="">
							</div>

						</div>
						<div class="form-group form-row">
							<div class="col-md-12">
								<label class="custom-control custom-checkbox checkbox-lg">
									<input type="checkbox" class="custom-control-input"
									id="customCheck1">
									<div class="custom-control-label" for="customCheck1">
										I agree with <a href="#" target="_blank">terms and
											conditions</a>
									</div>
								</label>
							</div>
						</div>
						<hr class="mt-3 mb-4">
						<div class="col-12">
							<div
								class="d-flex flex-wrap justify-content-between align-items-center">
								<div class="custom-checkbox d-block">
									<a href="<c:url value='/'/>"
										class="nav-link-inline font-size-sm">이미 계정이 있으신가요? 로그인</a>
								</div>
								<button class="btn btn-primary mt-3 mt-sm-0" type="submit">회원가입</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>