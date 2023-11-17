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
	<h2>매장정보 추가입력</h2>
	<h3>기본 정보</h3>
	아이디 / 비밀번호(점주페이지 수정) / 사업자등록번호 (readonly) <br>
	매장명 / 전화번호 / 주소 (수정가능) <br>
	<h3>추가 정보</h3>
	영업시작 / 영업종료 / 오픈여부(open/closed)(정기휴무일 있는지 - varchar50 정도로 바꾸면 좋지 않을까?) <br>
	브랜드명 / 브랜드로고(첨부파일 등록)
	<br>
	<br>
	${buser}

	<!-- form태그안에 div태그 vs div태그안에 form태그 어떤것이 맞는 방법인가? = 2번  -->
	<!-- 그렇다면 mypage에서 div-div-form 으로 박스안에 박스를 또 넣은 이유는? 레이아웃 지정 및 css처리 때문이겠지? -->
	<div class="col-sm-8" id="plusInfo-container">
		<h3>매장 추가정보 입력</h3>
		<hr>
		<div class="bg-white rounded shadow-sm container p-3">
			<form action="<c:url value='/business/plusinfo'/>" method="post">
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
						<h6>브랜드로고 첨부파일란(없으면 기본이미지)</h6>
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
						<h6>기타정보(정기휴무일, 매장내좌석수, 주차 및 드라이브쓰루 여부 등 자유롭게 입력)</h6>
					</div>
					<div class="col-md-6">
						<textarea id="st_contents" name="st_contents" rows="2" cols="50" placeholder="예시) 매주 2,4째 일요일 정기휴무 / 주차 5대 가능 / 드라이브쓰루 가능 (추가 정보가 없을 경우 '.'을 입력해주세요.)"></textarea>
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