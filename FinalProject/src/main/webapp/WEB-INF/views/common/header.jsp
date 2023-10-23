<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
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
      <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
      <!-- style css -->
      <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
      <!-- Responsive-->
      <link rel="stylesheet" href="<c:url value='/resources/css/responsive.css'/>">
      <!-- fevicon -->
      <link rel="icon" href="<c:url value='/resources/images/fevicon.png"'/> type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="<c:url value='/resources/css/jquery.mCustomScrollbar.min.css'/>">
      <!-- Tweaks for older IEs-->
      
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css'/>">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
	  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
      <!--Fontawesome CDN-->
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
      <!-- 카카오 로그인 -->
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
      <!-- 네이버 로그인 -->
      <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
      <!-- 페이스북 로그인 -->
      <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=1588150011384568" nonce="SiOBIhLG"></script>
      <!-- 구글 로그인  -->
      <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
      <!-- 구글 로그인 OAuth 2.0 클라이언트 ID -->
      <meta name ="google-signin-client_id" content="149402920505-d1e55rs2dj0r689vqffl8nhqkaeair15.apps.googleusercontent.com">
      <style>
    
      </style>
</head>
<body>
	 <!--header section start -->
      <div class="header_section">
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar">
               <div class="logo"><a href=<c:url value='/'/>"><img src="<c:url value='/resources/images/로고.png'/>"></a></div>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item active">
                        <a class="nav-link" href="resources/about.html"><img src="<c:url value='/resources/images/소개.png'/>"></a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/main/promotion'/>"><img id="eventmenu" src="<c:url value='/resources/images/이벤트&뉴스.png'/>" style="margin-left:10px;"></a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/order/store'/>"><img src="<c:url value='/resources/images/주문.png'/>"></a>
                     </li>
                   
                     <li class="nav-item">
                        <a class="nav-link" href="resources/services.html"><img src="<c:url value='/resources/images/갤러리.png'/>"></a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="resources/contact.html"><img src="<c:url value='/resources/images/채용정보.png'/>"></a>
                     </li>
                      <li class="nav-item mr-5">
                        <a class="nav-link" href="resources/contact.html"><img src="<c:url value='/resources/images/고객센터.png'/>"></a>
                     </li>
                     
                     
                     <li class="form-group">
						<input type="submit" value="login" class="btn float-right login_btn" data-toggle="modal" data-target="#loginModal">
					 </li>
					 <li class="form-group">
						<input style="display: none;" type="submit" value="logout" class="btn float-right logout_btn" data-toggle="modal" data-target="#logoutModal">
					 </li>
					</ul>
				</div>
				</nav>

						</div>
               </div>
        
</body>


</html>