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
	<h4 class="pt-4">매장 등록 승인</h4>
		            
		<table class="table table-hover">
			<thead>
				<tr>
					<th>매장번호</th>
					<th>브랜드명</th>
					<th>사업자아이디</th>
					<th>영업시작</th>
					<th>영업종료</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<tbody>
				<!-- ${bsList} 리스트에서 객체 하나를 꺼내서 bs에 넣는다. 객체.속성명 -->
				<c:forEach items="${bsList}" var="bs">
					<tr>
						<td>${bs.st_num}</td>
						<td>${bs.st_br_name}</td>
						<td>${bs.st_bm_id}</td>
						<td>${bs.st_opentime}</td>
						<td>${bs.st_closetime}</td>
						<td>승인대기 - 1개만 두고, 클릭하면 1=승인완료/2=승인거절 이런식으로 ajax줘야하는걸까?<br><button class="btn btn-outline-primary">승인</button>&nbsp;<button class="btn btn-outline-danger">거절</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${bsList}
	</div>
	

</body>
</html>