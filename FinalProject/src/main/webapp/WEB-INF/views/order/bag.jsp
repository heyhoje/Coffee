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
                <li>장바구니 얼마나 저장되는지는 잘 모릅니다. 아마 아이디에 따라 평생 저장될듯?</li>
                <li>옵션을 변경하려면 삭제후 처음부터 다시 해야하니 그냥 드세요.</li>
                <li>픽업 예약후 예정시간에 오지 않으면 제가 먹으니 시간에 늦지 않길 바라실게요</li>
                <li>한 번에 한 매장에서만 주문 됩니다. 다른 매장 품목 추가하시면 장바구니 리셋!</li>                
            </ul>
        </div>
        <div>
        	<img src="image/keyboard.jpg" alt="magic keyboard">
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
                <td><img src="image/keyboard.jpg" alt="magic keyboard"></td>
                <td id="menuName">${optionChoice.menu.mn_name}</td>
                <td>${optionChoice.oc_selected }</td>
                <td>
					<button onclick="updateQuantity(${index.index}, 'decrease')">-</button>
					<span id="quantity_${index.index}">${quantity}</span>
					<button onclick="updateQuantity(${index.index}, 'increase')">+</button>
		        </td>
                <td id="price_${index.index}">${sumPrice}</td>
                <td><button onclick="deleteThis(${index.index})">삭제</button></td>
            </tr>
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
            	<td colspan="2">전체 가격</td>
            	<td id="totalPrice">${totalPrice}</td>
            </tr>
        
        </table>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right" onclick="requestPay()">주문하기</button>
        </div>
    </section>
    
<script type="text/javascript">

var menuPrices = [];
var optionPrices = [];
var quantities = [];
var killAme = [];
var user = carpcarp; // ${user} 


<c:forEach items="${jangbaguni}" var="optionChoice" varStatus="vss">
    menuPrices[${vss.index}] = ${optionChoice.menu.mn_price};
    optionPrices[${vss.index}] = ${optionChoice.oc_selected_price};
    quantities[${vss.index}] = 1;
    killAme[${vss.index}] = ${optionChoice.oc_num};
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

var IMP = window.IMP; 
IMP.init("imp14674302"); 

var today = new Date();   
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;



function requestPay() {
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
	

    IMP.request_pay(
    	{
        pg : "danal_tpay",
        pay_method : 'card',
        merchant_uid: "IMP"+makeMerchantUid, 
        name : '커피의 민족',
        amount : totalPrice,
        buyer_email : 'Iamport@chai.finance',
        buyer_name : '아임포트 기술지원팀',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456'
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
            givePoint(user, totalPrice);
        } else {
            console.log(rsp);
        }
    });
}

function givePoint(user, num) {
	point = (num / 10);
	$.ajax({
        type: 'POST',
        url: '<c:url value="/order/bag2"/>', 
        data: { point : point
        		user : user},
        success: function(response) {
        },
        error: function(error) {
        }
    });
}


</script>

</body>
</html>