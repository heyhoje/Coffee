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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>

<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
    $(document).ready(function(){
        $(".nav-link").click(function(){
            // 클릭된 탭의 href 속성 값을 가져옵니다.
            var targetTab = $(this).attr("href");

            // 모든 탭을 숨김
            $(".tab-pane").hide();

            // 클릭된 탭을 보여줍니다.
            $(targetTab).show();
        });
    });
</script>

</head>
<body>
	<div class="signup_v4 mb-30 card card_wrap ">
		<div class="card-body">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation"><a
					class="nav-link active" id="login-tab" data-toggle="tab"
					href="#login" role="tab" aria-controls="login" aria-selected="ture">멤버 회원가입</a>
				</li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="register-tab" data-toggle="tab" href="#register" role="tab"
					aria-controls="register" aria-selected="false">매니저 회원가입</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="login" role="tabpanel"
					aria-labelledby="login-tab" >
					<form action="<c:url value='/member/signup2'/>" method="post">
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="me_name">이름</label> <input type="text"
									class="form-control" id="inputEmail4" placeholder="이름을 입력하세요"
									name="me_name" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="user_id">아이디</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="아이디를 입력하세요" name="user_id" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="user_phone">전화번호</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="전화번호를 입력하세요" name="user_phone" required="">
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
							
						 <div class="form-row" style="width:100%">
				                <div class="form-group col-md-12">
				                    <label for="postcodify_search_button">우편번호</label>
				                </div><br>
				                <div class="form-group col-md-12">
				                    <input type="text" name="me_post" class="form-control postcodify_postcode5" value="${address[0] }">
				                </div>
				                <div class="form-group col-md-12">
				                    <button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
				                </div>
				            </div>
				
				            <div class="form-row" style="width:100%">
				                <div class="form-group col-md-12">
				                    <label for="address1">도로명 주소</label>
				                </div><br>
				                <div class="form-group col-md-12">
				                    <input type="text" class="form-control postcodify_address" name="me_address" id="address1"  value="${address[1] }">
				                </div>
				            </div>
				
				            <div class="form-row" style="width:100%">
				                <div class="form-group col-md-12">
				                    <label for="address2">상세주소</label>
				                </div><br>
			              	 <div class="form-group col-md-12">	
				                    <input type="text" class="form-control postcodify_details" name="me_address2" id="address2"  value="${address[2] }">
				                </div>
				            </div>

						</div>
						<input type="hidden" name="user_aorb" value="회원">
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
				<div class="tab-pane fade show active" id="register" role="tabpanel"

					aria-labelledby="register-tab">
					<form action="<c:url value='/manager/signup2'/>" method="post">
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_manager">매니저</label> <input type="text"
									class="form-control" id="inputEmail4" placeholder="성함을 입력하세요"
									name="bm_manager" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="bm_id">아이디</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="아이디를 입력하세요" name="bm_id" required="">
							</div>
						</div>
						
							<div class="form-group col-md-12">
								<label for="bm_pw">비밀번호</label> <input type="password"
									class="form-control" id="inputPassword4"
									placeholder="비밀번호를 입력하세요" name="bm_pw" required="">
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
									<button class="btn btn-primary" style="margin-top:10px;"><a href="" style="color:#fff">조회</a></button>
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_store_name">매장명</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="매장명을 입력하세요" name="bm_store_name" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_phone">매장 전화번호</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="매장전화번호를 입력하세요" name="" required="">
							</div>

						</div>
						 <div class="form-row" style="width:100%">
				                <div class="form-group col-md-12">
				                    <label for="postcodify_search_button">우편번호</label>
				                </div><br>
				                <div class="form-group col-md-12">
				                    <input type="text" name="" class="form-control postcodify_postcode5" value="${address[0] }">
				                </div>
				                <div class="form-group col-md-12">
				                    <button type="button" class="btn btn-primary" id="postcodify_search_button2">검색</button>
				                </div>
				            </div>
				
				            <div class="form-row" style="width:100%">
				                <div class="form-group col-md-12">
				                    <label for="address1">도로명 주소</label>
				                </div><br>
				                <div class="form-group col-md-12">
				                    <input type="text" class="form-control postcodify_address" name="bm_address" id="address1"  value="${address[1] }">
				                </div>
				            </div>
				
				            <div class="form-row" style="width:100%">
				                <div class="form-group col-md-12">
				                    <label for="address2">상세주소</label>
				                </div><br>
			              	 <div class="form-group col-md-12">	
				                    <input type="text" class="form-control postcodify_details" name="bm_address2" id="address2"  value="${address[2] }">
				                </div>
				            </div>
						
						<input type="hidden" name="user_aorb" value="매니저">
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
						</div>
					</div>
				</div>
			</div>
	<script>
    $(document).ready(function(){
        $("#login-tab").click(function(){
        	
            // 모든 탭을 숨김
            $("#register").hide();
            $("#login").show();
          

            
        });
    });
    
    $(document).ready(function(){
        $("#register-tab").click(function(){
        	
            // 모든 탭을 숨김
            $("#login").hide();
            $("#register").show();

            
        });
    });
</script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	<script> $(function() { $("#postcodify_search_button2").postcodifyPopUp(); }); </script>
</body>

</html>