<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</head>
<body>
	<div class="col-sm-8" id="mypage-container" style="margin: 0 auto;">
		<h3 id="Mypage-title">사업자정보 수정</h3>
		<hr>
		<div class="bg-white rounded shadow-sm container p-3">
			<form id="infoView" action="/manager/infoUpdate" method="POST"
				autocomplete="off" class="form-horizontal" role="form">
				<!-- 아이디 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_id">아이디</label>
					</div>
					<div class="col-md-9" style="display: flex; align-items: flex-end;">
						<input type="text" name="bm_id" class="form-control"
							value="${buser.bm_id}" id="bm_id" readonly>
					</div>
				</div>

				<!-- 이름 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="bm_manager">사업자명</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="bm_manager"
							name="bm_manager" value="${buser.bm_manager}">
					</div>
				</div>


				<!-- 이메일 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="me_email">사업자번호</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="bm_num" name="bm_num"
							value="${buser.bm_num}">
					</div>
				</div>
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="me_email">매장명</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="bm_store_name" name="bm_store_name"
							value="${buser.bm_store_name}">
					</div>
				</div>
				<!-- 주소 -->
				<!-- 오픈소스 도로명 주소 API -->
				<!-- https://www.poesis.org/postcodify/ -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="postcodify_search_button">우편번호</label>
					</div>
					<div class="col-md-3">
						<input type="text" name="bm_post" id="bm_post"
							class="form-control postcodify_postcode5"
							value="${buser.bm_post}">
					</div>
					<div class="col-md-3">
						<button type="button" class="btn btn-primary"
							id="postcodify_search_button"
							style="border: 1px solid black; background-color: floralwhite; color: black;">검색</button>
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address1">도로명 주소</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_address"
							name="bm_address" id="bm_address" value="${buser.bm_address}">
					</div>
				</div>

				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<label for="address2">상세주소</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_details"
							name="bm_address2" id="bm_address2" value="${buser.bm_address2}">
					</div>
				</div>

				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit"
					style="border: 1px solid black; background-color: floralwhite; color: black;"
					onclick="fnSubmit(); return false;">사업자정보 수정</button>
				<a type="button" class="btn btn-primary btn-lg btn-block"
					style="width: 100%; border: 1px solid black; background-color: floralwhite; color: black;"
					href="/manager/mypageHome" class="btn btn-default">취소</a>
			</form>
		</div>
	</div>
	<br>
	<br>
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<script>
		function fnSubmit() {
			var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

			if ($("#bm_manager").val() == null || $("#bm_manager").val() == "") {
				alert("사업자명을 입력해주세요.");
				$("#bm_manager").focus();
				return false;
			}

			if ($("#bm_num").val() == null || $("#bm_num").val() == "") {
				alert("사업자번호를 입력해주세요.");
				$("#bm_num").focus();
				return false;
			}
			
			if ($("#bm_store_name").val() == null || $("#bm_store_name").val() == "") {
				alert("매장명를 입력해주세요.");
				$("#bm_store_name").focus();
				return false;
			}

			if ($("#bm_post").val() == null || $("#bm_post").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#bm_post").focus();
				return false;
			}

			if ($("#bm_address").val() == null || $("#bm_address").val() == "") {
				alert("도로명 주소를 입력해주세요.");
				$("#bm_address").focus();
				return false;
			}

			if ($("#bm_address2").val() == null
					|| $("#me_address2").val() == "") {
				alert("상세주소를 입력해주세요.");
				$("#bm_address2").focus();
				return false;
			}

			if (confirm("수정하시겠습니까?")) {

				$("#infoView").submit();
				return false;
			}
		}
	</script>
</body>
</html>