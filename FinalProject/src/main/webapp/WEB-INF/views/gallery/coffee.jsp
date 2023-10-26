<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.coffee_list_wrap{
	margin-top: 150px;
	font-family: sans-serif;
}
.coffee_list_wrap h2{
	text-align: center;
	font-weight: bold;
}
.coffee_list_wrap .tablehead {
	border-top: 2px solid #03c75a;
}
</style>
</head>
<body>
	<div class="coffee_list_wrap container">
		<h2>커피</h2>
	  <table class="coffee_list table table-hover">
	  <caption>커피</caption>
	    <thead>
	      <tr class="tablehead">
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>작성일</th>
	        <th>조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>John</td>
	        <td>Doe</td>
	        <td>john@example.com</td>
	        <td>2023-10-26</td>
	        <td>111</td>
	      </tr>
	      <tr>
	        <td>Mary</td>
	        <td>Moe</td>
	        <td>mary@example.com</td>
	        <td>2023-10-26</td>
	        <td>222</td>
	      </tr>
	      <tr>
	        <td>July</td>
	        <td>Dooley</td>
	        <td>july@example.com</td>
	        <td>2023-10-26</td>
	        <td>333</td>
	      </tr>
	    </tbody>
	  </table>
	</div>
</body>
</html>