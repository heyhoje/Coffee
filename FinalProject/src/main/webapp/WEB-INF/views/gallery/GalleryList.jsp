<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
</head>
<body>
	<br>
	<h1>게시판</h1>
	<form action="" method="get">
	  <div class="input-group mt-5" >
	  	<div class="input-group-prepend">
		    <select class="form-control" name="type">
		      <option value="0" <c:if test="${pm.cri.type == '0'}">selected</c:if>>전체</option>
		      <option value="gal_title" <c:if test="${pm.cri.type == 'gal_title'}">selected</c:if>>제목</option>
		      <option value="gal_contents" <c:if test="${pm.cri.type == 'gal_contents'}">selected</c:if>>내용</option>
		    </select>
	    </div>
	    <input type="text" class="form-control" name="search" value="${pm.cri.search}">
	    <button class="btn btn-outline-success">검색</button>
	  </div>
	  <br>
	</form>
	<table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list}" var="gallery">
	      <tr>
	        <td>${gallery.gal_num}</td>
	        <td>
	        	<a href="<c:url value='/gallery/GalleryDetail${pm.cri.currentUrl}&gal_num=${gallery.gal_num}'/>">
	        	${gallery.gal_title}
	        	</a>
	        </td>
	        <td>${gallery.gal_me_user_id}</td>
	        <td>${gallery.gal_hits}</td>
	        <td>
	        	<c:if test="${user.me_authority == 'ADMIN'}">
					<a href="<c:url value='/gallery/GalleryUpdate?gal_num=${gallery.gal_num}'/>" class="btn btn-outline-info">수정</a>
					<a href="<c:url value='/gallery/GalleryDelete?gal_num=${gallery.gal_num}'/>" class="btn btn-outline-danger">삭제</a>
				</c:if>
			</td>

	      </tr>
      </c:forEach>
    </tbody>
  </table>
  <ul class="pagination justify-content-center">
  	<c:if test="${pm.prev}">
	    <li class="page-item">
	    	<a class="page-link" href="<c:url value='/gallery/GalleryList${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
	    </li>
    </c:if>
    
    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	    <li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
	    	<a class="page-link" href="<c:url value='/gallery/GalleryList${pm.cri.getUrl(i)}'/>">${i}</a>
	    </li>
    </c:forEach>
    <c:if test="${pm.next}">
	    <li class="page-item">
	    	<a class="page-link" href="<c:url value='/gallery/GalleryList${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
	    </li>
    </c:if>
  </ul>
  <a class="btn btn-outline-danger" href="<c:url value='/gallery/GalleryInsert'/>">글쓰기</a>
</body>
</html>