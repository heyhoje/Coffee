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
	    <div class="col d-flex"><span class="text-muted" id="orderno">#주문번호:1</span></div>

    <div class="title mx-auto"> 주문이 접수되었습니다.</div>
    <div class="main"> <span id="sub-title">
            <p><b>주문목록</b></p>
        </span>
        <div class="row row-main">
            <div class="col-3"> <img class="img-fluid" src="이미지1"> </div>
            <div class="col-6">
                <div class="row d-flex">
                    <p><b>${optionChoice.menu.mn_name}아메리카노</b></p>
                </div>
                <div class="row d-flex">
                    <p class="text-muted">옵션:없음 수량:1개</p>
                </div>
            </div>
            <div class="col-3 d-flex justify-content-end">
                <p><b>3000원</b></p>
            </div>
        </div>
        <div class="row row-main">
            <div class="col-3"> <img class="img-fluid" src="이미지2"> </div>
            <div class="col-6">
                <div class="row d-flex">
                    <p><b>오늘의커피</b></p>
                </div>
                <div class="row d-flex">
                    <p class="text-muted">옵션:샷추가 수량:1개</p>
                </div>
            </div>
            <div class="col-3 d-flex justify-content-end">
                <p><b>4000원</b></p>
            </div>
        </div>
        <div class="row row-main">
            <div class="col-3 "> <img class="img-fluid" src="이미지3"> </div>
            <div class="col-6">
                <div class="row d-flex">
                    <p><b>카페라떼</b></p>
                </div>
                <div class="row d-flex">
                    <p class="text-muted">옵션:샷추가 수량:1개</p>
                </div>
            </div>
            <div class="col-3 d-flex justify-content-end">
                <p><b>3000원</b></p>
            </div>
        </div>
        <hr>
        <div class="total">
            <div class="row">
                <div class="col"> <b> 총금액:</b> </div>
                <div class="col d-flex justify-content-end"> 10000원<b></b> </div>
            
        </div>
    </div>
</div>
</div>
</div>
</div>
</body>
	


</html> 