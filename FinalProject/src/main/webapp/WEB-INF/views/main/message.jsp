<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
</head>
<body>
		<script type="text/javascript">
	let msg = '${msg}';
	let url = '${url}';
	msg = msg == '' ? '잘못된 접근입니다.' : msg;
	alert(msg,url);
	location.href = '<c:url value="/"/>' + url;
	
	</script>
</body>
</html>