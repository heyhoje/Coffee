<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!--  style -->
	<link rel="stylesheet" href="<c:url value='/resources/css/booking.css'/>">
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
    <section class="cart">
      	<div class="cart-layout">
        <table class="cart__list">
                <thead>
                    <tr>
                        <td>예약시간</td>
                        <td colspan="2">주소</td>
                        <td>상품금액</td>
                    </tr>
                </thead>
                <c:forEach items="${rBasketList}" var="rBasket" varStatus="rvs">
				    <c:set var="roomPrice" value="${rBasket.room_price}"/>
				    <c:set var="startTime" value="${rBasket.rs_start}"/>
				    <c:set var="endTime" value="${rBasket.rs_start + 1}"/>
				    
				    <tr>
				        <td>${startTime}:00 ~ ${endTime}:00</td>
				        <td>${rBasket.bm_store_name}</td>
				        <td>${rBasket.bm_address} ${rBasket.bm_address2}</td>
				        <td>${roomPrice}</td>
				    </tr>
				</c:forEach>   
                 <c:set var="totalPrice" value="0"/>
                 <c:forEach items="${rBasketList}" var="rBasketList" varStatus="rvs">
                 	<c:set var="totalPrice" value="${totalPrice + roomPrice }"/>
       			 </c:forEach>
       			 <tr>
	        		<td colspan="2"></td>
	            	<td colspan="2">전체 가격</td>
	            	<td id="totalPrice">${totalPrice}</td>
         		 </tr>
        </table>
       </div>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right" onclick="requestPay()">예약하기</button>
        </div>
    </section>
    
    <script>
      var IMP = window.IMP;
      IMP.init("imp14674302");
      var today = new Date();   
      var hours = today.getHours(); // 시
      var minutes = today.getMinutes();  // 분
      var seconds = today.getSeconds();  // 초
      var milliseconds = today.getMilliseconds();
      var makeMerchantUid = hours +  minutes + seconds + milliseconds;
      var totalPrice = 0;
      var rs_room_numList = [];
      var rs_startList = [];
      <c:forEach items="${rBasketList}" var="rBasketList" varStatus="rvs">
        rs_room_numList.push('${rBasketList.rs_room_num}');
        rs_startList.push('${rBasketList.rs_start}');
		var roomPrice = ${rBasketList.room_price};
      	totalPrice = totalPrice + roomPrice;
	  </c:forEach>
		

      function requestPay() {
          IMP.request_pay({
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
                  afterPay();
              } else {
                  console.log(rsp);
              }
          });
      }
      
      function afterPay() {
    	  var rs_room_num = rs_room_numList.join(',');
    	  var rs_start = rs_startList.join(',');
    	  
    	  $.ajax({
    	        type: 'POST',
    	        url: '<c:url value="/meetingroom/bookingend"/>', 
    	        data: {
    	        	rs_start: rs_start,
    	        	rs_room_num: rs_room_num
    	        	},
    	        success: function(response) {
    	        	location.reload();
    	        },
    	        error: function(error) {
    	            console.error('Error deleting item: ', error);
    	        }
    	    });
      }
    </script>    
</body>
