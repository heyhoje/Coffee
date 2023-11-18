<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
  
	<head>
	<!-- 폰트 -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/static/fonts/font.css'/>">
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
		<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
		<!-- style css -->
		<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
		<!-- Responsive-->
		<link rel="stylesheet" href="/resources/css/responsive.css">
		<!-- fevicon -->
		<link rel="icon" href="/resources/images/favicon.png" type="image/gif" />
		<!-- Scrollbar Custom CSS -->
		<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.min.css">
		<!-- Tweaks for older IEs-->
		<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
		<!-- owl stylesheets --> 
		<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
		<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
	</head>
	
	<body>
	<!--header section start -->
	<div class="header_section">
		<div class="container-fluid" style="padding-left:0; padding-right:0;">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"style="background-color: #212529!important;">
		<div class="logo"><a href="/"><img src="/resources/images/로고.png"></a></div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"aria-expanded="false" aria-label="Toggle navigation" style="background-color:white;">
		<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value='/main/Introduce'/>" style="font-family: 'BM HANNA Pro', sans-serif; color:white;">소개</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/order/store'/>"style="font-family: 'BM HANNA Pro', sans-serif; color:white;">주문</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/meetingroom/home'/>"style="font-family: 'BM HANNA Pro', sans-serif; color:white;">예약</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/main/review'/>"style="font-family: 'BM HANNA Pro', sans-serif; color:white;">리뷰</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/main/gallery'/>"style="font-family: 'BM HANNA Pro', sans-serif; color:white;">갤러리</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/promotion/list'/>"style="font-family: 'BM HANNA Pro', sans-serif; color:white;">이벤트</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/admin/home'/>"style="font-family: 'BM HANNA Pro', sans-serif; color:white;">관리자 </a></li>	
				<c:if test="${user == null && user2 == null}">
					<li class="form-group" id="loginButton" style="justify-content:center; display:flex;"><input type="submit" 
						style="margin-right: 10px; background-color: floralwhite; margin-left:10px; justify-content:center; display:flex;  font-family: 'BM HANNA Pro', sans-serif;"  value="회원 로그인" class="btn login_btn" data-toggle="modal"
						data-target="#loginModal"></li>
				</c:if>
				<c:if test="${user2 == null && user == null}">
					<li class="form-group" id="loginButton2" style="justify-content:center; display:flex;"><input
						type="submit" style="background-color: floralwhite;font-family: 'BM HANNA Pro', sans-serif;" value="사업자 로그인"
						class="btn login2_btn" data-toggle="modal"
						data-target="#loginModal2"></li>
				</c:if>
				<c:if test="${user != null}">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/member/mypage'/>" style="color: khaki; font-family: 'BM HANNA Pro', sans-serif; float: right;">${user.me_name}</a></li>
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
	<!-- header section end -->
