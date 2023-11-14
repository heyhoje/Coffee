<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/searchName.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/static/fonts/font.css'/>">
</head>
<body>



<p id="demo"></p>
	<div class="nav-searchcategory" style="justify-content:center; text-align:center; display:flex; margin-top:30px; font-size:25px; color:black;">
	    <a class="nav-link" href="<c:url value='/order/store'/>" style="font-family: 'BM HANNA Pro', sans-serif; color:black; font-weight:100">지역으로 검색하기</a>
	    <a class="nav-link" href="#" style="font-family: 'BM HANNA Pro', sans-serif; color:black; font-weight:bold;">가게 이름으로 검색하기</a>
	 </div>	

 <div class="search-container">
  		

            <div class="row height d-flex justify-content-center align-items-center">

              <div class="col-md-6-1">

             	<form action="" method="get">
				  <div class="input-group mt-5" id="searchstore2" >
				    <div id="searchbox2">
				    	<input type="text" class="form-control" name="search" value="${pm.cri.search}">
				    	<label class="form-check-label">
							<input type="checkbox" class="form-check-input" onclick="getLocation()">위치 정보 동의
							<input type="hidden" name="ipLati">
							<input type="hidden" name="ipLongi">
						</label>
				    </div>
				    <button class="btn btn-outline-success" id="searchbtn2" style="font-family: 'BM HANNA Pro', sans-serif;">검색하기</button>
		 		 </div>
		  		</form>
              </div>
            </div>
            
          </div>
	<table class="table">
		<thead>
			<tr>
				<th class="text-center">매장사진</th>
				<th>점포명</th>
				<th>주소</th>
				<th>소개</th>
				<th>링크</th>
			</tr>
		</thead>
		<tbody class="bodymenu" style=color:dimgrey;">
			<c:forEach items="${shopList}" var="shopList" varStatus="index">
				<tr class="inner-box">
					<th scope="row">
						<div class="store-image">
							<span>${shopList.bm_image}</span>
						</div>
					</th>
					<td>
						<div class="store-name">
							<span>${shopList.bm_store_name}</span>
						</div>
					</td>
					<td>
						<div class="store-address">
							<span>${shopList.bm_address}</span>						
						</div>					
					</td>	
					<td>
						<div class="store-contents">
							<span>${shopList.bm_contents}</span>						
						</div>					
					</td>			
					<td>
					
						<div class="store-btn">
						<a href="/store/menu/${shopList.st_num}/1">바로가기</a>
					</div>
					</td>
					
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