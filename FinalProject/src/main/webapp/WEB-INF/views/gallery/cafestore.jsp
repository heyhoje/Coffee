<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/coffee.css'/>">
<title>Insert title here</title>
</head>
<body>
	<div class="coffee_list_wrap">
	  <table class="coffee_list">
	  	<caption>카페사진</caption>
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>작성일</th>
	        <th>조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>3</td>
	        <td class="title">
	        	<a href="#">스타벅스 매장 사진!</a>
	        </td>
	        <td>yoo123</td>
	        <td>2023-10-26</td>
	        <td>111</td>
	      </tr>
	      <tr>
	        <td>2</td>
	        <td class="title col-8">
	        	<a href="#">빽다방 매장 사진!</a>
	        </td>
	        <td>yoo123</td>
	        <td>2023-10-26</td>
	        <td>222</td>
	      </tr>
	      <tr>
	        <td>1</td>
	        <td class="title">
	        	<a href="#">스타벅스 역삼 매장 사진</a>
	        </td>
	        <td>yoo123</td>
	        <td>2023-10-26</td>
	        <td>333</td>
	      </tr>
	    </tbody>
	  </table>
	  <div class="paging">
	  	<a href="#" class="bt">첫 페이지</a>
	  	<a href="#" class="bt">이전 페이지</a>
	  	<a href="#" class="num">1</a>
	  	<a href="#" class="num">2</a>
	  	<a href="#" class="num">3</a>
	  	<a href="#" class="bt">다음 페이지</a>
	  	<a href="#" class="bt">마지막 페이지</a>
	  </div>
	</div>
</body>
</html>