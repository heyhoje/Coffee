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
			<hr><br><br>
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
		    <button id="deleteMenu" class="btn-outline-warning">메뉴 삭제하기</button>
		    <a href="<c:url value='/business/realU/${st_num}/${menu.mn_num}'/>" id="updateMenu" class="btn-outline-warning">메뉴 수정하기</a> 
		    </div>
		</div>
		</div>
	</div>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>	
<script type="text/javascript">
$(document).ready(function() {
	$('#deleteMenu').click(function() {
		var data = {
			menu_num : "${menu.mn_num}"
		};
         $.ajax({
             type: "POST",
             url: "/business/realD",
             data: data,
             success: function (response) {
               // Handle the response from the server if needed
               alert("삭제되었습니다!.");
             },
             error: function (error) {
               // Handle any errors that occur during the AJAX request
               alert("이미 삭제 되었거나 잘못된 접근입니다.");
             }
		});
	});
});




</script>
</body>
</html>