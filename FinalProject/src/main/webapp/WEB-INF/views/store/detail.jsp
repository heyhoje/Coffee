<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>메뉴상세 주문</title>
	<!-- style css -->
    <link rel="stylesheet" href="<c:url value='/resources/css/detail.css'/>">

</head>

<body>
	<h2 class="menudetail">메뉴상세</h2>
	<div class="container-box">
		<div class="image-layout">
		<div class="image-box">
			<image class="image-menu" src="<c:url value='/image/menu/${menu.image.im_name}'/>" width="400px" height="400px" alt="">
		</div>
		</div>
	<div class="content-layout">
		<div class="content-box">
			<h4 class="menu-title">${menu.mn_name}</h4>
			<p class="menu-price">${menu.mn_price} 원</p>
			<p class="menucontent">${menu.mn_contents}</p>	
			
			<h4>옵션</h4>
				<div class="option-box">
				    <c:forEach items="${option}" var="optionItem" varStatus="index">
				        <th><hr>
				            <c:forEach items="${optionItem.optionValueList}" var="optionValue">
				                <c:forEach begin="1" end="${optionItem.os_optionNum}" var="i">
				                    <c:choose>
				                        <c:when test="${optionItem.os_optionNum == i}">
				                            <label><input type="radio" name="option${i}" value="${optionValue.ov_value} ${optionValue.ov_price}" checked> ${optionValue.ov_value} ${optionValue.ov_price}</label><br>
				                        </c:when>
				                    </c:choose>
				                </c:forEach>
				            </c:forEach>
				        </th>
				    </c:forEach>
				</div>
		    <br>
		    <div class="detailbutton-box">
		    <button id="toTheBag" class="btn-outline-warning">장바구니 담기</button>
		    <a href="<c:url value='/order/bag'/>" id="toTheBag" class="btn-outline-warning">장바구니 이동</a> 
		    </div>
		</div>
		</div>
	</div>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
  $(document).ready(function () {
    $('#toTheBag').click(function () {
      var optionVal = [];
      var optionALL = '';

      // Loop through each radio button with name starting with "option"
      $('input[type=radio][name^="option"]').each(function () {
        // Check if the radio button is checked
        if ($(this).prop('checked')) {
          // Get the value and add it to the optionVal array
          optionVal.push($(this).val());
        }
      });

      // Concatenate the selected values with ","
      optionALL = optionVal.join(',');

      // Create an object to send via AJAX
      var data = {
        optionAll: optionALL,
        menu_name: "${menu.mn_name}",
        menu_price: "${menu.mn_price}",
        menu_num: "${menu.mn_num}"
      };

      // Send the data to /order/bag using AJAX
      $.ajax({
        type: "POST",
        url: "/order/bag1",
        data: data,
        success: function (response) {
          // Handle the response from the server if needed
          alert("장바구니에 담겼습니다!");
        },
        error: function (error) {
          // Handle any errors that occur during the AJAX request
          alert("로그인이 필요합니다.");
        }
      });
    });
  });
</script>
</body>
</html>