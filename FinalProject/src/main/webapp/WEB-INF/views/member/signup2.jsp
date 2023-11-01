<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- signup css -->
<link rel="stylesheet" href="<c:url value='/resources/css/signup.css'/>">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>

</head>
<body>
	<div class="signup_v4 mb-30 card card_wrap ">
		<div class="card-body">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation"><a
					class="nav-link active" id="login-tab" data-toggle="tab"
					href="#login" role="tab" aria-controls="login" aria-selected="true">멤버 회원가입</a>
				</li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="register-tab" data-toggle="tab" href="#register" role="tab"
					aria-controls="register" aria-selected="false">매니저 회원가입</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="login" role="tabpanel"
					aria-labelledby="login-tab">
					<form action="<c:url value='/member/signup2'/>" method="post">
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="me_name">이름</label> <input type="text"
									class="form-control" id="inputmembername4" placeholder="이름을 입력하세요"
									name="me_name" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="user_id">아이디</label> <input type="text"
									class="form-control" id="inputmemberid4"
									placeholder="아이디를 입력하세요" name="user_id" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="user_phone">전화번호</label> <input type="text"
									class="form-control" id="inputmemberphone4"
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
									class="form-control" id="inputPasswordCheck4"
									placeholder="동일한 비밀번호를 입력하세요." name="me_pw2" required="">
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
				<div class="tab-pane fade" id="register" role="tabpanel"
					aria-labelledby="register-tab">
					<form action="<c:url value='/manager/signup2'/>" method="post">
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_manager">매니저</label> <input type="text"
									class="form-control" id="inputmanager4" placeholder="성함을 입력하세요"
									name="bm_manager" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="bm_id">아이디</label> <input type="text"
									class="form-control" id="inputid4"
									placeholder="아이디를 입력하세요" name="bm_id" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_email">이메일</label> <input type="email"
									class="form-control" id="inputEmail4" placeholder="이메일을 입력하세요"
									name="bm_email" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="bm_pw">비밀번호</label> <input type="password"
									class="form-control" id="inputPassword4"
									placeholder="비밀번호를 입력하세요" name="bm_pw" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_pw2">비밀번호 확인</label> <input type="password"
									class="form-control" id="inputPasswordCheck4"
									placeholder="동일한 비밀번호를 입력하세요" name="bm_pw2" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_num">사업자 등록 번호</label> <input type="text"
									class="form-control" id="inputbri4"
									placeholder="사업자 등록 번호를 입력하세요" name="bm_num" required="">
									<button class="btn btn-primary" id="bidsearch" style="margin-top:10px;">조회</button>
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_store_name">매장명</label> <input type="text"
									class="form-control" id="inputstorename4"
									placeholder="매장 전화번호를 입력하세요" name="bm_store_name" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_phone">매장 전화번호</label> <input type="text"
									class="form-control" id="inputstorephone4"
									placeholder="매장 전화번호를 입력하세요" name="bm_phone" required="">
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="bm_address">매장 주소</label> <input type="text"
									class="form-control" id="inputstoreaddress4"
									placeholder="매장 주소를 입력하세요" name="bm_address" required="">
							</div>
						<input type="hidden" name="user_aorb" value="매니저">
						</div>
						<div class="form-group form-row">
							<div class="col-md-12">
									<button class="btn btn-primary" onclick="sample5_execDaumPostcode()">주소 검색</button><br>
									<div id="map" style="width:300px; height:300px; margin-top:10px; display:none"></div>
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
			</div>
		</div>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?bd4af62b9a3240f9ae2291ab29c8bf4e&libraries=services"></script>
	<script>
	var button = document.getElementById("bidsearch");
	
	button.addEventListener("click", function(){
		let b_no = document.getElementById("inputbri4").value
	var data = {
    	    "b_no": [b_no] // 사업자번호 "xxxxxxx" 로 조회 시,
    	   }; 
    	   
    	$.ajax({
    	  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=6%2FljNK6ok3aEAXy70qeiTeq3cPC%2FF9P75ny1k%2F2W3w6eAf9mYAOPohyUQB60NWpRBv%2FH9z85nzxjJgSzwKhYtw%3D%3D",  // serviceKey 값을 xxxxxx에 입력
    	  type: "POST",
    	  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
    	  dataType: "JSON",
    	  contentType: "application/json",
    	  accept: "application/json",
    	  success: function(result) {
    	      console.log(result);
    	      	/* API에서 사업자 등록번호 추출 */
    	      if(result.data.length > 0) {
	    	      var businessNumber = result.data[0].b_no;
	    	      var taxType = result.data[0].tax_type;
	    	      /* 사업자등록번호 필드에 설정 */
	    	      var inputbusinessNumber = document.getElementById("inputbri4");
	    	      var inputTaxType = document.getElementById("inputbri4");
	    	      
	    	      inputBusinessNumber.value = businessNumber;
	    	      inputTaxType.value = taxType;
    	      } else{
    	    	  console.error('데이터가 없거나 잘못된 응답입니다.');
    	      }
    	  },
    	})
	});
	
	//다음 맵 부분
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("inputstoreaddress4").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	    
	    
	</script>
</body>
</html>