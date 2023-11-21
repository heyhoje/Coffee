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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4efc38a6ad2e481f05e226066782e8c&libraries=services"></script>


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
				<div class="tab-pane show active" id="login" role="tabpanel"
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
				<div class="tab-pane hide" id="register" role="tabpanel"
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
				                    <input type="text" name="bm_post" class="form-control postcodify_postcode5" value="${address[0] }">
				                </div>
				                <div class="form-group col-md-12">
				                    <button type="button" class="btn btn-primary" id="postcodify_search_button2">검색</button>
				                </div>
				            </div>
				
				            <div class="form-row" style="width:100%">
				                <div class="form-group col-md-12">
				                    <label  for="address1">도로명 주소</label>
				                </div><br>
				                <div class="form-group col-md-12">
				                    <input type="text" onchange="searchPlaces()" class="form-control postcodify_address" name="bm_address" id="address1"  value="${address[1] }">
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
				            
				        <!-- 매니저 등록 양식 내부에 -->
						<input type="hidden" id="manager_latitude" name="bm_geocoding_lati" value="">
						<input type="hidden" id="manager_longitude" name="bm_geocoding_longi" value="">

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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4efc38a6ad2e481f05e226066782e8c&libraries=services"></script>		
<script>
    $(document).ready(function(){
        $("#login-tab").click(function(){
        	
            // 모든 탭을 숨김
            $("#login").show();
            $("#register").hide();
          
        });
    });
    
    $(document).ready(function(){
        $("#register-tab").click(function(){
        	
            // 모든 탭을 숨김
            $("#login").hide();
            $("#register").show();

        });
    });


    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places(); 
    ps.keywordSearch('이태원 맛집', placesSearchCB); 

    //키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = document.getElementById('address1').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB); 
    }



    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB (data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();

            for (var i=0; i<data.length; i++) {
                displayMarker(data[0]);    
            }       
         
        } 
       
        	
    }

    // 지도에 마커를 표시하는 함수입니다
    function displayMarker(place) {
        
        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(place.y, place.x)
        });
        document.getElementById('manager_latitude').value = marker.getPosition().getLat();
        document.getElementById('manager_longitude').value = marker.getPosition().getLng();
    }
    
    
    
    
</script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	<script> $(function() { $("#postcodify_search_button2").postcodifyPopUp(); }); </script>
</body>

</html>