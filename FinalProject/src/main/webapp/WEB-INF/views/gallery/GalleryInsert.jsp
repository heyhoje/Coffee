<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

    <div class="container mt-5">
        <h2 class="GalleryInsert-title">갤러리 게시글 작성</h2>

        <!-- 게시글 작성 폼 -->
        <form action="<c:url value='/gallery/galleryInsert'/>" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="gal_num" value="${gal_num}">
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" id="title" name="gal_title" placeholder="제목을 입력하세요" required>
            </div>
            
             <div class="mb-3">
                <label for="writer" class="form-label">작성자</label>
                <input type="text" class="form-control" name="gal_me_user_id" value="${user.me_user_id }" readonly>
            </div>

            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" id="content" name="gal_contents" rows="10" placeholder="내용을 입력하세요" required></textarea>
            </div>
           <div class="form-group">
			<label>첨부파일</label>
			<input type="file" class="form-control" name="files" required>
            </div>
            <button type="submit" class="btn btn-primary">게시글 작성</button>
        </form>
    </div>

 
</body>
</html>