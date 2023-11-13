<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- header css -->
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>">
<!-- business css -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/business.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5737697fa5f3dd128397ef34179de7a&libraries=services,clusterer,drawing"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body
	style="text-align: center; box-sizing: border-box; font-family: 'BM HANNA Pro', sans-serif;">
	<h1 style="margin-top: 30px; font-family: 'BM HANNA Pro', sans-serif;">${buser.bm_store_name}</h1>
	<div>
		<input class="add_menu" type="button" value="메뉴 추가"
			data-toggle="modal" data-target="#addModal"
			style="font-family: 'BM HANNA Pro', sans-serif; background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid; margin-right: 5px;">
		<input class="inf_modify" type="button" value="메뉴 수정"
			data-toggle="modal" data-target="#modifyModal"
			style="font-family: 'BM HANNA Pro', sans-serif; background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid;">
		<input class="delete_menu" type="button" value="메뉴 삭제"
			data-toggle="modal" data-target="#addModal"
			style="font-family: 'BM HANNA Pro', sans-serif; background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid; margin-left: 5px;">
	</div>
	<!-- 메뉴 추가하기  -->
	<div class="add_menu_modal menu_add modal" id="addModal"
		style="position: fixed; width: 560px; height: 85vh; max-height: 720px; left: 50%; margin-left: -275px; margin-top: 3%; border-radius: 10px; overflow-x: hidden; overflow: hidden; background: #fff; box-shadow: 3px 3px 20px 10px rgb(0 0 0/ 25%);">
		<form>
			<div id="modal_header">
				<button type="button" class="closeA">
					<i class="fas fa-times"></i>
				</button>
				<h1>메뉴 추가</h1>
			</div>
			<div class="modal_box">
				<ul>
					<li>
						<h2>메뉴 이름</h2>
						<div class="input_area">
							<input type="text" name="mn_name" autocomplete="off"
								maxlength="30" required>
						</div>
					</li>
					<li>
						<h2>
							<label for="food_price">메뉴 가격</label>
						</h2>
						<div class="input_area">
							<input type="number" pattern="\d*" name="mn_price"
								onkeypress="return lenthCheck(this, 8);" required>
						</div>
					</li>
					<li class="option_box">
						<div>
							<h2>
								<span>메뉴 옵션</span>
								<button type="button" class="add_option" id="addOptionButton"
									style="border-radius: 10px; border: solid 1px; background: #fff; padding: 3px; font-size: 1.2rem; position: absolute; right: 0; top: 0">+
									옵션 추가</button>
							</h2>
						</div>
						<div class="option_box_div"
							style="border: solid 1px; border-radius: 10px; width: 70%; margin: 0 auto;">
							<h1
								style="color: black; font-size: 15px; margin: 0 auto; max-height: 30px;">분류1</h1>
							<div class="option">
								<div>
									<div>옵션 1</div>
									<div>가격</div>
								</div>
								<div>
									<input type="text" maxlength="30" name="menuOption1"> <input
										type="number" onkeypress="return lenthCheck(this,8);"
										pattern="\d*" name="menuOptionPrice1">
								</div>
								<div>
									<button type="button" class="add_option_cancle">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
							<div class="option" style="padding-right: 31.61px;">
								<div>
									<div>옵션 2</div>
									<div>가격</div>
								</div>
								<div>
									<input type="text" maxlength="30" name="menuOption2"> <input
										type="number" onkeypress="return lenthCheck(this,8);"
										pattern="\d*" name="menuOptionPrice2">
								</div>
							</div>
							<div class="option" style="padding-right: 31.61px;">
								<div>
									<div>옵션 3</div>
									<div>가격</div>
								</div>
								<div>
									<input type="text" maxlength="30" name="menuOption3"> <input
										type="number" onkeypress="return lenthCheck(this,8);"
										pattern="\d*" name="menuOptionPrice3">
								</div>
							</div>
						</div>
					</li>
					<li>
						<h2>메뉴 소개</h2>
						<div class="input_area">
							<input type="text" name="mn_contents" autocomplete="off"
								maxlength="66">
						</div>
					</li>
					<li>
						<h2>메뉴 이미지</h2>
						<div class="img_box">
							<label for="img2">사진첨부</label> <input type="file" id="img2"
								class="img" name="file">
							<div>
								<img class="preview">
								<button type="button" class="img_close">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div id="btn_box">
				<button class="closeB" type="button" id="close">취소</button>
				<button class="add_btn" type="button" id="addMenuButton">추가</button>
			</div>
		</form>
	</div>
	<!-- 메뉴 추가하기  -->
	<!-- 메뉴 수정하기  -->
	<div class="add_menu_modal menu_modify modal" id="modifyModal"
		style="padding: 0; position: fixed; z-index: 9999; max-width: 560px; max-height: 85vh; max-height: 720px; left: 50%; margin-left: -275px; margin-top: 3%; border-radius: 10px; overflow-x: hidden; overflow: hidden; background: #fff; box-shadow: 3px 3px 20px 10px rgb(0 0 0/ 25%);">
		<form>
			<div id="modal_header">
				<button type="button" class="closeA">
					<i class="fas fa-times"></i>
				</button>
				<h1>메뉴 수정</h1>
			</div>
			<div class="modal_box">
				<input type="hidden" name="id">
				<ul>
					<li>
						<h2>메뉴 이름</h2>
						<div class="input_area">
							<input type="text" name="mn_name" autocomplete="off"
								maxlength="30" required>
						</div>
					</li>
					<li>
						<h2>메뉴 가격</h2>
						<div class="input_area">
							<input type="number" pattern="\d*" name="mn_price"
								onkeypress="return lenthCheck(this, 8);" required>
						</div>
					</li>
					<li class="option_box">
						<div>
							<h2>
								<span>메뉴 옵션</span>
								<button type="button" class="add_option" id="modifyOptionButton"
									style="border-radius: 10px; border: solid 1px; background: #fff; padding: 3px; font-size: 1.2rem; position: absolute; right: 0; top: 0">+
									옵션 추가</button>
							</h2>
						</div>
						<div class="option_box_div"
							style="border: solid 1px; border-radius: 10px; width: 70%; margin: 0 auto;">
							<h1
								style="color: black; font-size: 15px; margin: 0 auto; max-height: 30px;">분류1</h1>
							<div class="option">
								<div>
									<div>옵션 1</div>
									<div>가격</div>
								</div>
								<div>
									<input type="text" maxlength="30" name="menuOption"> <input
										type="number" onkeypress="return lenthCheck(this,8);"
										pattern="\d*" name="menuOptionPrice">
								</div>
								<div>
									<button type="button" class="add_option_cancle">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
							<div class="option" style="padding-right: 31.61px;">
								<div>
									<div>옵션 2</div>
									<div>가격</div>
								</div>
								<div>
									<input type="text" maxlength="30" name="menuOption"> <input
										type="number" onkeypress="return lenthCheck(this,8);"
										pattern="\d*" name="menuOptionPrice">
								</div>
							</div>
							<div class="option" style="padding-right: 31.61px;">
								<div>
									<div>옵션 3</div>
									<div>가격</div>
								</div>
								<div>
									<input type="text" maxlength="30" name="menuOption"> <input
										type="number" onkeypress="return lenthCheck(this,8);"
										pattern="\d*" name="menuOptionPrice">
								</div>
							</div>
						</div>
					</li>
					<li>
						<h2>메뉴 소개</h2>
						<div class="input_area">
							<input type="text" name="foodDec" autocomplete="off"
								maxlength="66">
						</div>
					</li>
					<li>
						<h2>메뉴 이미지</h2>
						<div class="img_box">
							<label for="img3">사진첨부</label> <input type="file" id="img3"
								class="img" name="file">

							<div>
								<img class="preview">
								<button type="button" class="img_close">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<input type="hidden" name="foodImg"> <input type="hidden"
				name="foodThumb">
			<div id="btn_box">
				<button class="closeB" type="button">취소</button>
				<button class="menu_update_btn" type="button">수정하기</button>
			</div>
		</form>
	</div>
	<!-- 메뉴 수정하기  -->

	<!-- 메뉴/정보/리뷰 -->
	<main>
		<div class="offset"></div>
		<ul class="tab ">
			<li data-tab="menu">메뉴</li>
			<li class="select" data-tab="info">정보</li>
			<li data-tab="comment">리뷰</li>
		</ul>
		<!-- 메뉴 탭 -->
		<ul class="menu">
			<li><label class="menu_delete_label"> <i
					class="fas fa-check-square"></i> <input type="checkbox"
					class="menu_delete_checkbox" name="deleteNumber"
					value="${menuList}">
			</label>
				<div class="menu_box">
					<div>
						<h2>${mn_name}</h2>
						<input type="text" value="${mn_num }" name="menu_Num"> <input
							type="text" value="${mn_name }" name="mn_name" class="menu_name">
						<input type="text" value="${mn_price }" name="mn_price"
							class="food_price">
						<div>
							<img src="<c:url value='/resources/images/none.png'/>">
						</div>
					</div>
				</div></li>
		</ul>
		<!-- 메뉴 탭 -->

		<!-- 정보 탭 -->
		<ul class="info tab-content" data-tab="info">
			<li>
				<div>
					<h2>찾아 오시는 길</h2>

					<div id="map_box">
						<div id="map"></div>

						<div id="position_box">
							<button class="storePosition">
								<i class="far fa-dot-circle"></i> 가게 위치로
							</button>
							<button class="userPosition">
								<i class="far fa-dot-circle"></i> 내 위치로
							</button>
						</div>
					</div>

					<h2>위치안내</h2>
					<div id="store_address" data-address="${info.storeAddress2 }">${info.storeAddress2 }
						${info.storeAddress3 }</div>
				</div>
			</li>

			<li>
				<div>
					<h2>가게 소개</h2>
					<div>${info.storeDes }</div>
				</div>
			</li>

			<li>
				<div>
					<h2>영업 정보</h2>

					<div class="info_detail_title">
						<div>상호명</div>
						<div>영업시간</div>
						<div>전화번호</div>

					</div>

					<div class="info_detail">
						<div>${info.storeName }</div>
						<div>
							<span><fm:formatNumber value="${info.openingTime }"
									minIntegerDigits="2" />시 ~</span> <span><fm:formatNumber
									value="${info.closingTime }" minIntegerDigits="2" />시 </span>
						</div>
						<div>${info.storePhone }</div>

					</div>
				</div>
			</li>

			<li>
				<div>
					<h2>가계 통계</h2>
					<div class="info_detail_title">
						<div>최근 주문수</div>
						<div>전체 리뷰 수</div>
						<div>찜</div>
					</div>

					<div class="info_detail">
						<%-- 
            <div>${info.orderCount }</div>
            <div>${info.reviewCount }</div>
            <div>${info.likesCount }</div> 
            --%>
					</div>
				</div>
			</li>
		</ul>
		<!-- 정보 탭 -->
		<!-- 리뷰 탭 -->
		<ul class="comment tab-content" data-tab="comment">
			<li>
				<div class="score_info">
					<div>
						<div class="score">5.0</div>
					</div>
					<div class="score_count">
						<div>
							<div>5점</div>
						</div>
						<div>
							<div>4점</div>
						</div>
						<div>
							<div>3점</div>
						</div>
						<div>
							<div>2점</div>
						</div>
						<div>
							<div>1점</div>
						</div>
					</div>
				</div>
			</li>
			<c:forEach items="${store.reviewList }" var="reviewList">
				<li>
					<div class="client">
						<div class="review_header">
							<div>
								<div class="nickname">${reviewList.nickname }</div>
								<div>
									<c:forEach begin="0" end="4" var="i">
										<c:choose>
											<c:when test="${Math.round(reviewList.score) > i }">
												<i class="far fas fa-star"></i>
											</c:when>
											<c:otherwise>
												<i class="far fa-star"></i>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<span><fm:formatDate value="${reviewList.regiDate }"
											pattern="yyyy-MM-dd" /> </span>
								</div>
							</div>
						</div>
						<div>
							<c:if test="${!empty reviewList.reviewImg }">
								<div>
									<img src="${reviewList.reviewImg }" alt="이미지"
										class="review_img">
								</div>
							</c:if>
							<div>${reviewList.reviewContent }</div>
						</div>
					</div>
					<div class="boss">
						<c:if test="${!empty reviewList.bossComment }">
							<div class="boss_comment_box">
								<div class="nickname">사장님</div>
								<div class="boss_comment">${reviewList.bossComment }</div>
							</div>
						</c:if>
					</div>
					<div class="boss input">
						<div class="boss_comment_box">
							<div class="nickname">사장님</div>
							<div class="boss_comment">
								<textarea class="comment_area" spellcheck="false"></textarea>
							</div>

							<div>
								<button class="boss_comment_btn reply">댓글 달기</button>
								<input type="hidden" value="${reviewList.orderNum }"
									class="order_num">
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</main>
</body>

