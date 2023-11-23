<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!--  style -->
	<link rel="stylesheet" href="<c:url value='/resources/css/bag.css'/>">
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> 
    
</head>
<body>
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>한 번에 한 매장에서만 주문 됩니다. 다른 매장 품목 추가하시면 장바구니가 초기화됩니다.</li>
                <li>주문을 잘못했거나 옵션을 수정하려면 카운터에 문의하세요.</li>
                <li>주문 후 예정 시간에 늦지 않게 오시는걸 권장합니다.</li>
            </ul>
        </div>
        <div class="bagst_info">
        	<div>가게 이름 : ${shop[0].bm_store_name}</div>   
        	<div>가게 주소 : ${shop[0].bm_address}</div>
        </div>        

        <table class="cart__list">
         	<tr>
				<td colspan="2">상품정보</td>
                <td>옵션</td>
                <td>수량</td>
                <td>상품금액</td>
                <td>품목삭제</td>
            </tr>
		<c:forEach items="${jangbaguni}" var="optionChoice" varStatus="index">
		    <c:set var="menuPrice" value="${optionChoice.menu.mn_price}"/>
		    <c:set var="optionPrice" value="${optionChoice.oc_selected_price}"/>
		    <c:set var="quantity" value="1" />
		    <c:set var="sumPrice" value="${menuPrice + optionPrice}"/>
            <tr>
                <td id="menuName">${optionChoice.menu.mn_name}</td>
                <td>
                <td>${optionChoice.oc_selected }</td>
                <td>
					<button class="plusbtn" onclick="updateQuantity(${index.index}, 'decrease')">-</button>
					<span id="quantity_${index.index}">${quantity}</span>
					<button class="minusbtn" onclick="updateQuantity(${index.index}, 'increase')">+</button>
		        </td>
                <td id="price_${index.index}">${sumPrice}</td>
                <td><button class="deletepopbtn" onclick="openPopup(${index.index})">삭제</button>
                <td>
            	</tr>
            	<div id="overlay">
					  <div id="popup">
					    <p>정말 삭제하시겠습니까?</p>
					    <button id="btnYes" onclick="deleteThis(${index.index})">예</button>
					    <button id="btnNo" onclick="handleResponse('아니오')">아니오</button>
					  </div>
				</div>
				<div id="overlay2">
					  <div id="popup2">
					    <p>정말 주문하시겠습니까?</p>
					    <button id="btnYes" onclick="requestPay()">예</button>
					    <button id="btnNo" onclick="handleResponse2('아니오')">아니오</button>
					  </div>
				</div>
        </c:forEach>
        		
		<c:set var="totalPrice" value="0" />
		<c:forEach items="${jangbaguni}" var="optionChoice" varStatus="index">
		    <c:set var="menuPrice" value="${optionChoice.menu.mn_price}" />
		    <c:set var="optionPrice" value="${optionChoice.oc_selected_price}" />
		    <c:set var="sumPrice" value="${menuPrice + optionPrice}" />
		    <c:set var="totalPrice" value="${totalPrice + sumPrice}" />
		</c:forEach>        
        	<tr>
        		<td colspan="2"></td>
            	<td colspan="2" style="color:black; font-weight:bold;">전체 가격</td>
            	<td id="totalPrice">${totalPrice}원</td>
            </tr>
        
        </table>
        <div class="bagpoint-box">
        	<div>보유 포인트 : ${point }</div>
        	<input type="number" id="usePoint" placeholder="사용할 Point를 입력해주세요." value="0"/>
        </div>
        
        
        <div class="cart__mainbtns">
        	<div class="cart-bigorder-leftbox">
            	<a class="cart-bigorder-left" href="<c:url value='/store/menu/1/1'/>">쇼핑 계속하기</a>
            </div>
            <button class="cart__bigorderbtn right" onclick="requestPay()">주문하기</button>
            <!--onclick="openPopup2()"-->
        </div>
     </section>
    
<script type="text/javascript">

var menuPrices = [];
var optionPrices = [];
var quantities = [];
var killAme = [];
var user = "";
var menuNameList = [];
var menuNumList = [];
var selectOptionList = [];
var IMP = window.IMP; 
IMP.init("imp14674302"); 
var today = new Date();   
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;



<c:forEach items="${jangbaguni}" var="optionChoice" varStatus="vss">
    menuPrices[${vss.index}] = ${optionChoice.menu.mn_price};
    optionPrices[${vss.index}] = ${optionChoice.oc_selected_price};
    quantities[${vss.index}] = 1;
    killAme[${vss.index}] = ${optionChoice.oc_num};
    menuNameList.push('${optionChoice.menu.mn_name}');
    menuNumList.push('${optionChoice.menu.mn_num}');
	selectOptionList.push('${optionChoice.oc_selected}');
</c:forEach>

