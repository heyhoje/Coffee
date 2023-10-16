<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
<!-- Responsive-->
<link rel="stylesheet" href="<c:url value='/resources/css/responsive.css'/>">
<!-- fevicon -->
<link rel="icon" href="<c:url value='/resources/images/fevicon.png"'/> type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery.mCustomScrollbar.min.css'/>">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets -->
<link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/owl.theme.default.min.css'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      <!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<body>
	<!--header section start -->
	<div class="header_section">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="logo">
					<a href="resources/index.html"><img
						src="resources/images/로고.png"></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="resources/about.html">소개</a></li>
						<li class="nav-item"><a class="nav-link"
							href="resources/about.html">프로모션</a></li>
						<li class="nav-item"><a class="nav-link"
							href="resources/about.html">주문</a></li>
						<li class="nav-item"><a class="nav-link"
							href="resources/gallery.html">게시판</a></li>
						<li class="nav-item"><a class="nav-link"
							href="resources/services.html">갤러리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="resources/contact.html">채용정보</a></li>
						<li class="nav-item mr-5"><a class="nav-link"
							href="resources/contact.html">고객센터</a></li>


						<li class="form-group"><input type="submit" value="login"
							class="btn float-right login_btn" data-toggle="modal"
							data-target="#loginModal"></li>

						<!-- The Login Modal -->
						<div class="modal" id="loginModal" tabindex="-1" role="dialog"
							aria-labelledby="loginModalLabel" aria-hidden="true"
							id="loginPage">
							<!-- <button type="button" class="close" data-dismiss="modal" style="display: none">&times;</button> -->
							<div class="modal-container">
								<div class="d-flex justify-content-center h-100">
									<div class="card">
										<div class="card-header">
											<h3>Sign In</h3>
										</div>
										<div class="card-body">
											<form>
												<div class="input-group form-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="fas fa-user"></i></span>
													</div>
													<input type="text" class="form-control"
														placeholder="username">

												</div>
												<div class="input-group form-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="fas fa-key"></i></span>
													</div>
													<input type="password" class="form-control"
														placeholder="password">
												</div>
												<div class="row align-items-center remember">
													<input type="checkbox">Remember Me
												</div>
											   <span><i style="font-size: 50px; margin-left: 10%" class="fab fa-facebook-square"></i></span>
		                                       <span><i style="font-size: 50px; margin-left: 10%" class="fab fa-twitter-square"></i></span>
		                                       <span><i style="font-size: 50px; margin-left: 10%" class="fab fa-facebook-square"></i></span>
		                                       <span><i style="font-size: 50px; margin-left: 10%" class="fab fa-google-plus-square"></i></span>

												</a>
												<div class="form-group">
													<input style="margin: auto; display: block;" type="submit" value="login"
														class="btn login_btn">
												</div>
											</form>
										</div>
										<div class="card-footer" style="margin-top:20px">
											<div class="d-flex justify-content-center links">
												Don't have an account?<a
													href="<c:url value='/member/signup'/>">Sign Up</a>
											</div>
											<div class="d-flex justify-content-center">
												<a href="#">Forgot your password?</a>
											</div>


										</div>
									</div>
								</div>
							</div>
						</div>

						<li class="d-flex justify-content-end social_icon"></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>