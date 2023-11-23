<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h3
		style="text-align: center; margin-top: 100px; font-family: 'BM HANNA Pro', sans-serif;">사업자페이지</h3>
	<!-- ManagerVO에서 가져올 수 있는 값 : (bm_manager, bm_store_name) 회원가입 승인 후, 보이는 페이지 맞음ㅇㅇ st_num 상관없이 보임.-->
	<!-- 띄워지는 정보가 어떤 것에 대한 정보인지, (성함 : , 매장명 : )  -->
	<h3
		style="text-align: center; margin-top: 100px; font-family: 'BM HANNA Pro', sans-serif;">담당자
		: ${buser.bm_manager}</h3>
	<h3
		style="text-align: center; margin-top: 100px; font-family: 'BM HANNA Pro', sans-serif;">매장명
		: ${buser.bm_store_name}</h3>
	<div>
		<form action="/approvalcheck" method="POST">
			<input type="hidden" value="${buser.bm_id}">
			<button	style="margin:0 auto; display:block; margin-top:10px; width: 200px; height: 50px; border: 1px solid black; border-radius: 5px; background-color: white;">승인상태확인하기</button>
		</form>
	</div>
	<div class="manager-img-layout">
		<div
			style="justify-content:center; margin: 0 auto; width: 300px; height: 300px; text-align: center; margin-top: 50px; font-family: 'BM HANNA Pro', sans-serif; display: flex; margin-bottom: 50px;">
			<image class="image-menu"
				src="<c:url value='https://lh3.googleusercontent.com/p/AF1QipOdVf5kCB8mloB4lfb4d2_W1IuUOE4NXfN8vob_=s680-w680-h510'/>">
		</div>
	</div>
</body>

</html>