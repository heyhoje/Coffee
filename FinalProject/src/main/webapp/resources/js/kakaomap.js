declare global {
  interface Window {
    kakao: any;
  }
}

export default function KakaoMap() {
  const [map, setMap] = useState<any>();
  const [marker, setMarker] = useState<any>();
    
  // 1) 카카오맵 불러오기
  useEffect(() => {
    window.kakao.maps.load(() => {
      const container = document.getElementById("map");
      const options = {
        center: new window.kakao.maps.LatLng(33.450701, 126.570667),
        level: 3,
      };
      
      setMap(new window.kakao.maps.Map(container, options));
      setMarker(new window.kakao.maps.Marker());
    });
  }, []);
 
 // 2) 검색된 주소 위치 표시
 const onClickAddr = () => {
    // 3) 주소 검색
    new window.daum.Postcode({
      // 4) 검색된 주소 클릭 시 콜백 함수
      oncomplete: function (addrData: IAddr) {
        var geocoder = new window.kakao.maps.services.Geocoder();
        geocoder.addressSearch(
          addrData.address,  // 검색된 주소
          function (result: any, status: any) {
            // 5) 성공시 좌표 값을 가져온다.
            if (status === window.kakao.maps.services.Status.OK) {
              var currentPos = new window.kakao.maps.LatLng(
                result[0].y,
                result[0].x
              );
              (document.getElementById("addr") as HTMLInputElement).value =
                addrData.address;
              map.panTo(currentPos);
              // 결과값으로 받은 위치를 마커로 표시합니다
              marker.setMap(null);
              marker.setPosition(currentPos);
              marker.setMap(map);
            }
          }
        );
      },
    }).open();
  };
  
  return(
      <div>
        <div onClick={onClickAddr}>
        	<input id="addr" readOnly />
        <div>
        <div id="map" style={{ width: "100%", height: "400px" }}></div>
      <div> 
  );
}