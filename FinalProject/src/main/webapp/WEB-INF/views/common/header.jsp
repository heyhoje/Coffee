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
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
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
</head>
<body>
	 <!--header section start -->
      <div class="header_section">
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar">
               <div class="logo"><a href="resources/index.html"><img src="<c:url value='/resources/images/로고.png'/>"></a></div>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item active">
                        <a class="nav-link" href="resources/about.html">소개</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/main/promotion'/>">이벤트&뉴스</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/order/bag'/>">주문</a>
                     </li>
                   
                     <li class="nav-item">
                        <a class="nav-link" href="resources/services.html">갤러리</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="resources/contact.html">채용정보</a>
                     </li>
                      <li class="nav-item mr-5">
                        <a class="nav-link" href="resources/contact.html">고객센터</a>
                     </li>
                     
                     
                     <li class="form-group">
						<input type="submit" value="login" class="btn float-right login_btn" data-toggle="modal" data-target="#loginModal">
					 </li>
					 <li class="form-group">
						<input style="display: none;" type="submit" value="logout" class="btn float-right logout_btn" data-toggle="modal" data-target="#logoutModal">
					 </li>
					
					  <!-- The Login Modal -->
						<div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true" id="loginPage">
						<!-- <button type="button" class="close" data-dismiss="modal" style="display: none">&times;</button> -->
						    <div class="modal-container">
								<div class="d-flex justify-content-center h-100">
									<div class="card">
										<div class="card-header">
											<h3 style="color: white;">Sign In</h3>
										</div>
										<div class="card-body">
											<form>
												<div class="input-group form-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i class="fas fa-user"></i></span>
													</div>
													<input type="text" class="form-control" placeholder="username">
													
												</div>
												<div class="input-group form-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i class="fas fa-key"></i></span>
													</div>
													<input type="password" class="form-control" placeholder="password">
												</div>
												<div class="row align-items-center remember">
													<input style="margin-left: 20px;" type="checkbox">Remember Me
												</div>
												<div class="form-group">
													<div class="flashing column"><figure><img id="naverIdLogin_loginButton" href="javascript:void(0)" style="max-width: 38px; max-height: 38px; float: left;" src="<c:url value='/resources/images/navericon.png'/>"></figure></div>
													<div class="flashing column"><figure><img onclick="kakaoLogin();" href="javascript:void(0)" style="max-width: 38px; max-height: 38px; float: left; margin-left: 5%;" src="<c:url value='/resources/images/kakaoicon.png'/>"></figure></div>
													<div class="flashing column"><figure><img id="GgCustomLogin" href="javascript:void(0)" style="max-width: 38px; max-height: 38px; float: left;margin-left: 5%;" src="<c:url value='/resources/images/googleicon.png'/>"></figure></div>
													<div><input style="max-height: 44px; margin:auto; float: right;" type="submit" value="Login" class="btn login_btn"></div>
												</div>
													<div class="card-footer" style="margin-top: 120px;">
														<div style="color: white;" class="d-flex justify-content-center links">
															Don't have an account?<a href="<c:url value='/member/signup'/>">Sign Up</a>
														</div>
														<div class="d-flex justify-content-center">
														<a href="#">Forgot your password?</a>
													</div>
												</div>
											</form>
										</div>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
               </div>
         </div>
</body>

<script>
function showLogoutButton() {
    document.getElementById("login").style.display = "none";
    document.getElementById("logout").style.display = "block";
    
	document.getElementById("login").addEventListener("click", function() {
    // 로그인 프로세스를 완료한 후
    // 로그인 버튼을 숨기고 로그아웃 버튼을 표시
    showLogoutButton();
	});
	
	document.getElementById("logout").addEventListener("click", function() {
	    // 로그아웃 프로세스를 완료한 후
	    // 로그인 버튼을 표시하고 로그아웃 버튼을 숨김
	    document.getElementById("login").style.display = "block";
	    document.getElementById("logout").style.display = "none";
	});
}

</script>

<script>
<!-- 구글 로그인 -->
//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyBDS7A5qt0B981B6py3ZB6RhGdk_aHOO3U', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>

<script>
<!-- 페이스북 로그인 -->
//기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
function statusChangeCallback(res){
	statusChangeCallback(response);
}

function fnFbCustomLogin(){
	FB.login(function(response) {
		if (response.status === 'connected') {
			FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
				console.log(r);
			})
		} else if (response.status === 'not_authorized') {
			// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
			alert('앱에 로그인해야 이용가능한 기능입니다.');
		} else {
			// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
			alert('페이스북에 로그인해야 이용가능한 기능입니다.');
		}
	}, {scope: 'public_profile,email'});
}

window.fbAsyncInit = function() {
	FB.init({
		appId      : '903275711202980', // 내 앱 ID를 입력한다.
		cookie     : true,
		xfbml      : true,
		version    : 'v10.0'
	});
	FB.AppEvents.logPageView();   
};
</script>

<script>
<!-- 카카오 로그인  -->
Kakao.init('b2ec646ca536be97bb14d5da3d5ff63b'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "SMXia9AvDCbONJgvVUKn", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/finalproject/", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
<!-- 페이스북 앱아이디  -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=903275711202980" nonce="SiOBIhLG"></script>

</html>