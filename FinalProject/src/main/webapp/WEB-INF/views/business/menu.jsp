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
<body style="text-align: center;">
	<h1 style="margin-top:30px; font-family: 'BM HANNA Pro', sans-serif;">스타벅스</h1>
	<div>
		<input class="add_menu" type="button" value="메뉴 추가"
			data-toggle="modal" data-target="#addModal"
			style="background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid;">
		<input class="inf_modify" type="button" value="메뉴 수정"
			data-toggle="modal" data-target="#modifyModal"
			style="background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid;">
		<input class="delete_menu" type="button" value="메뉴 삭제"
			data-toggle="modal" data-target="#addModal"
			style="background-color: white; font-size: 20px; width: 150px; height: 40px; border: 1px solid;">
	</div>
	<!-- 메뉴 추가하기  -->
	<div class="add_menu_modal menu_add modal" id="addModal"
		style="width: 560px; height: 85vh; max-height: 720px; left: 50%; margin-left: -275px; margin-top: 3%; border-radius: 10px; overflow-x: hidden; overflow: hidden; background: #fff; box-shadow: 3px 3px 20px 10px rgb(0 0 0/ 25%);">
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
								<div>옵션 1 </div> 
								<div>가격</div> 
							</div>
							<div>
								<input type="text" maxlength="30" name="foodOption">
								<input type="number" onkeypress="return lenthCheck(this,8);" pattern="\d*" name="foodOptionPrice">
							</div>
							<div>
								<button type="button" class="add_option_cancle" ><i class="fas fa-times"></i></button>
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
		style="width: 560px; height: 85vh; max-height: 720px; left: 50%; margin-left: -275px; margin-top: 3%; border-radius: 10px; overflow-x: hidden; overflow: hidden; background: #fff; box-shadow: 3px 3px 20px 10px rgb(0 0 0/ 25%);">
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
								<div>옵션 1 </div> 
								<div>가격</div> 
							</div>
							<div>
								<input type="text" maxlength="30" name="foodOption">
								<input type="number" onkeypress="return lenthCheck(this,8);" pattern="\d*" name="foodOptionPrice">
							</div>
							<div>
								<button type="button" class="add_option_cancle" ><i class="fas fa-times"></i></button>
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
            <li class="select">메뉴</li>
            <li>정보</li>
            <li>리뷰</li>
        </ul>
		<!-- 메뉴 탭 -->	
        <ul class="menu">
        </ul>
		<!-- 메뉴 탭 -->	
		
		<!-- 정보 탭 -->
	    <ul class="info" >
	    </ul>
		<!-- 메뉴 탭 -->    
		<!-- 리뷰 탭 -->        
		<ul class="comment" >
		</ul>
	</main>
</body>
</html>