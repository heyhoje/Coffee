<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>스타벅스</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  	.container {
  	text-align: center; padding: 20px;
  	}
  	.box{
  	padding: 20px;
  	}
  	.checkbox{
  	border: 1px solid black; text-align: left;
  	}
  	
  </style>
</head>
<body>

<div class="container">
	<h2>음료</h2>
	<p>분류보기</p>
	<div class="btn-group box" style="width: 700px;">
		<button type="button" class="btn btn-success">음료</button>
		<button type="button" class="btn btn-success">푸드</button>
		<button type="button" class="btn btn-success">상품</button>
	</div><br>
	<div class="checkbox box" >
		<p>메뉴검색</p>
		<input type=checkbox> 전체
		<input type=checkbox> 커피
		<input type=checkbox> 프라푸치노
		<input type=checkbox> 티바나
	</div>	
</div>
  
</body>
</html>