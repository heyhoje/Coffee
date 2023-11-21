<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
</head>
<body>
	<h1>게시글 상세</h1>
	<div class="form-group">
		<label>제목</label>
		<div class="form-control">${gallery.gal_title}</div>
	</div>
	<div class="form-group">
		<label>작성자</label>
		<div class="form-control">${gallery.gal_me_user_id}</div>
	</div>
	<div class="form-group">
		<label>추천수</label>
		<div class="form-control">${gallery.gal_hits}</div>
	</div>
	
	<div class="form-group clearfix">
	</div>
	<div class="form-group">
		<label>내용</label>
		<div class="form-control" style="min-height: 400px">${gallery.gal_contents}</div>
	</div>
	
	<div class="form-group">
		<c:choose>
			<c:when test="${gallery.fileVoList.size() != 0 }">
				<label>첨부파일</label>
				<c:forEach items="${gallery.fileVoList }" var="file">
					<a class="form-control" href="<c:url value='/download${file.fi_name}'/>" download="${file.fi_ori_name}">${file.fi_ori_name}</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<label>첨부파일 없음</label>
			</c:otherwise>
		</c:choose>
	</div>
	<a href="<c:url value='/gallery/galleryList${cri.currentUrl }'/>" class="btn btn-outline-primary">목록으로</a>
	<c:if test="${user.me_id == gallery.gal_me_user_id}">
		<a href="<c:url value='/gallery/galleryUpdate?gal_num=${gallery.gal_num}'/>" class="btn btn-outline-warning">수정</a>
		<a href="<c:url value='/gallery/galleryDelete?gal_num=${gallery.gal_num}'/>" class="btn btn-outline-danger">삭제</a>
	</c:if>
	
	
	
	<!-- 추천 기능 자바스크립트 -->
	<script type="text/javascript">
		//추천 버튼을 클릭했을 때 콘솔창에 추천이라고 출력 
		$('.btn-like').click(function(){
			if('${user.me_user_id}' == ''){
				//alert('로그인한 회원만 이용이 가능합니다.');
				if(confirm('로그인 화면으로 이동하겠습니까?')){
					location.href = '<c:url value="/member/login"/>'
				}
				return;
			}
			let li_state = $(this).hasClass('btn-up')? 1 : -1;
			let data = {
				li_me_user_id : '${user.me_user_id}',
				li_gal_num: '${gallery.gal_num}',
				li_state : li_state
			};
			ajaxJsonToJson(false, 'post', 'gallery/like', data, (data)=>{
				if(data.res == 1){
					alert('추천했습니다.');		
				}else if(data.res == -1){
					alert('비추천했습니다.');
				}else if(data.res == 0){
					if(li_state == 1){
						alert('추천을 취소했습니다.');
					}
					else{
						alert('비추천을 취소했습니다.');
					}
				}
				diplayLikeBtn(data.res);
				$('.text-up').text(data.gallery.gal_hits);
			})
		})
		
		
		
		function diplayLikeBtn(li_state){
			let $upBtn = $('.btn-up');
			let $downBtn = $('.btn-down');
			
			$upBtn.removeClass('btn-primary').addClass('btn-outline-primary');
			$downBtn.removeClass('btn-danger').addClass('btn-outline-danger');
			
			if(li_state == 1){
				$upBtn.addClass('btn-primary').removeClass('btn-outline-primary');	
			}else if(li_state == -1){
				$downBtn.addClass('btn-danger').removeClass('btn-outline-danger');
			}
		}
		
	</script>

</body>
</html>