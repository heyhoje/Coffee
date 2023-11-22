<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사이트관리자 페이지</title>
 <link rel="stylesheet" type="text/css" href="/resources/css/adminhome.css">
	
</head>
<body>
	
	<h2 class="bm-subject">사이트 관리자 페이지 입니다.</h2>
	<div class="bm-menu-container">
	    <div class="btn-group btn-group-lg">
	        <a href="<c:url value='/admin/bmember'/>" class="btn btn-outline-primary">사업자 회원가입 승인</a>
	        <a href="<c:url value='/admin/bstore'/>" class="btn btn-outline-primary">매장등록 승인</a>
	        <a href="<c:url value='/admin/ad'/>" class="btn btn-outline-primary">프로모션 관리</a>
	        <a href="<c:url value='/admin/review'/>" class="btn btn-outline-primary">(일반회원)리뷰 관리</a>
	    </div>
	</div>
	<div class="update-table-container" style="margin-top:50px; text-align: center;">
		<div class="update-table-box width" style="width: 1000px; margin: 0 auto;">
	        <table class="table" >
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>업데이트 예정 내용</th>
	                    <th>비고</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>1</td>
	                    <td>관리자 : /admin/home 에서도 '관리자님 어서오세요' 표시</td>
	                    <td>금일예정</td>
	                </tr>
	                <tr>
	                    <td>2</td>
	                    <td>서버 : 첨부파일 이미지 등록</td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>3</td>
	                    <td>고객센터 : 일반/사업자회원의 요구사항 수집</td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>4</td>
	                    <td></td>
	                    <td></td>
	                </tr>
	            </tbody>
	        </table>
        </div>
	</div>	
		<!-- 홈에 관리자 권한 없이 들어왔을때, 로그인 알람을 띄운다. -->	
		<%-- if(me_user_id == '' || me_authority != 'admin'){
		if(confirm('관리자 권한이 필요합니다. 관리자로 로그인 하시겠습니까?')){
			location.href = '<c:url value="/admin/home"/>'
			}
			return;
		} --%>
	
</body>
<!-- 
	<script type="text/javascript">
		var me_user_id = 'some_value';
		var me_authority = 'user';
		
		$('a').click(function(){
			if(me_user_id == '' || me_authority != 'admin'){
				alert('관리자만 접근 가능합니다.')
				if(confirm('로그인 화면으로 이동하겠습니까?')){
					location.href = '<c:url value="/member/login"/>' // 팝업이면 로그인 경로로 어떻게 접근함?
				}
				return;
			}
		});
	</script> -->
</html>