<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- header css -->
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>">
<title>Insert title here</title>
</head>
<body>
	<!-- 메뉴 추가하기  -->
		<form>
				<h1>메뉴 추가</h1>

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
		</form>
	<!-- 메뉴 추가하기  -->
</body>
</html>