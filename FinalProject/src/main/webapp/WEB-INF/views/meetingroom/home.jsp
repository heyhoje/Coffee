<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <link rel="stylesheet"
	href="<c:url value='/resources/css/meetingroom.css'/>">

<meta charset="UTF-8">
</head>
<body>
	<h1 style="text-align: center; margin-top: 50px; margin-bottom:50px; font-family:'BM HANNA Pro', sans-serif;">미팅룸 예약</h1>

	
		
	<div class="booking-form" style="font-family:'BM HANNA Pro', sans-serif;">
		<div class="form-group">
			<span class="form-label"></span>
			<input class="form-control" type="text" placeholder="찾고자 하는 위치를 입력하세요" value="${pm.cri.search}">
		</div>
		<div style="justify-content:center; display:flex; margin-bottom: 30px;">
			    <button class="btn btn-outline-success" id="searchbtn2" style="font-family: 'BM HANNA Pro', sans-serif;">검색하기</button>
		</div>
	</div>
			
	<table class="table" style="font-family: 'BM HANNA Pro', sans-serif; text-align:center;">
		<thead>
			<tr>
				<th class="text-center" scope="col">번호</th>
				<th scope="col">이미지</th>
				<th scope="col">해당매장</th>
				<th scope="col">시간당 가격</th>
				<th scope="col">수용인원</th>
				<th scope="col">특이사항/소개</th>
				<th class="text-center" scope="col">예약하기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mrList}" var="mr" varStatus="mL">
				<tr class="inner-box">
					<th scope="row">
						<div class="meetingroom-number">
							<span>${mr.room_num}</span>
						</div>
					</th>
					<td>
						<div class="meetingroom-img">
						<img src="${mr.room_img}">
						</div>
					</td>
					<td>
						<div class="meetingroom-store">
							<span>"${mr.room_store_name}"</span>
						</div>
					</td>
					<td>
						<div class="meetingroom-wrap">
							<h3><a href="#" style="color:#212529;">${mr.room_content}</a></h3>
							<div class="meta">
								<div class="meetingroom-price">
									<a href="#" style="color:rosybrown;">${mr.room_price}원/시간</a>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="meetingroom-Maxi-number">
									<a href="#" style="color:#212529;">${mr.room_seat}</a>
						</div>
					</td>
					<td>
						<div class="meetingroom-introduce">
							<span>"${mr.room_etc}"</span>
						</div>
					</td>
					<td>
						<div class="btn btn-primary" id="reservation-btn">
							<a href="javascript:openPop()" style="width:100%; color:#007bff;" onclick="operationTime(${mL.index})">예약하기</a>
						</div>
						
						<!-- 시간 선택하는 팝업div 위에 form태그로 싸악 감싸준다. -->
						<form type="hidden" id="cartform" action="<c:url value='/meetingroom/booking'/>" method="post">
							<div class="popup_layer" id="popup_layer" style="display: none;">
					 			<div class="popup_box">
						      		<div style="height: 20px; width: 100%;">
										<a href="javascript:closePop();" class="m_header-banner-close" style="width: 50px; height: 50px;">
											<a type="button" href="javascript:closePop();" class="closebutton" style="float: right; margin-right: 10px;">x</a>
										</a>
									</div>
									<!--팝업 컨텐츠 영역-->
									<div class="popup_cont">
									<input type="hidden" name="room_num" value="${mr.room_num}">
									<input type="hidden" name="room_st_num" value="${mr.room_st_num}">
										<h5> 시간 선택 </h5>
										<hr>
										<div class="form-group" style="display:flex; margin-left: 10px; margin-right: 10px;">
											<input id="reservationDate" name="reservationDate" class="form-control" type="date" placeholder="예약할 날짜를 입력하세요.">
											<input id="numberOfPeople" name="numberOfPeople" class="form-control" type="text" style="width:30%; margin-left:20px;" placeholder="인원수">
										</div>
										<hr>
										<div class="timebox">
											<div class="buttonbox">
												<input class="timebutton" type="checkbox"/>
											</div>
											<hr>
											<div class="reservationbutton-box">
												<button class="reservationbutton" href="javascript:void(0)" onclick="reservationThis()">예약하기</button>
											</div>
										</div>
								    <!--팝업 버튼 영역-->
									<div class="popup-btn-box" style="height:100%;"></div>
									<div class="popup_btn">
										<a href="javascript:closePop();" style="color:black;">닫기</a>
									</div>
								</div>
							</div>
						</div>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div>
		<c:if test="${pm.prev}">
			<a href="<c:url value='/meetingroom/home${pm.cri.getUrl(pm.startPage-1) }'/>">이전</a>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<a href="<c:url value='/meetingroom/home${pm.cri.getUrl(i) }'/>">${i}</a>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="<c:url value='/meetingroom/home${pm.cri.getUrl(pm.endPage+1) }'/>">다음</a>
		</c:if>
	</div>
</body>

	<script type="text/javascript">
	  	function openPop() {
		    document.getElementById("popup_layer").style.display = "block";
		}
		//팝업 닫기
		function closePop() {
		    document.getElementById("popup_layer").style.display = "none";
		}
	</script>
	
	<script>
		var starttime = [];
		var endtime = [];
		var operationtime=[];
		
		<c:forEach items="${mrList}" var="opentime" varStatus="oT">
			starttime[${oT.index}] = ${opentime.room_starttime};
			endtime[${oT.index}] = ${opentime.room_endtime};
		</c:forEach>
		
		var reservationtime= [];

		<c:forEach items="${rsList}" var="rstime" varStatus="rt">
			reservationtime[${rt.index}] = ${rstime.rs_start};
			console.log(rstime);
		</c:forEach>
		/* 시간선택한 정보를 배열arr로 받아가기 때문에, name변경 -> css도 수정, vo에 int[] 추가 */
		function operationTime(num){
			var open = starttime[num];
			var close = endtime[num];
			var operation = [];	
			var str=''; 
			for( i=open; i>=open && i<close; i++){
				operation[i-open] = i;  
				//let x = operation.filter(i => !reservationtime.includes(i));
				let disabled = reservationtime.includes(i) ? 'disabled' : ''
				str += `
					<label style="cursor:pointer;">
						<input type="checkbox" name="arr_room_starttime" value="\${i}" class="\${disabled}" \${disabled}>
						<button class="timebutton" >\${i}:00
						</button>
					</label>
				`
			}
			$('.buttonbox').html(str)
			javascript:openPop()
		}
	</script>
	
	<script>
	function reservationThis() {
	    var roomNum = document.getElementById('rs_room_num').value;
	    var reservationDate = document.getElementById('reservation_date').value;
	    var numberOfPeople = document.getElementById('number_of_people').value;

	    var selectedTimes = [];
	    var checkedTimeInputs = document.querySelectorAll('input[name="arr_room_starttime"]:checked');
	    checkedTimeInputs.forEach(function (input) {
	        selectedTimes.push(input.value);
	    });
	    $.ajax({
	        url: '/rsadd',
	        type: 'POST',
	        data: {
	            rsRoomNum: room_num,
	            reservationDate: reservationDate,
	            numberOfPeople: numberOfPeople,
	            selectedTimes: selectedTimes
	        },
	        console.log(data);
	        success: function (response) {
	            console.log('서버 응답:', response);
	            $('#cartform').submit();
				closePop();
	        },
	        error: function (error) {
	            console.error('서버 요청 실패:', error);
	            $('#cartform').submit();
				closePop();
	        }
	    });
	}
	</script>
</html>