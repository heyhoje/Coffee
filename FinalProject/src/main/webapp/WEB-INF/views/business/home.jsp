<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h3 style="text-align: center; margin-top: 100px;">사업자페이지</h3>
	<h3 style="text-align: center; margin-top: 100px;">${buser.bm_manager}</h3>
	<h3 style="text-align: center; margin-top: 100px;">${buser.bm_store_name}</h3>
	<div style="margin: 0 auto; width:300px; height:300px; border:1px solid black; text-align: center; margin-top: 100px;">${buser.bm_session_id}</div>
	
</body>
</html>