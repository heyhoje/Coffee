<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로모션 승인 페이지</title>
</head>
<body>

	<div class="container">
	<h4 class="pt-4">프로모션 승인</h4>
		            
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>타입</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<tbody>
				<!-- ${prList}에서 객체를 하나 꺼내서 pr에 넣는다. 객체.속성명 -->
				<c:forEach items="${prList}" var="pr">
					<tr>
						<td>${pr.pr_num}</td>
						<td>${pr.pr_subject}</td>
						<td>${pr.pr_contents}</td>
						<td>${pr.pr_type}</td>
						<td><button class="btn btn-outline-primary">승인</button>&nbsp;<button class="btn btn-outline-danger">거절</button></td>
					</tr>
				</c:forEach>
			
			
			</tbody>
		</table>
		${prList}
	</div>
</body>
</html>