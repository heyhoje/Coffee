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
	<form>
		<div>
			<label for="search_name">가게 이름으로 검색</label>
			<input type="text" class="form-control" id="search_name"> 
			<button>검색</button>
		</div>
		<div>
			<label for="search_map">지역으로 검색</label>  
			<input type="text" class="form-control" id="search_map">
			<button>검색</button>
		</div>
		<div id="map" style="width: 500px; height: 400px;"></div>
		<script type="text/javascript">
			
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.500808704371195, 127.03635305022154), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
		
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
		</script>
	</form>
</div>
</body>
</html>