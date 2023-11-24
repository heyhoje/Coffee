<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
 <link rel="stylesheet" href="<c:url value='/resources/css/confirm.css'/>">
<meta charset="UTF-8">
</head>
<body>
	<div class="confirm-backgroundbox" img="/resources/images/barista3.jpg" >
		<div class="confirmpop-layout">
		<div class="card mt-50 mb-50">
	    <div class="col d-flex"><span class="text-muted" id="orderno">#주문번호: ${orderMenu.or_num}</span></div>

    <div class="title mx-auto"> 주문이 접수되었습니다.</div>
    <div class="main"> <span id="sub-title">
            <p><b>주문목록</b></p>
        </span>
    <div class="row row-main">
        <div class="col-3">주문시간 <br> ${orderMenu.or_time }</div>
        <div class="col-3">주문메뉴 <br> ${orderMenu.or_drinks } </div>
        <div class="col-3">선택옵션 <br>${orderMenu.or_selectOption } </div>
        <div class="col-3">상태 : ${orderMenu.or_status} </div>
    </div>
</div>
</div>
</div>
</div>
</body>
	


</html> 