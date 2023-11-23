<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사업자 추가정보 입력</title>
</head>
<body>
	<!-- form태그안에 div태그 vs div태그안에 form태그 어떤것이 맞는 방법인가? = 2번  -->
	<!-- 그렇다면 mypage에서 div-div-form 으로 박스안에 박스를 또 넣은 이유는? 레이아웃 지정 및 css처리 때문이겠지? -->
	<div class="col-sm-8" id="plusInfo-container">
		<h3 class="mt-5">매장 추가정보 입력</h3>
		<hr>
		<div class="bg-white rounded shadow-sm container p-3">
			<form action="<c:url value='/business/plusinfo'/>" method="post" enctype="multipart/form-data">
			<!-- <form method="POST" action="updateBMember.do" onsubmit="return memberUpdateValidate();" class="form-horizontal" role="form"> -->
			<!-- 마이페이지 한 사람한테 안에 내용 물어보기. onsubmit -->
	         
				<!-- 기본 정보1 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<h6>아이디</h6>
					</div>
					<div class="col-md-6">
						<h5 id="id">${buser.bm_id}</h5>
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<h6>사업자번호</h6>
					</div>
					<div class="col-md-6">
						<h5 id="bnum">${buser.bm_num}</h5>
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<h6>담당자</h6>
					</div>
					<div class="col-md-6">
						<h5 id="manager">${buser.bm_manager}</h5>
					</div>
				</div>
				
				<!-- label태그-input태그 쓸 때, for랑 id로 어떤것을 위한 라벨인지 표시하는거라 input에 name만 쓰면 되는거였나요? -->
				<hr class="mb-4">
				<!-- 브랜드 추가/첨부파일 -->
				<p>* 브랜드명과 매장이름은 한글로 작성하는 것을 권장합니다!</p><br>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="br_name">브랜드명</h6>
					</div>
					<div class="col-md-8">
						<input type="text" id="br_name" name="st_br_name"><span><p>* 개인카페일 경우 매장명과 동일하게 작성해주세요.</p></span>
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="br_name">브랜드로고</h6>
					</div>
					<div class="col-md-3">
						<input type="file" name="files">
					</div>
				</div>
				
				<!-- 기본정보2(수정가능) -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<h6>매장명</h6>
					</div>
					<div class="col-md-6">
						<h5 id="store_name">${buser.bm_store_name}</h5>
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<h6>매장전화번호</h6>
					</div>
					<div class="col-md-6">
						<h5 id="phone">${buser.bm_phone}</h5>
					</div>
				</div>
				<!-- 주소 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address">주소</label>
					</div>
					<div class="col-md-9">
						<h6 id="address">${buser.bm_address}
					</div>
				</div>
				
				<!-- 추가정보(영업관련정보) -->
				<hr class="mb-4">
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<h6>영업시작/종료시간</h6>
					</div>
					<div class="col-md-6">
						<input type="text" id="st_opentime" name="st_opentime" placeholder="예시) 08:00 "> 
						~ <input type="text" id="st_closetime" name="st_closetime" placeholder="20:00">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<h6>기타정보</h6>
					</div>
					<div class="col-md-6">
						<textarea id="st_contents" name="st_contents" rows="2" cols="50" 
							placeholder="예시) 매주 2,4째 일요일 정기휴무 / 콘센트 좌석 있음 / 어린이환영, 강아지환영 / 주차 5대 가능 / 드라이브쓰루"></textarea>
					</div>
				</div>
				
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit">제출</button>
			</form>
		</div>
	</div>

	<script> 
		/* 여긴 추가할 것 없는지~ */
	</script>
	
</body>
</html>