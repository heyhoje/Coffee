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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body style="text-align: center; box-sizing: border-box;">
	<h1 style="margin-top: 30px; font-family: 'BM HANNA Pro', sans-serif;">스타벅스</h1>
	<div>
		<input class="add_menu" type="button" value="메뉴 추가"
			data-toggle="modal" data-target="#addModal"
			style="background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid; margin-right: 5px;">
		<input class="inf_modify" type="button" value="메뉴 수정"
			data-toggle="modal" data-target="#modifyModal"
			style="background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid;">
		<input class="delete_menu" type="button" value="메뉴 삭제"
			data-toggle="modal" data-target="#addModal"
			style="background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid; margin-left: 5px;">
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
							<input type="text" name="foodName" autocomplete="off"
								maxlength="30" required>
						</div>
					</li>
					<li>
						<h2>
							<label for="food_price">메뉴 가격</label>
						</h2>
						<div class="input_area">
							<input type="number" pattern="\d*" name="foodPrice"
								onkeypress="return lenthCheck(this, 8);" required>
						</div>
					</li>
					<li class="option_box">
						<div>
							<h2>
								<span>메뉴 옵션</span>
								<button type="button" class="add_option">+ 옵션 추가</button>
							</h2>
						</div>
						<div class="option_box_div">
							<div class="option">
								<div>
									<div>옵션 1</div>
									<div>가격</div>
								</div>
								<div>
									<input type="text" maxlength="30" name="foodOption"> <input
										type="number" onkeypress="return lenthCheck(this,8);"
										pattern="\d*" name="foodOptionPrice">
								</div>
								<div>
									<button type="button" class="add_option_cancle">
										<i class="fas fa-times"></i>
									</button>
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
				<button class="closeB" type="button">취소</button>
				<button class="add_btn" type="button">추가</button>
			</div>
		</form>
	</div>
	<!-- 메뉴 추가하기  -->
	<!-- 메뉴 수정하기  -->
	<div class="add_menu_modal menu_modify modal" id="modifyModal"
		style="padding:0; position: fixed; z-index: 9999; max-width: 560px; max-height: 85vh; max-height: 720px; left: 50%; margin-left: -275px; margin-top: 3%; border-radius: 10px; overflow-x: hidden; overflow: hidden; background: #fff; box-shadow: 3px 3px 20px 10px rgb(0 0 0/ 25%);">
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
							<input type="text" name="foodName" autocomplete="off"
								maxlength="30" required>
						</div>
					</li>
					<li>
						<h2>메뉴 가격</h2>
						<div class="input_area">
							<input type="number" pattern="\d*" name="foodPrice"
								onkeypress="return lenthCheck(this, 8);" required>
						</div>
					</li>
					<li class="option_box">
						<div>
							<h2>
								<span>메뉴 옵션</span>
								<button type="button" class="add_option">+ 옵션 추가</button>
							</h2>
						</div>
						<div class="option_box_div">
							<div class="option">
								<div>
									<div>옵션 1</div>
									<div>가격</div>
								</div>
								<div>
									<input type="text" maxlength="30" name="foodOption"> <input
										type="number" onkeypress="return lenthCheck(this,8);"
										pattern="\d*" name="foodOptionPrice">
								</div>
								<div>
									<button type="button" class="add_option_cancle">
										<i class="fas fa-times"></i>
									</button>
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
		<ul class="menu tab-content" data-tab="menu">
			<c:forEach items="" var="foodList">
				<li><c:if test="">
						<label class="menu_delete_label"> <i
							class="fas fa-check-square"></i> <input type="checkbox"
							class="menu_delete_checkbox" name="deleteNumber" value="">
						</label>
					</c:if>
					<div class="menu_box">
						<div>
							<h2>11</h2>
							원 <input value="1" name="storeId"> <input value="2"
								name="foodId" class="food_id"> <input value="3"
								name="foodName" class="food_name"> <input value="4"
								name="foodPrice" class="food_price"> <input value="5"
								name="foodDec" class="food_dec"> <input value="6"
								name="foodImg" class="food_img"> <input value="7"
								name="foodThumb" class="food_thumb">
						</div>
						<div>
							<img src="" alt="이미지">
						</div>
					</div></li>
			</c:forEach>
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
		<!-- 메뉴 탭 -->
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
//바깥 부분 클릭 시 모달 닫기
window.addEventListener('click', function (event) {
    var modal = document.getElementById('addModal');
    if (event.target == modal) {
        closeModal();
    }
});

// ESC 키 누를 시 모달 닫기
document.addEventListener('keydown', function (event) {
    var modal = document.getElementById('addModal');
    if (event.key === 'Escape' && modal.style.display === 'block') {
        closeModal();
    }
});

function closeModal() {
    var modal = document.getElementById('addModal');
    modal.style.display = 'none';
}
</script>
</html>