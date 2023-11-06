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
	<h4 class="pt-4">사업자회원 승인</h4>
		            
		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>매장명</th>
					<th>매장주소</th>
					<th>담당자</th>
					<th>사업자번호</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<tbody>
				<!-- ${bmList} 리스트에서 객체 하나를 꺼내서 bm에 넣는다. 객체.속성명 -->
				<c:forEach items="${bmList}" var="bm">
					<tr>
						<td>${bm.bm_id}</td>
						<td>${bm.bm_store_name}</td>
						<td>${bm.bm_address}</td>
						<td>${bm.bm_manager}</td>
						<td>${bm.bm_num}</td>
						<td>승인대기 - 1개만 두고, 클릭하면 1=승인완료/2=승인거절 이런식으로 ajax줘야하는걸까?<br><button class="btn btn-outline-primary">승인</button>&nbsp;<button class="btn btn-outline-danger">거절</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${bmList}
	</div>
	

</body>
</html>