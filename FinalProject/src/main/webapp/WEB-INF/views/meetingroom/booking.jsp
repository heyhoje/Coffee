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
    <script>
      var IMP = window.IMP;
      IMP.init("imp14674302");

      function requestPay() {
          IMP.request_pay({
              pg : "danal_tpay",
              pay_method : 'card',
              merchant_uid: "IMP"+makeMerchantUid, 
              name : '당근 10kg',
              amount : 1004,
              buyer_email : 'Iamport@chai.finance',
              buyer_name : '아임포트 기술지원팀',
              buyer_tel : '010-1234-5678',
              buyer_addr : '서울특별시 강남구 삼성동',
              buyer_postcode : '123-456'
          }, function (rsp) { // callback
              if (rsp.success) {
                  console.log(rsp);
              } else {
                  console.log(rsp);
              }
          });
      }
    </script>
    
 	
</head>
<body>
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>당일 예약 취소는 불가합니다.</li>
                <li>취객은 입실이 불가합니다.</li>
                <li>외부음료와 음식물은 반입이 불가합니다.</li>
                <li>시설 및 물품 파손시 사전상의 후에 퇴실 해주시기 바랍니다.</li>                
            </ul>
        </div>
      </div>
      	<div class="cart-layout">
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td colspan="2">예약정보</td>
                        <td>주소</td>
                        <td>상품금액</td>
                        <td>인원</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart__list__detail">
                        <td><input type="checkbox"></td>
                        <td><img src="image/keyboard.jpg" alt="magic keyboard"></td>
                        <td><a href="#">애플 공식 브랜드스토어</a><span class="cart__list__smartstore"> 스마트스토어</span>
                            <p>Apple 매직 키보드 - 한국어(MK2A3KH/A)</p>
                            <sapn class="price">116,62원</sapn><span
                                style="text-decoration: line-through; color: lightgray;">119,000</span>
                        </td>
                        <td class="cart__list__option">
                            <p>모델명 : 키보드 - 한국어 MK2A3KH/A / 1개</p>
                            <button class="cart__list__optionbtn">주문조건 추가/변경</button>
                        </td>
                        <td><span class="price">116,620원</span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <td>무료</td>
                    </tr>
                    <tr class="cart__list__detail">
                        <td style="width: 2%;"><input type="checkbox"></td>
                        <td style="width: 13%;">
                            <img src="image/mouse.jpg" alt="magic mouse">
                        </td>
                        <td style="width: 27%;"><a href="#">컴퓨존</a><span class="cart__list__smartstore"> 스마트스토어</span>
                            <p>[애플] Magic Mouse [MK2E3KH/A]</p>
                            <span class=" price">88,900원</span>
                        </td>
                        <td class="cart__list__option" style="width: 27%;">
                            <p>상품 주문 수량: 1개</p>
                            <button class="cart__list__optionbtn">주문조건 추가/변경</button>
                        </td>
                        <td style="width: 15%;"><span class="price">88,900원</span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <td style="width: 15%;">무료</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"><input type="checkbox"> <button class="cart__list__optionbtn">선택상품 삭제</button>
                            <button class="cart__list__optionbtn">선택상품 찜</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
       </div>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right" onclick="requestPay()">예약하기</button>
        </div>
    </section>
</body>
