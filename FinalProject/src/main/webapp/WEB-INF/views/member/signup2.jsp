<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- signup css -->
<link rel="stylesheet" href="<c:url value='/resources/css/signup.css'/>">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.8.1/css/all.css"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>

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
					<form action="<c:url value='/member/signup2'/>" method="post">
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="me_name">이름</label> <input type="text"
									class="form-control" id="inputEmail4" placeholder="이름을 입력하세요"
									name="me_name" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="me_oi_id">아이디</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="아이디를 입력하세요" name="me_oi_id" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="oi_phone">전화번호</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="전화번호를 입력하세요" name="oi_phone" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="me_email">이메일</label> <input type="email"
									class="form-control" id="inputEmail4" placeholder="이메일을 입력하세요"
									name="me_email" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="me_pw">비밀번호</label> <input type="password"
									class="form-control" id="inputPassword4"
									placeholder="비밀번호를 입력하세요" name="me_pw" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="me_pw2">비밀번호 확인</label> <input type="password"
									class="form-control" id="inputPassword4"
									placeholder="동일한 비밀번호를 입력하세요." name="me_pw2" required="">
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
					<form action="<c:url value='/member/signup2'/>" method="post">
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_manager">담당자</label> <input type="text"
									class="form-control" id="inputEmail4" placeholder="성함을 입력하세요"
									name="bm_manager" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="bm_id">아이디</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="아이디를 입력하세요" name="bm_id" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_email">이메일</label> <input type="email"
									class="form-control" id="inputEmail4" placeholder="이메일을 입력하세요"
									name="bm_email" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="bm_pw">비밀번호</label> <input type="password"
									class="form-control" id="inputPassword4"
									placeholder="비밀번호를 입력하세요" name="bm_pw" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_pw2">비밀번호 확인</label> <input type="password"
									class="form-control" id="inputPassword4"
									placeholder="동일한 비밀번호를 입력하세요" name="bm_pw2" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_num">사업자 등록 번호</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="사업자 등록 번호를 입력하세요" name="bm_num" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_phone">매장 전화번호</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="매장 전화번호를 입력하세요" name="bm_phone" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_address">매장 주소</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="매장 주소를 입력하세요" name="bm_address" required="">
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