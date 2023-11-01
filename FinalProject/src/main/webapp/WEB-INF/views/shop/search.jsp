<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=561e856ae4d249ea1210db906492fb6a
"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="form-group">
	<form method="post" action="/shop/name">
		<div>
			<label for="search_name">가게 이름으로 검색</label>
			<input type="text" class="form-control" id="search_name" placeholder="상호명을 입력해 주세요."> 
			<button type="submit" class="btn btn-search_name">검색</button>
		</div>
	</form>
		<div>
			<label for="search_map">지역으로 검색</label>  
			<input type="text" class="form-control" id="search_map" placeholder="검색할 위치를 입력해 주세요.">
			<button type="submit" class="btn btn-search_name">검색</button>
		</div>
		<div id="map" style="width: 500px; height: 400px;"></div>
		<script type="text/javascript">
			
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.500808704371195, 127.03635305022154), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
		
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(); 

			// 키워드로 장소를 검색합니다
			ps.keywordSearch('이태원 맛집', placesSearchCB); 

			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new kakao.maps.LatLngBounds();

			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			        }       

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}


		</script>

</div>
</body>
</html>