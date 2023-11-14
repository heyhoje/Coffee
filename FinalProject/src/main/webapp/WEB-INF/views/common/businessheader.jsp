<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<!-- 폰트 -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/static/fonts/font.css'/>">
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Grand Coffee</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<!-- login css -->
<link rel="stylesheet" href="<c:url value='/resources/css/login.css'/>">
<!-- header css -->
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>">
<!-- Responsive-->
<link rel="stylesheet"
	href="<c:url value='/resources/css/responsive.css'/>">
<!-- fevicon -->
<link rel="icon"
	href="<c:url value='/resources/images/fevicon.png"'/> type=" image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery.mCustomScrollbar.min.css'/>">
<!-- Tweaks for older IEs-->

<!-- owl stylesheets -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/owl.carousel.min.css'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
	<!--header section start -->
	<div class="header_section">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg navbar">
				<div class="logo">
					<a href="<c:url value='/business/home'/>"><img
						src="<c:url value='/resources/images/로고.png'/>"></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							 href="<c:url value='/business/menu'/>"
							style="font-family: 'BM HANNA Pro', sans-serif;">메뉴관리</a></li>
						<li class="nav-item"><a class="nav-link"
							 href="<c:url value='/business/order'/>"
							style="font-family: 'BM HANNA Pro', sans-serif;">주문확인</a></li>
						<li class="nav-item"><a class="nav-link"  href="<c:url value='/business/store'/>"
							style="font-family: 'BM HANNA Pro', sans-serif;">매장관리</a></li>
						<li class="nav-item"><a class="nav-link"  href="<c:url value='/business/sales'/>"
							style="font-family: 'BM HANNA Pro', sans-serif;">판매정보조회</a></li>
						<li class="nav-item"><a class="nav-link"
							style="border-radius:10px; border: 1px solid white; margin-right: 8px; color: white; font-family: 'BM HANNA Pro', sans-serif; float: right;">${buser.bm_manager}님 어서오세요</a></li>
						<li class="form-group" id="logoutButton2"><input
							style="font-size:20px;" type="submit" value="로그아웃" class="btn float-right logout_btn"
							data-toggle="modal" data-target="#logoutModal2"></li>
					</ul>
				</div>
			</nav>

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
						<h4 style="font-size:30px; margin-top: 2%; text-align: center; color: white;">로그아웃하시겠습니까?</h4>
					</div>
					<div class="card-body" style="height: 300px">
						<form action="<c:url value='/member/logout2'/>" method="post">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<input
										style="font-size:20px; border-top-right-radius: 7%; border-bottom-right-radius: 7%; max-height: 44px; max-width: 100px; margin: auto; margin-left: 130%;"
										type="submit" value="로그아웃" class="btn logout_btn">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>