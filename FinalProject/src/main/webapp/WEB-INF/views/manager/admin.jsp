<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사이트관리자 페이지</title>

	<style>
		.container {
		margin: 0 auto; max-width: 1000px;
		}
		.btn-group {
	    display: flex;
	    justify-content: center;
	  	}
	  	
	</style>
</head>
<body>
	<h2 style="text-align: center;" class="mt-3 mb-3">사이트 관리자 페이지 입니다.</h2>
	
	
	<div class="container">
	  <div class="btn-group btn-group-lg">
	    <a href="<c:url value='/admin/shop'/>" class="btn btn-ouline-black">점주요청 관리</a>
	    <a href="<c:url value='/admin/promotion'/>" class="btn btn-ouline-black">프로모션 관리</a>
	    <a href="<c:url value='/admin/review'/>" class="btn btn-ouline-black">리뷰 관리</a>
	  </div>
	</div>
	<br>
	<br>
	
	<div class="container">
	  <h4>회원가입 요청 리스트</h4>
	              
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th>아이디</th>
	        <th>매장명</th>
	        <th>담당자</th>
	        <th>매장주소</th>
	        <th>사업자번호</th>
	        <th>승인상태</th>
	      </tr>
	    </thead>
	    <tbody>
	    
	      <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td><button class="btn btn-outline-primary">승인</button>&nbsp;<button class="btn btn-outline-danger">거절</button></td>
	      </tr>
	    
	    ${manager}
	    </tbody>
	  </table>
	</div>
	
	
	
	<p>흠 뭐가 필요하죠</p>
	<p>들어온 요청을 게시판 형식으로 볼건가요?</p>
	<p>승인버튼만 추가하면 되나요</p>
	<P>점주요청(회원가입 승인대기->승인완료->매장등록)</P>
	<p>프로모션(승인대기->승인완료)</p>
	(갤러리 그냥 올리면됨)
	crud - 갤러리, 프로모션
	
	선택) 고객센터 문의받고 답변
</body>
</html>