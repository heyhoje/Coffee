<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>메뉴상세 주문</title>
	<!-- style css -->
    <link rel="stylesheet" href="<c:url value='/resources/css/realU.css'/>">

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
				    	<c:set var="index" value="0"/>
				        <th><hr>
				        	<input type="text" name="optionname${optionItem.os_num}" value="${optionItem.os_name}"><br><br>
				            <c:forEach items="${optionItem.optionValueList}" var="optionValue">
				                <c:forEach begin="1" end="${optionItem.os_optionNum}" var="i">
				                   <c:choose>
				                       <c:when test="${optionItem.os_optionNum == i}">
				                           <label>
				                           <input type="text" name="optionvalue${optionItem.os_num}" value="${optionValue.ov_value}">
				                               <input type="number" name="optionprice${optionItem.os_num}" value="${optionValue.ov_price}"></label>
				                               <button class="btn-outline-warning" onclick="openPopup(${optionValue.ov_num})">해당 옵션 삭제</button>
				                               <br>
				                       </c:when>
				                   </c:choose>
				               </c:forEach>
				               		<div id="overlay">
										<div id="popup">
											<p>정말 삭제하시겠습니까?</p>
											<button id="btnYes" onclick="killOptionValue(${optionValue.ov_num})">예</button>
											<button id="btnNo" onclick="handleResponse('아니오')">아니오</button>
										</div>
									</div>
				            </c:forEach>
				            <button class="btn-outline-warning" onclick="optionChooga(${optionItem.os_num})">옵션값 추가</button>
				            <button class="btn-outline-warning" onclick="openPopup2(${optionValue.os_num})">해당 옵션 삭제</button>
				            <div id="overlay2">
								  <div id="popup2">
								    <p>정말 삭제하시겠습니까?</p>
								    <button id="btnYes" onclick="killOption(${optionItem.os_optionNum})">예</button>
								    <button id="btnNo" onclick="handleResponse2('아니오')">아니오</button>
								  </div>
							</div>
				            <br><br>
				        </th>
				    </c:forEach>
				</div>
		    <br><hr>
		    <button class="btn-outline-warning" onclick="optionmoongchi()">옵션 추가</button><br><br>
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
        // Initialize arrays
        var optionValueList = [];
        var optionPriceList = [];
        var osNameList = [];
        var osNumList = [];
        var ovNumList = [];
        var mn_num = ${menu.mn_num};
        var mn_name = $('input[name="mn_name"]').val();
        var mn_price = $('input[name="mn_price"]').val();
        var mn_contents = $('input[name="mn_contents"]').val();


        // Iterate over option elements
        $('.option-box input[name^="optionname"]').each(function(index) {
            osNameList.push($(this).val());
        });

        // Iterate over option value elements
        $('.option-box input[name^="optionvalue"]').each(function(index) {
            optionValueList.push($(this).val());
        });

        // Iterate over option price elements
        $('.option-box input[name^="optionprice"]').each(function(index) {
            optionPriceList.push($(this).val());
        });
        
	    <c:forEach items="${option}" var="optionItem" varStatus="opIndex">
	  		osNumList.push('${optionItem.os_num}');
      		<c:forEach items="${optionItem.optionValueList}" var="optionValue">
				ovNumList.push('${optionValue.ov_num}');
			</c:forEach>
		</c:forEach>

        
        var data = {
                mn_num: mn_num,
                mn_name: mn_name,
                mn_price: mn_price,
                mn_contents: mn_contents,
                osNameList: osNameList.join(','), // 배열을 쉼표로 구분된 문자열로 변환
                osNumList: osNumList.join(','),
                ovNumList: ovNumList.join(','),
                optionValueList: optionValueList.join(','),
                optionPriceList: optionPriceList.join(','),
            };

        
        $.ajax({
            type: "POST",
            url: "/business/realU",
            data: data,
            success: function(response) {
                alert("수정되었습니다.");
            },
            error: function(error) {
                alert("이미 수정 되었거나 잘못된 접근입니다.");
            }
        });
    });
});


function optionChooga(num) {
	var data = {
			ov_os_num : num,
	};	
    $.ajax({
        type: "POST",
        url: "/business/realUI",
        data: data,
        success: function (response) {
            // 서버 응답에 대한 처리가 필요하면 여기에서 수행
            alert("추가되었습니다.");
        },
        error: function (error) {
            // AJAX 요청 중에 발생한 오류를 처리
            alert("아무튼 오류입니다.");
        }
    });
}

function optionmoongchi() {
	var data = {
			mn_num : ${menu.mn_num},
	};
    $.ajax({
        type: "POST",
        url: "/business/realUII",
        data: data,
        success: function (response) {
            // 서버 응답에 대한 처리가 필요하면 여기에서 수행
            alert("추가되었습니다.");
        },
        error: function (error) {
            // AJAX 요청 중에 발생한 오류를 처리
            alert("아무튼 오류입니다.");
        }
    });
}

function killOption(num) {
	var data = {
			mn_num : ${menu.mn_num},
			os_optionNum : num,
	};
    $.ajax({
        type: "POST",
        url: "/business/realUD",
        data: data,
        success: function (response) {
            // 서버 응답에 대한 처리가 필요하면 여기에서 수행
            alert("해당 옵션이 삭제 되었습니다.");
        },
        error: function (error) {
            // AJAX 요청 중에 발생한 오류를 처리
            alert("아무튼 오류입니다.");
        }
    });
}

function killOptionValue(num) {
	var data = {
			ov_num : num,
	};
    $.ajax({
        type: "POST",
        url: "/business/realUDV",
        data: data,
        success: function (response) {
            // 서버 응답에 대한 처리가 필요하면 여기에서 수행
            alert("해당 옵션이 삭제 되었습니다.");
        },
        error: function (error) {
            // AJAX 요청 중에 발생한 오류를 처리
            alert("아무튼 오류입니다.");
        }
    });
}
function openPopup(${optionValue.ov_num}) {
    document.getElementById('overlay').style.display = 'flex';
	}
function openPopup2(${optionValue.ov_price}) {
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

</script>
</body>
</html>