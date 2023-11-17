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
			<h4 class="menu-title"><input type="text" name="mn_name" value="${menu.mn_name}"></h4>
			<p class="menu-price"><input type="number" name="mn_price" value="${menu.mn_price}"></p>
			<hr><br><br>
			<p class="menucontent"><input type="text" name="mn_contents" value="${menu.mn_contents}"></p>	
			
			<h4>옵션</h4>
				<div class="option-box">
				    <c:forEach items="${option}" var="optionItem" varStatus="opIndex">
				        <th><hr>
				            <c:forEach items="${optionItem.optionValueList}" var="optionValue">
				                <c:forEach begin="1" end="${optionItem.os_optionNum}" var="i">
				                    <c:choose>
				                        <c:when test="${optionItem.os_optionNum == i}">
				                            <label><input type="text" name="option${i}" value="${optionValue.ov_value}">
				                                <input type="number" name="optionprice${i}" value="${optionValue.ov_price}"></label><br>
				                        </c:when>
				                    </c:choose>
				                </c:forEach>
				            </c:forEach>
				        </th>
				    </c:forEach>
				</div>
		    <br>
		    <div class="detailbutton-box">
		    <button id="updateMenu" class="btn-outline-warning">수정 완료</button>
		    </div>
		</div>
		</div>
	</div>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>	
<script type="text/javascript">
$(document).ready(function() {
    $('#updateMenu').click(function() {
        var option1List = [];
        var optionprice1List = [];
        var option2List = [];
        var optionprice2List = [];
        var option3List = [];
        var optionprice3List = [];
        var option4List = [];
        var optionprice4List = [];

        // 옵션 값들을 배열에 수집
        <c:forEach items="${option}" var="optionItem">
            <c:forEach items="${optionItem.optionValueList}" var="optionValue">
                <c:choose>
                    <c:when test="${optionItem.os_optionNum == 1}">
                        option1List.push('${optionValue.ov_value}');
                        optionprice1List.push('${optionValue.ov_price}');
                    </c:when>
                    <c:when test="${optionItem.os_optionNum == 2}">
                        option2List.push('${optionValue.ov_value}');
                        optionprice2List.push('${optionValue.ov_price}');
                    </c:when>
                    <c:when test="${optionItem.os_optionNum == 3}">
                        option3List.push('${optionValue.ov_value}');
                        optionprice3List.push('${optionValue.ov_price}');
                    </c:when>
                    <c:when test="${optionItem.os_optionNum == 4}">
                        option4List.push('${optionValue.ov_value}');
                        optionprice4List.push('${optionValue.ov_price}');
                    </c:when>
                </c:choose>
            </c:forEach>
        </c:forEach>

        var data = {
        	mn_num : ${menu.mn_num},
            mn_name: $("input[name='mn_name']").val(),
            mn_price: $("input[name='mn_price']").val(),
            mn_contents: $("input[name='mn_contents']").val(),
            option1: option1List.join(','),
            optionprice1: optionprice1List.join(','),
            option2: option2List.join(','),
            optionprice2: optionprice2List.join(','),
            option3: option3List.join(','),
            optionprice3: optionprice3List.join(','),
            option4: option4List.join(','),
            optionprice4: optionprice4List.join(','),
        };

        $.ajax({
            type: "POST",
            url: "/business/realU",
            data: data,
            success: function (response) {
                // 서버 응답에 대한 처리가 필요하면 여기에서 수행
                alert("수정되었습니다!.");
            },
            error: function (error) {
                // AJAX 요청 중에 발생한 오류를 처리
                alert("이미 수정 되었거나 잘못된 접근입니다.");
            }
        });
    });
}); 
</script>
</body>
</html>