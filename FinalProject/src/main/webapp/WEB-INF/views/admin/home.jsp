<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사이트관리자 페이지</title>

	<style>
		.container {
		margin: 0 auto; max-width: 1000px;
		}
		.btn-group {
	    display: flex;
	    justify-content: center;
	  	}
	  	
	</style>
</head>
<body>
	<h2 style="text-align: center;" class="mt-3 mb-3">사이트 관리자 페이지 입니다.</h2>
	
	
	<div class="container">
	  <div class="btn-group btn-group-lg">
	    <a href="<c:url value='/admin/bmember'/>" class="btn btn-outline-primary">사업자 회원가입 승인</a>
	    <a href="<c:url value='/admin/bstore'/>" class="btn btn-outline-primary">매장등록 승인</a>
	    <a href="<c:url value='/admin/ad'/>" class="btn btn-outline-primary">프로모션 관리</a>
	    <a href="<c:url value='/admin/review'/>" class="btn btn-outline-primary">(일반회원)리뷰 관리</a>
	  </div>
	</div>
		
		<!-- 홈에 관리자 권한 없이 들어왔을때, 로그인 알람을 띄운다. -->	
		<%-- if(me_user_id == '' || me_authority != 'admin'){
		if(confirm('관리자 권한이 필요합니다. 관리자로 로그인 하시겠습니까?')){
			location.href = '<c:url value="/admin/home"/>'
			}
			return;
		} --%>
	
	<textarea>23/11/07 회원가입 승인 페이지에서 승인/거절된 회원 확인 및 취소버튼 구현도 필요할지...
	이건 하게된다면 나중에 다음 파트까지 하고 다시 돌아오리라</textarea>
	
	
	<p>흠 뭐가 필요하죠</p>
	<p>들어온 요청을 게시판 형식으로 볼건가요?</p>
	<p>승인버튼만 추가하면 되나요</p>
	<P>점주요청(회원가입 승인대기->승인완료->매장등록)</P>
	<p>프로모션(승인대기->승인완료)</p>
	(갤러리 그냥 올리면됨)
	crud - 갤러리, 프로모션
	
	선택) 고객센터 문의받고 답변
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