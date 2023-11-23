
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value='/resources/css/store.css'/>">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/static/fonts/font.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/searchName.css'/>">
 
<meta charset="utf-8">
<title>키워드로 장소검색하기</title>
<style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:''BM HANNA Pro'',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px; margin-top:50px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:300px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	.wrap{font-size: 30px; width:200px; height:200px;}
	.btn-primary{width:99%; padding:0 1px 0 2px; margin-top:4px; border-radius:inherit;}
	.map_wrap
</style>
 
    
</head>
<body id="storejsp">
	<div class="nav-searchcategory" style="justify-content:center; text-align:center; display:flex; margin-top:30px; font-size:25px; color:black;">
	    <a class="nav-link" href="#" style="font-family: 'BM HANNA Pro', sans-serif; font-weight:bold; color:black;">지역으로 검색하기</a>
	    <a class="nav-link" href="<c:url value='/shop/name'/>" style="font-family: 'BM HANNA Pro', sans-serif; color:black; font-weight:100;">매장명으로 검색하기</a>
	 </div>
 <div class="search-container">
  		

            <div class="row height d-flex justify-content-center align-items-center">

              <div class="col-md-6">
                 <form onsubmit="searchPlaces(); return false;">
                 	<div class="input-group mt-5" id="searchstore">
                  	<div id="searchbox">
                    <input type="text" class="form-control input-text" value="" id="keyword" size="10px;" aria-describedby="basic-addon2">  
                   	</div>
                   	<button class="btn btn-outline-warning btn-lg" type="submit" id="searchbtn" style="font-family: 'BM HANNA Pro', sans-serif; font-size:medium;">검색하기</button>
                   	</div>
                </form>
              </div>
            </div>
          </div>
<div class="map_wrap" id="marker">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden; border:solid 2px black;" ></div>

 
   
   
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4efc38a6ad2e481f05e226066782e8c&libraries=services"></script>
<script>


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
ps.keywordSearch('이태원 맛집', placesSearchCB); 

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}



// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[0]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
        

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
        
    } 
   
    	
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
}


//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
    	<c:forEach items="${shopList}" var="shopList" varStatus="vs">

	    {
	        content:
	        '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + 
	        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
	        '                <img src="<c:url value='/resources/images/starbucks1.png'/>" width="198" height="120">' + 
	        '           </div>' + 
	        '            <div class="desc">' + 
	        '				 <div class="ellipsis">${shopList.bm_store_name}</div>'+ 
	        '                <div class="ellipsis">${shopList.bm_address}</div>' + 
	        '                <div class="number ellipsis" id="phoneicon">☎${shopList.bm_phone}</div>' + 
	        '                <a href="/store/menu/${shopList.st_num}/1" target="_blank" class="link"><button type="button" class="btn btn-primary" onclick="">주문하기</button></a>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>',
	        latlng: new kakao.maps.LatLng(${shopList.bm_geocoding_lati}, ${shopList.bm_geocoding_longi}),
	    },
		</c:forEach>	    	
	];
	
var iwRemoveable = true;

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });
    

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
    	content: positions[i].content,  // 인포윈도우에 표시할 내용
    	removable : iwRemoveable
    });
    
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}


</script>
</body>
</html>