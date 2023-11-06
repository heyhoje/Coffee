<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 승인 페이지</title>
</head>
<body>

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
	

</body>
</html>