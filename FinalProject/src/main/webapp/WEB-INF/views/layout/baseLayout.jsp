<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>

</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="login"/>
    <div class="container-fluid float-left" style="min-height: calc(100vh - 66px - 184px)">        
    	<tiles:insertAttribute name="body" />
    </div>                                                  
    <tiles:insertAttribute name="footer" />
</body>
</html>
