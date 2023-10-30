<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 폰트 -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/static/fonts/font.css'/>">

<h1 style="text-align: center; font-family: 'BM HANNA Pro', sans-serif;">스타벅스</h1>
</head>
<body>
	<li class="form-group" id="loginButton"><input type="submit"
		style="margin-right: 10px" value="메뉴등록" class="btn login_btn"
		data-toggle="modal" data-target="#loginModal"></li>
		
	<!-- 메뉴등록 모달창 -->
	<div class="modal login-modal" id="loginModal" tabindex="-1"
		role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true"
		id="loginPage">
		<!-- <button type="button" class="close" data-dismiss="modal" style="display: none">&times;</button> -->
		<div class="modal-container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
						<h3 style="color: white; text-align: center;">메뉴등록</h3>
					</div>
					<div class="card-body">
						<form action="<c:url value='/member/login'/>" method="post">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" name="me_user_id" required class="form-control"
									placeholder="회원 아이디">

							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" name="me_pw" required
									class="form-control" placeholder="비밀번호">
							</div>
							<div class="row align-items-center remember">
								<label style="color: white;"> <input
									style="color: white; margin-left: 20px; margin-right: 5px;"
									type="checkbox"> 아이디 기억
								</label> <label style="color: white;"for="autoLogin"> <input
									style="color: white; margin-left: 15px; margin-right: 5px;"
									type="checkbox"> 자동 로그인
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
										style="max-height: 44px; max-width: 100px; margin: auto; float: right;"
										type="submit" value="로그인" class="btn login_btn">
								</div>
							</div>
							<div class="card-footer" style="margin-top: 120px;">
								<div style="color: white;"
									class="d-flex justify-content-center links">
									회원이 아니신가요?<a href="<c:url value='/member/signup2'/>">회원가입</a>
								</div>
								<div class="d-flex justify-content-center">
									<a href="<c:url value='/member/forgotpw'/>">아이디/비밀번호찾기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form class="form-horizontal" style="text-align: center;">
		<fieldset>

			<!-- Form Name -->
			<legend>메뉴 등록</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">메뉴이름</label>
				<div class="col-md-4">
					<input id="textinput" name="textinput" type="text"
						placeholder="메뉴이름" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">메뉴가격</label>
				<div class="col-md-4">
					<input id="textinput" name="textinput" type="text"
						placeholder="메뉴가격" class="form-control input-md">

				</div>
			</div>

			<!-- Select Multiple -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="selectmultiple">메뉴옵션</label>
				<div class="col-md-4">
					<select id="selectmultiple" name="selectmultiple"
						class="form-control" multiple="multiple">
						<option value="1">옵션1</option>
						<option value="2">옵션2</option>
						<option value="3">옵션3</option>
					</select>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">메뉴소개</label>
				<div class="col-md-4">
					<input id="textinput" name="textinput" type="text"
						placeholder="메뉴 소개" class="form-control input-md">

				</div>
			</div>

			<!-- File Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="filebutton">메뉴
					이미지</label>
				<div class="col-md-4">
					<input id="filebutton" name="filebutton" class="input-file"
						type="file">
				</div>
			</div>

		</fieldset>
	</form>
</body>
</html>