function updateQuantity(num, operation) {
    var quantityField = document.getElementById('quantity_' + num);
    var priceField = document.getElementById('price_' + num);
    var quantity = parseInt(quantityField.textContent);
    var menuPrice = menuPrices[num];
    var optionPrice = optionPrices[num];
	
    if (operation === 'increase') {
        quantity++;
    } else if (operation === 'decrease' && quantity > 1) {
        quantity--;
    }

    quantityField.textContent = quantity;

    var sumPrice = (menuPrice + optionPrice) * quantity;
    priceField.textContent = sumPrice;

    // 전체 가격 업데이트
    updateTotalPrice();
}

function updateTotalPrice() {
    var totalPrice = 0;
    
    <c:forEach items="${jangbaguni}" var="optionChoice" varStatus="vs">
        var quantity = parseInt(document.getElementById('quantity_' + ${vs.index}).textContent);
        var menuPrice = ${optionChoice.menu.mn_price};
        var optionPrice = ${optionChoice.oc_selected_price};
        
        var sumPrice = (menuPrice + optionPrice) * quantity;
        totalPrice += sumPrice;
    </c:forEach>
    
    document.getElementById('totalPrice').textContent = totalPrice;
}

function deleteThis(numnum) {
	var oc_num = killAme[numnum];
    // Ajax를 이용하여 서버에 삭제 요청을 보냄
    $.ajax({
        type: 'POST',
        url: '<c:url value="/order/bag"/>', 
        data: { oc_num: oc_num },
        success: function(response) {
            updateTotalPrice();
            alert("물품이 삭제 되었습니다.");
            location.reload();
        },
        error: function(error) {
            console.error('Error deleting item: ', error);
        }
    });
}
function openPopup(${index.index}) {
    document.getElementById('overlay').style.display = 'flex';
	}
function openPopup2() {
    document.getElementById('overlay2').style.display = 'flex';
	}

function closePopup() {
    document.getElementById('overlay').style.display = 'none';
}

function closePopup2() {
    document.getElementById('overlay2').style.display = 'none';
}

function handleResponse(response) {
    closePopup();
}
function handleResponse2(response) {
    closePopup2();
}
function redirectToMainPage(){
	window.location.href = "/order/confirm";
}

function requestPay() {
	var usePoint = 0;
	var totalPrice = 0;
	var menuName = '';
	
    <c:forEach items="${jangbaguni}" var="optionChoice" varStatus="vs">
	    var quantity = parseInt(document.getElementById('quantity_' + ${vs.index}).textContent);
	    var menuPrice = ${optionChoice.menu.mn_price};
	    var optionPrice = ${optionChoice.oc_selected_price};
	    
	    var sumPrice = (menuPrice + optionPrice) * quantity;
	    totalPrice += sumPrice;
	</c:forEach>
	
	document.getElementById('totalPrice').textContent = totalPrice;
	usePoint = parseInt(document.getElementById('usePoint').value);
	var newTotalPrice = totalPrice - usePoint;
	
	
	if(newTotalPrice == 0) {
		allInOneAfterPay(totalPrice, usePoint);
	}else {
	    IMP.request_pay(
	    	{
	        pg : "danal_tpay",
	        pay_method : 'card',
	        merchant_uid: "IMP"+makeMerchantUid, 
	        name : '커피의 민족',
	        amount : newTotalPrice,
	        buyer_email : 'Iamport@chai.finance',
	        buyer_name : '아임포트 기술지원팀',
	        buyer_tel : '010-1234-5678',
	        buyer_addr : '서울특별시 강남구 삼성동',
	        buyer_postcode : '123-456'
	    }, function (rsp) { // callback
	        if (rsp.success) {
	            console.log(rsp);
	    		allInOneAfterPay(totalPrice, usePoint);
	        } else {
	            console.log(rsp);
	        }
	    });
	}
}

function allInOneAfterPay(totalPrice, usePoint, user) {
	
	var point = totalPrice - usePoint;
    var menuName = menuNameList.join(',');
    var menuNum = menuNumList.join(',');

	console.log({
        point: point,
        usePoint : usePoint,
        user: user,
        menuName: menuName,
        menuNum: menuNum
    });
	
    $.ajax({
        type: 'POST',
        url: '<c:url value="/order/bagend"/>',
        data: {
            point: point,
            usePoint : usePoint,
            user: "carpcarp",
            menuName: menuName,
            menuNum: menuNum
        },
        success: function (response) {
        	alert('주문이 완료되었습니다.');
        	 	PrintAfterPay();	 
        		//redirectToMainPage();
        },
        error: function (error) {
            console.error('Error in allInOneAfterPay:', error);
            alert(error.responseText); // Display the error message
        }
    });
}
function PrintAfterPay() {
	
	var selectOption = selectOptionList.join(',');
    var menuName = menuNameList.join(',');

	console.log({
        selectOption: selectOption,
        menuName: menuName,
    });
	
    $.ajax({
        type: 'POST',
        url: '<c:url value="/call/order"/>',
        data: {
        	  selectOption: selectOption,
              menuName: menuName,
              st_num: ${shop[0].st_num}
              
        },
        success : function(data){
        	
        },
        error : function(a){
        	console.log(a)
        }
    });
}


</script>

</body>
</html>