
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>키워드로 장소검색하기</title>
<style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}

</style>
 
    
</head>
<body>
	<ul class="nav-searchcategory" style="justify-content:center;">
	  <li class="nav-item align-items-center">
	    <a class="nav-link" href="#" style="font-size:20px; margin-right:20px;">지역으로 검색하기</a>
	  </li>
	  <li>
	  	<a class="map-selection-border"></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<c:url value='/order/store2'/>"
	    style="font-weight: normal; font-size:20px;">가게 이름으로 검색하기</a>
	  </li>
	 </ul>
 <div class="search-container">
  		

            <div class="row height d-flex justify-content-center align-items-center">

              <div class="col-md-6" style="
              flex:0 0 70%;
              max-width: 80%;">

                <form onsubmit="searchPlaces(); return false;" style="
           		
           			margin-bottom:50px;
           			text-align:center;
           		
           			">
                    <input type="text" class="form-control input-text" value="" id="keyword" size="10px;" aria-describedby="basic-addon2" style="width:100%;">  <button class="btn btn-outline-warning btn-lg" type="submit" style="margin-top: 20px;">검색하기</button>
                   
                </form>
                
              </div>
              
            </div>
            
          </div>
   
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden; border:solid 2px black;margin-bottom:200px" ></div>

 
   
   
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

// 키워드로 장소를 검색합니다
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
    {
        content:
        '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
        '            카카오 스페이스닷원' + 
        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
        '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
        '                <div><a href="store/77777" target="_blank" class="link">홈페이지</a></div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>',
        latlng: new kakao.maps.LatLng(37.4995, 127.0338)
    },
    {
        content: '<div>매머드 신안유토빌점</div>', 
        latlng: new kakao.maps.LatLng(37.4989, 127.0336)
    },
    {
        content: '<div>컴포즈커피 논현85길점</div>', 
        latlng: new kakao.maps.LatLng(37.4979, 127.0336)
    },
    {
        content: '<div>해머스미스커피 역삼휘트니스점</div>',
        latlng: new kakao.maps.LatLng(37.4991, 127.0331)
    }
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