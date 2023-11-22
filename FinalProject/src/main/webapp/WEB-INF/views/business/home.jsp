<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h3 style="text-align: center; margin-top: 100px; font-family: 'BM HANNA Pro', sans-serif;">사업자페이지</h3>
	<!-- ManagerVO에서 가져올 수 있는 값 : (bm_manager, bm_store_name) 회원가입 승인 후, 보이는 페이지 맞음ㅇㅇ st_num 상관없이 보임.-->
	<!-- 띄워지는 정보가 어떤 것에 대한 정보인지, (성함 : , 매장명 : )  -->
	<h3 style="text-align: center; margin-top: 100px; font-family: 'BM HANNA Pro', sans-serif;">담당자 : ${buser.bm_manager}</h3>
	<h3 style="text-align: center; margin-top: 100px; font-family: 'BM HANNA Pro', sans-serif;">매장명 : ${buser.bm_store_name}</h3>
	<div style="margin: 0 auto; width:300px; height:300px; border:1px solid black; text-align: center; margin-top: 100px; 
		font-family: 'BM HANNA Pro', sans-serif;">${buser.bm_session_id}</div> <!-- 로고도 아니고, 세션아이디가 div에 들어가야할 이유는...??? -->
	
</body>
</html>