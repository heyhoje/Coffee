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
					<a href="<c:url value='/'/>"><img
						src="<c:url value='/resources/images/로고.png'/>"></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link"
							href="resources/about.html" style="font-family: 'BM HANNA Pro', sans-serif;">소개</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/promotion/list'/>"style="font-family: 'BM HANNA Pro', sans-serif;">이벤트&프로모션</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/order/store'/>"style="font-family: 'BM HANNA Pro', sans-serif;">주문</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/meetingroom/home'/>"style="font-family: 'BM HANNA Pro', sans-serif;">예약</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/main/gallery'/>"style="font-family: 'BM HANNA Pro', sans-serif;">갤러리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/main/gallery'/>"style="font-family: 'BM HANNA Pro', sans-serif;">채용정보</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/main/gallery'/>"style="font-family: 'BM HANNA Pro', sans-serif;">고객센터</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/main/review'/>"style="font-family: 'BM HANNA Pro', sans-serif;">리뷰게시판</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/main/gallery'/>"style="font-family: 'BM HANNA Pro', sans-serif;">고객센터</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/admin/home'/>"style="font-family: 'BM HANNA Pro', sans-serif; margin-right:800px;">관리자 페이지</a></li>	
						<c:if test="${user == null && user2 == null}">
							<li class="form-group" id="loginButton"><input type="submit" 
								style="margin-right: 10px; background-color: floralwhite;"  value="회원 로그인" class="btn login_btn" data-toggle="modal"
								data-target="#loginModal"></li>
						</c:if>
						<c:if test="${user2 == null && user == null}">
							<li class="form-group" id="loginButton2"><input
								type="submit" style="background-color: floralwhite;"value="사업자 로그인"
								class="btn login2_btn" data-toggle="modal"
								data-target="#loginModal2"></li>
						</c:if>
						<c:if test="${user != null}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/member/mypage'/>" style="color: white; font-family: 'BM HANNA Pro', sans-serif; float: right;">${user.me_name}</a></li>
							<li class="form-group" id="logoutButton"><input
								style="margin-right: 10px;" type="submit" value="로그아웃"
								class="btn float-right logout_btn" data-toggle="modal"
								data-target="#logoutModal"></li>
						</c:if>

					</ul>
				</div>
			</nav>

		</div>
	</div>
</body>

</html>