<script>
	//JavaScript를 사용하여 탭 버튼 클릭 이벤트 처리
	document.addEventListener('DOMContentLoaded', function() {
		const tabButtons = document.querySelectorAll('.tab li');
		const tabContents = document.querySelectorAll('.tab-content');

		tabButtons.forEach(function(button) {
			button.addEventListener('click', function() {
				// 모든 탭 버튼을 비활성화
				tabButtons.forEach(function(btn) {
					btn.classList.remove('select');
				});

				// 선택한 탭 버튼을 활성화
				this.classList.add('select');

				// 선택한 탭과 관련된 탭 내용을 표시
				const selectedTab = this.getAttribute('data-tab');
				tabContents.forEach(function(content) {
					if (content.getAttribute('data-tab') === selectedTab) {
						content.style.display = 'block';
					} else {
						content.style.display = 'none';
					}
				});
			});
		});
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded",
			function() {
				// 최대 옵션 박스 수
				var maxOptionBoxes = 5;
				// 공통으로 사용할 함수: 옵션 추가
				function addOption(optionContainer) {
					// 현재 존재하는 옵션 박스 개수 확인
					var optionBoxDivs = optionContainer
							.querySelectorAll(".option_box_div");
					if (optionBoxDivs.length >= maxOptionBoxes) {
						// 최대 개수를 초과하면 더 이상 옵션 추가를 허용하지 않음
						alert("최대 5개까지만 옵션을 추가할 수 있습니다.");
						return;
					}

					var optionBoxDiv = optionContainer
							.querySelector(".option_box_div");
					var newOptionBoxDiv = optionBoxDiv.cloneNode(true);
					// 분류 숫자 업데이트 및 삽입
					var nextCategoryNumber = optionBoxDivs.length + 1;
					newOptionBoxDiv.querySelector("h1").textContent = "분류 "
							+ nextCategoryNumber;
					// "add_option_cancle" 버튼에 대한 클릭 이벤트 핸들러를 추가합니다.
					var cancelButtons = newOptionBoxDiv
							.querySelectorAll(".add_option_cancle");
					cancelButtons.forEach(function(cancelButton, index) {
						cancelButton.addEventListener("click", function() {
							var boxToDelete = cancelButton
									.closest(".option_box_div");
							boxToDelete.parentNode.removeChild(boxToDelete);

							// 삭제한 옵션 이후의 옵션 숫자 재설정
							resetCategoryNumbers(optionContainer);
						});
					});
					optionBoxDiv.parentNode.appendChild(newOptionBoxDiv);
				}
				// 공통으로 사용할 함수: 분류 숫자 업데이트
				function resetCategoryNumbers(optionContainer) {
					var categoryElements = optionContainer
							.querySelectorAll(".option_box_div h1");
					categoryElements.forEach(function(categoryElement, index) {
						categoryElement.textContent = "분류 " + (index + 1);
					});
				}
				// 메뉴 추가 모달 창에서 사용할 옵션 번호 변수
				var addOptionButton = document
						.querySelector("#addOptionButton");

				// 메뉴 추가 모달 창에서의 옵션 추가
				addOptionButton.addEventListener("click", function() {
					addOption(document.querySelector("#addModal"));
				});
				// 메뉴 수정 모달 창에서 사용할 옵션 번호 변수
				var modifyOptionButton = document
						.querySelector("#modifyOptionButton");
				// 메뉴 수정 모달 창에서의 옵션 추가
				modifyOptionButton.addEventListener("click", function() {
					addOption(document.querySelector("#modifyModal"));
				});
			});
</script>
<script>
	$(document)
			.ready(
					function() {
						var storeAddress = $("#store_address").data("address");
						var storeName = $("#store_name").data("store_name");
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.25110701,
									126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);
						// 주소-좌표 변환 객체를 생성합니다	
						var geocoder = new kakao.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						geocoder
								.addressSearch(
										storeAddress,
										function(result, status) {
											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {
												var coords = new kakao.maps.LatLng(
														result[0].y,
														result[0].x);
												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : coords
														});
												// 인포윈도우로 장소에 대한 설명을 표시합니다
												var infowindow = new kakao.maps.InfoWindow(
														{
															content : '<div style="width:150px;text-align:center;padding:3px 0;">'
																	+ storeName
																	+ '</div>'
														});
												infowindow.open(map, marker);
												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);
												$(".storePosition").click(
														function() {
															map.panTo(coords);
														})
											}
										});
						var userAddress = $("#delevery_address").val();
						if (userAddress != "") {
							$(".userPosition").css("display", "inline");
							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											userAddress,
											function(result, status) {
												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {
													coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);
													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});
													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:3px 0;">'
																		+ "배달받을위치"
																		+ '</div>'
															});
													infowindow
															.open(map, marker);
													(".userPosition")
															.click(function() {
																map
																		.panTo(coords);
															})
												}
											});
						}
					})
</script>

<script>
$(document).ready(function() {
    $("#addMenuButton").on("click", function() {
        var mn_name = $("input[name='mn_name']").val();
        var mn_price = $("input[name='mn_price']").val();
        var mn_contents = $("input[name='mn_contents']").val();
        var file = $("input[name='file']")[0].files[0];

        var options = [];
        for (var i = 1; i <= 3; i++) {
            var option_name = $("input[name='menuOption" + i + "']").val();
            var option_price = $("input[name='menuOptionPrice" + i + "']").val();
            options.push({ name: option_name, price: option_price });
        }

        var formData = new FormData();
        formData.append("mn_name", mn_name);
        formData.append("mn_price", mn_price);
        formData.append("mn_contents", mn_contents);
        formData.append("file", file);
        formData.append("options", JSON.stringify(options)); // 옵션 정보를 JSON 문자열로 전송

        $.ajax({
            type: 'POST',
            url: '/addMenuAndOptions', // 실제 서버의 엔드포인트에 맞게 수정
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                console.log(response);
                alert("메뉴와 옵션이 추가되었습니다.");
            },
            error: function(error) {
                alert("메뉴와 옵션 추가에 실패했습니다.");
            }
        });
    });
});

</script>
</html>