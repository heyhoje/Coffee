<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value='/gallery/coffee'/>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<input class="form-control" placeholder="제목" name="gal_title">
		</div>
		<input type="file" class="form-control" name="fileList">
		<input type="file" class="form-control" name="fileList">
		<input type="file" class="form-control" name="fileList">
		<button class="btn btn-danger">게시글 등록</button>
	</form>
</body>
</html>