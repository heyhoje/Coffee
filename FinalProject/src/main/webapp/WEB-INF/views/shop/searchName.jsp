<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이름으로 검색</h1>
	    
<p>내 주변 1Km 이내의 가게만 검색합니다.</p>
<button id=getLcation onclick="getLocation()">위치 정보 동의</button>



<p id="demo"></p>

	<form action="" method="get">
		<div class="form-check">
			<label class="form-check-label">
				<input type="checkbox" class="form-check-input" onclick="getLocation()">위치 정보 동의
				<input type="hidden" name="ipLati">
				<input type="hidden" name="ipLongi">
			</label>
		</div>
	  <div class="input-group mt-5" >
	    <input type="text" class="form-control" name="search" value="${pm.cri.search}">
	    <button class="btn btn-outline-success">검색</button>
	  </div>
	</form>
	
	<table border="1">
		<thead>
			<tr>
				<th>브랜드로고</th>
				<th>가게명</th>
				<th>주소</th>
				<th>상세보기(?)</th>
				<th>링크</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${shopList}" var="shopList" varStatus="index">
				<tr>
					<td></td>
					<td>${shopList.bm_store_name }</td>
					<td>${shopList.bm_address }</td>
					<td>${shopList.bm_contents }</td>
					<td><a href="/shop/${shopList.bm_num }">바로가기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<script type="text/javascript">
const x = document.getElementById("demo");


function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
	  var ipLati = position.coords.latitude;
	  var ipLongi = position.coords.longitude;
	 /* var ipLatLong = [ipLati, ipLongi];
	  
	  $.ajax({
		  url : '<c:url value="/shop/name"/>',
		  type : 'get',
		  data : {"ipLati" : ipLati, "ipLongi" : ipLongi},
		  success : function(){
			  alert('위치정보를 받았습니다.');
		  },
		  error : function(a){
			  console.log(a)
			  alert('위치정보를 받지 못했습니다.')
		  }  
	  });
	  $('input[name=ipData]').attr('value', ipLatLong);
	  */
	  $('[name=ipLati]').val(ipLati)
	  $('[name=ipLongi]').val(ipLongi)

  
/*
  x.innerHTML = "Latitude: " + ipLati + 
  "<br>Longitude: " + ipLongi;
*/
  
}





</script>

</body>
</html>