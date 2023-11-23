
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- style css -->
<link rel="stylesheet" href="<c:url value='/resources/css/login.css'/>">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<!-- 회원 로그인 모달창 -->
	<div class="modal login-modal" id="loginModal" tabindex="-1"
		role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true"
		id="loginPage">
		<!-- <button type="button" class="close" data-dismiss="modal" style="display: none">&times;</button> -->
		<div class="modal-container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
						<h3 style="color: white;">회원 로그인</h3>
					</div>
					<div class="card-body">
						<form action="<c:url value='/member/login'/>"
							style="font-size: 18px;" method="post">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" name="me_user_id"
									style="font-family: 'inherit';" required class="form-control"
									placeholder="회원 아이디">

							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" style="font-family: 'inherit';"
									name="me_pw" required class="form-control" placeholder="비밀번호">
							</div>
							<div class="row align-items-center remember">
								<label style="color: white;"> <input
									style="color: white; margin-left: 20px; margin-right: 5px;"
									type="checkbox" name="idSaveCheck"> 아이디 기억
								</label> <label style="color: white;"> <input
									style="color: white; margin-left: 15px; margin-right: 5px;"
									type="checkbox" name="autoLogin"> 자동 로그인
								</label>
							</div>
							<div class="form-group">
								<div class="flashing column">
									<figure>
										<img id="naverIdLogin_loginButton" href="javascript:void(0)"
											style="margin-top: 2px; max-width: 38px; max-height: 38px; float: left;"
											src="<c:url value='/resources/images/navericon.png'/>">
									</figure>
								</div>
								<div class="flashing column">
									<figure>
										<img onclick="kakaoLogin();" href="javascript:void(0)"
											style="margin-top: 2px; max-width: 38px; max-height: 38px; float: left; margin-left: 5%;"
											src="<c:url value='/resources/images/kakaoicon.png'/>">
									</figure>
								</div>
								<div class="flashing column">
									<figure>
										<img id="GgCustomLogin" href="javascript:void(0)"
											style="margin-top: 2px; max-width: 38px; max-height: 38px; float: left; margin-left: 5%;"
											src="<c:url value='/resources/images/googleicon.png'/>">
									</figure>
								</div>
								<div>
									<input
										style="max-height: 44px; max-width: 100px; margin: auto; float: right; background-color: #F0F0F0;"
										type="submit" value="로그인" class="btn login_btn">
								</div>
							</div>
							<div class="card-footer" style="margin-top: 70px;">
								<div class="d-flex justify-content-center links" id="signupbtn">
									<a id="fotgotid-button" href="<c:url value='/member/signup2'/>">
										회원가입</a>
								</div>
								<div class="d-flex justify-content-center" id="Id">
									<a id="fotgotid-button"
										href="<c:url value='/member/search_id'/>">아이디찾기</a>
								</div>
								<div class="d-flex justify-content-center" id="pw">
									<a id="fotgotpw-button"
										href="<c:url value='/member/search_pw'/>">비밀번호찾기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 사업자로그인 모달창 -->
	<div class="modal login-modal" id="loginModal2" tabindex="-1"
		role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true"
		id="loginPage2">
		<!-- <button type="button" class="close" data-dismiss="modal" style="display: none">&times;</button> -->
		<div class="modal-container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
						<h3 style="color: white;">사업자 로그인</h3>
					</div>
					<div class="card-body">
						<form action="<c:url value='/member/login2'/>"
							style="font-size: 18px;" method="post">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" name="bm_id" style="font-family: 'inherit';"
									required class="form-control" placeholder="사업자 아이디">

							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" style="font-family: 'inherit';"
									name="bm_pw" required class="form-control" placeholder="비밀번호">
							</div>
							<div class="row align-items-center remember">
								<label style="color: white;"> <input
									style="color: white; margin-left: 20px; margin-right: 5px;"
									type="checkbox" name="idSaveCheck"> 아이디 기억
								</label> <label style="color: white;"> <input
									style="color: white; margin-left: 15px; margin-right: 5px;"
									type="checkbox" name="autoLogin"> 자동 로그인
								</label>
							</div>
							<div class="form-group">
								<div class="flashing column">
									<figure>
										<img onclick="kakaoLogin();" href="javascript:void(0)"
											style="margin-top: 2px; max-width: 38px; max-height: 38px; float: left; margin-left: 5%;"
											src="<c:url value='/resources/images/kakaoicon.png'/>">
									</figure>
								</div>
								<div>
									<input
										style="max-height: 44px; max-width: 100px; margin: auto; float: right; background-color: #F0F0F0;"
										type="submit" value="로그인" class="btn login_btn">
								</div>
							</div>
							<div class="card-footer" style="margin-top: 70px;">
								<div style="color: white;"
									class="d-flex justify-content-center links">
									<a href="<c:url value='/member/signup2'/>">회원가입</a>
								</div>
								<div class="d-flex justify-content-center">
									<a href="<c:url value='/manager/search_id'/>">아이디찾기</a>
								</div>
								<div class="d-flex justify-content-center">
									<a href="<c:url value='/manager/search_pw'/>">비밀번호찾기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원 로그아웃 모달창 -->
	<div class="modal login-modal" id="logoutModal" tabindex="-1"
		role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true"
		id="logoutPage">
		<!-- <button type="button" class="close" data-dismiss="modal" style="display: none">&times;</button> -->
		<div class="modal-container">
			<div class="d-flex justify-content-center h-100">
				<div class="card" style="height: 150px">
					<div class="card-header">
						<h1
							style="font-size: 25px; margin-top: 2%; text-align: center; color: white;">로그아웃하시겠습니까?</h1>
					</div>
					<div class="card-body" style="height: 300px">
						<form action="<c:url value='/member/logout'/>" method="post">
							<div class="input-group form-group">
								<div class="input-group-prepend"
									style="width: 100%; justify-content: center; display: flex;">
									<input
										style="border-top-right-radius: 7%; border-bottom-right-radius: 7%; max-height: 44px; max-width: 100px; margin: auto;"
										type="submit" value="로그아웃" class="btn logout_btn">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 사업자 로그아웃 모달창 -->
	<div class="modal login-modal" id="logoutModal2" tabindex="-1"
		role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true"
		id="logoutPage">
		<!-- <button type="button" class="close" data-dismiss="modal" style="display: none">&times;</button> -->
		<div class="modal-container">
			<div class="d-flex justify-content-center h-100">
				<div class="card" style="height: 150px">
					<div class="card-header">
						<h1 style="margin-top: 2%; text-align: center; color: white;">로그아웃하시겠습니까?</h1>
					</div>
					<div class="card-body" style="height: 300px">
						<form action="<c:url value='/member/logout2'/>" method="post">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<input
										style="border-top-right-radius: 7%; border-bottom-right-radius: 7%; max-height: 44px; max-width: 100px; margin: auto; margin-left: 144%;"
										type="submit" value="로그아웃" class="btn logout_btn">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
	<script>
	<!-- 카카오 로그인 -->
		function saveToDos(token) { //item을 localStorage에 저장합니다. 
			typeof (Storage) !== 'undefined'
					&& sessionStorage.setItem('AccessKEY', JSON
							.stringify(token));
		};
		Kakao.init('a5737697fa5f3dd128397ef34179de7a'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth
					.login({
						success : function(response) {
							Kakao.API
									.request({
										url : '/v2/user/me',
										success : function(response) {
											console.log(response);
											// 로그인 정보를 서버로 보내는 Ajax 요청 추가
											$
													.ajax({
														url : '/kakaoLoginCallback', // 서버의 콜백 URL로 변경
														type : 'POST',
														data : {
															kakaoId : response.id,
															email : response.kakao_account.email,
															name : response.kakao_account.name,
															phone_number : response.kakao_account.phone_number,
														},
														success : function(data) {
															alert("로그인이 완료되었습니다.");
															window.location.href = '/';
														},
														error : function(xhr,
																status, error) {
															console
																	.error(error);
														}
													});
										},
										fail : function(error) {
											console.log(error);
										},
									});
						},
						fail : function(error) {
							console.log(error);
						},
					});
		}
		//카카오로그아웃  
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
	</script>

	<script type="text/javascript">
		/* 회원아이디 저장 기능 */
		//일반 회원 아이디 입력했을 때
		$('[name=me_user_id]').keyup(function() {
			console.log('change')
			if ($('[name=idSaveCheck]').is(':checked')) {
				let id = $('[name=me_user_id]').val();
				deleteCookie('idSave');
				setCookie("idSave", id, 7);
			}
		})

		//아이디 저장 클릭
		$('[name=idSaveCheck]').click(function() {
			console.log('check')
			if ($(this).is(':checked')) {
				//쿠키에 현재 아이디 추가
				let id = $('[name=me_user_id]').val();
				setCookie("idSave", id, 7);
			} else {
				//쿠키 삭제
				deleteCookie('idSave')
			}
		})
		loadIdSaveCheck();
		//아이디 저장 쿠키가 있으면 아이디 저장을 체크해주고 쿠기에 있는 아이디를 아이디창에 저장
		function loadIdSaveCheck() {
			let id = getCookie('idSave');
			if (id != null) {
				$('[name=me_user_id]').val(id)
				$('[name=idSaveCheck]').prop('checked', true);
			}
		}
		//쿠키이름, 값, 만료시간(일단위)를 주면 쿠키를 생성해주는 함수
		function setCookie(cookieName, cookieValue, expirationDays) {
			var d = new Date();
			d.setTime(d.getTime() + (expirationDays * 24 * 60 * 60 * 1000));
			var expires = "expires=" + d.toUTCString();
			document.cookie = cookieName + "=" + cookieValue + ";" + expires
					+ ";path=/";
		}

		// 쿠키를 삭제하는 함수
		function deleteCookie(cookieName) {
			// 현재 날짜 이전의 날짜로 설정하여 쿠키를 만료시킴
			document.cookie = cookieName
					+ "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
		}
		function getCookie(cookieName) {
			var name = cookieName + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var cookieArray = decodedCookie.split(';');

			for (var i = 0; i < cookieArray.length; i++) {
				var cookie = cookieArray[i].trim();
				if (cookie.indexOf(name) == 0) {
					return cookie.substring(name.length, cookie.length);
				}
			}

			// 해당하는 쿠키가 없을 경우 null 반환
			return null;
		}
	</script>

</body>
</html>