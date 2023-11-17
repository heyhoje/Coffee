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
        <h3 id="Mypage-title">My Page</h3>
        <hr>
        <div class="bg-white rounded shadow-sm container p-3" >
            <form method="POST" action="updateMember.do" onsubmit="return memberUpdateValidate();" class="form-horizontal" role="form">
            <!-- 아이디 -->
            <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="memberId">아이디</label>
                </div>
                <div class="col-md-6" style="display:flex; align-items:flex-end;">
                    <h5 id="id">${user.me_user_id}</h5>
                    <button type="button" class="btn btn-primary" onclick="location.href='/member/pwchange'" id="pwchange" style="margin-left:30px; border: 1px solid black; background-color: floralwhite; color: black;">비밀번호변경</button>
                </div>
            </div>
		
			 <!-- 포인트 -->
            <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="memberPoint">포인트</label>
                </div>
                <div class="col-md-6">
                    <h5 id="point">${user.me_point}</h5>
                </div>
            </div>
            
            <!-- 이름 -->
            <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="memberName">이름</label>
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control" id="name" name="name" value="${user.me_name}">
                </div>
            </div>

           

            <!-- 이메일 -->
            <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="memberEmail">Email</label>
                </div>
                <div class="col-md-6">
                    <input type="email" class="form-control" id="email" name="email" value="${user.me_email}">
                </div>
            </div>
            <br>

            <!-- 주소 -->
            <!-- 오픈소스 도로명 주소 API -->
            <!-- https://www.poesis.org/postcodify/ -->
            <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="postcodify_search_button">우편번호</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="post" class="form-control postcodify_postcode5" value="${user.me_post}">
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btn-primary" id="postcodify_search_button" style="border: 1px solid black; background-color: floralwhite; color: black;">검색</button>
                </div>
            </div>

            <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="address1">도로명 주소</label>
                </div>
                <div class="col-md-9">
                    <input type="text" class="form-control postcodify_address" name="address1" id="address1"  value="${user.me_address}">
                </div>
            </div>

            <div class="row mb-3 form-row">
                <div class="col-md-3">
                    <label for="address2">상세주소</label>
                </div>
                <div class="col-md-9">
                    <input type="text" class="form-control postcodify_details" name="address2" id="address2"  value="${user.me_address2}">
                </div>
            </div>


            <!-- 관심분야 -->
            <hr class="mb-4">
            <div class="row">
                <div class="col-md-3">
                    <label>관심 브랜드</label>
                </div>
                
                <div class="col-md-9 custom-control custom-checkbox">
                
                    <div class="form-check form-check-inline">
                        <input type="checkbox" class="form-check-input custom-control-input"
                            name="memberInterest" id="sports" value="운동">
                        <label class="form-check-label custom-control-label" for="starbucks">스타벅스</label>
                    </div>
                    
                    <div class="form-check form-check-inline">
                        <input type="checkbox" class="form-check-input custom-control-input"
                            name="memberInterest" id="movie" value="영화">
                        <label class="form-check-label custom-control-label" for="megacoffee">메가커피</label>
                    </div>
                    
                    <div class="form-check form-check-inline">
                        <input type="checkbox" class="form-check-input custom-control-input" 
                            name="memberInterest" id="music" value="음악">
                        <label class="form-check-label custom-control-label" for="twosome">투썸플레이스</label>
                    </div>
                    <br>
                    
                    <div class="form-check form-check-inline">
                        <input type="checkbox" name="memberInterest" id="cooking"
                            value="요리" class="form-check-input custom-control-input">
                        <label class="form-check-label custom-control-label"
                            for="hollyscoffee">할리스커피</label>
                    </div>
                    
                    <div class="form-check form-check-inline">
                        <input type="checkbox"  class="form-check-input custom-control-input" 
                            name="memberInterest" id="game" value="게임">
                        <label class="form-check-label custom-control-label" for="paik's coffee">빽다방</label>
                    </div>
                    
                    <div class="form-check form-check-inline">
                        <input type="checkbox" class="form-check-input custom-control-input" 
                            name="memberInterest" id="etc" value="기타"> 
                        <label class="form-check-label custom-control-label" for="etc">기타</label>
                    </div>
                    
                </div>
            </div>

            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit" style="border: 1px solid black; background-color: floralwhite; color: black;">수정</button>
                </form>
            </div>
        </div>
<br><br>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</body>
</html>