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
<style>
	h2 {
	margin: 10px 0; text-align: center;
	}
	.container {
	border: 5px soild black; 
	max-width: 1000px; margin: 0 auto;
	display: flex; flex-direction: row; flex-wrap: wrap;
	}
	
	.image-box, .content-box {
	    flex: 1; 
	    box-sizing: border-box;
	    padding: 20px; 
	}
	.cocntent-box {height: 400;}
	
	@media (max-width: 600px) {
	    .box {
	        width: 100%;
	    }
	}
	/* .box {
	width: 50%; height: 400px; float: left;
	}
	.container::after {
	content: ''; display: block; clear: both; */
	}
	hr {
	height: 2px; background-color: black; border: none;
	width: 350px; float: left;
	}
	
	.btn-outline-warning{
	border-radius: 30px; font-size: 15px; padding: 10px;
	}
	
</style>
</head>

<body>
	<h2 class="menudetail">메뉴상세</h2>
	<div class="container">
		<div class="image-box box">
			<image class="image-menu" src="<c:url value='/image/menu/${menu.image.im_name}'/>" width="400px" height="400px" alt="">
		</div>
		<div class="content-box box">
			<h4 class="menu-title">${menu.mn_name}</h4>
			<p class="menu-price">${menu.mn_price} 원</p>
			<hr><br><br>
			<p class="menu-content">${menu.mn_contents}</p>	
			
			<h4>옵션</h4>
				<c:forEach items="${option}" var="optionItem" varStatus="index">
				    <th>
				        <c:forEach items="${optionItem.optionValueList}" var="optionValue">
				            <c:choose>
				                <c:when test="${optionItem.os_num == 1}">
				                    <label><input type="radio" name="option1" value="${optionValue.ov_value} ${optionValue.ov_price}"  checked> ${optionValue.ov_value}</label>
				                </c:when>
				                <c:when test="${optionItem.os_num == 2}">
				                    <label><input type="radio" name="option2" value="${optionValue.ov_value} ${optionValue.ov_price}" checked> ${optionValue.ov_value}</label>
				                </c:when>
				                <c:when test="${optionItem.os_num == 3}">
				                    <label><input type="radio" name="option3" value="${optionValue.ov_value} ${optionValue.ov_price}" checked> ${optionValue.ov_value} +${optionValue.ov_price }원</label>
				                </c:when>
				                <c:when test="${optionItem.os_num == 4}">
				                    <label><input type="radio" name="option4" value="${optionValue.ov_value} ${optionValue.ov_price}" checked> ${optionValue.ov_value} +${optionValue.ov_price }원</label>
				                </c:when>
				            </c:choose>
				        </c:forEach>
				    </th>
				</c:forEach>
		    <br>
		    <button id="toTheBag" class="btn-outline-warning">장바구니 담기</button>
		    <a href="<c:url value='/order/bag'/>" class="btn-outline-warning">장바구니 이동</button> 
		</div>
	</div>
    <script type="text/javascript">
      $(document).ready(function () {
        $('#toTheBag').click(function () {
          // getter
          var optionVal1 = $('input[name="option1"]:checked').val();
          var optionVal2 = $('input[name="option2"]:checked').val();
          var optionVal3 = $('input[name="option3"]:checked').val();
          var optionVal4 = $('input[name="option4"]:checked').val();
          var optionAll = optionVal1 + ", " + optionVal2 + ", " + optionVal3 + ", " + optionVal4;
          alert(optionAll);

          // Create an object to send via AJAX
          var data = {
            optionAll: optionAll,
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
              alert("무언가 잘못 되어 장바구니에 안담겼을지도?");
            }
          });
        });
      });
    </script>
</body>
</html>