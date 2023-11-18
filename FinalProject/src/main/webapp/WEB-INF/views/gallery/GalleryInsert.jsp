<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>갤러리 게시글 작성</title>
	
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/GalleryInsert.css">
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
		</form>
		<form th:action="@{/uploadImage}" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="imageFile" class="form-label">이미지 업로드</label>
                <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" required>
            </div>

            <button type="submit" class="btn btn-primary">게시글 작성</button>
        </form>
    </div>

 
    <!-- 부트스트랩 JS (필요에 따라 추가) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>