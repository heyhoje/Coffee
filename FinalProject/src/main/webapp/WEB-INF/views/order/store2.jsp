
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="nav-searchcategory" style="justify-content:center;">
	  <li class="nav-item align-items-center">
	    <a class="nav-link" href="<c:url value='/order/store'/>" style="font-size:20px; margin-right:20px; font-weight:normal;">지역으로 검색하기</a>
	  </li>
	  <li>
	  	<a class="map-selection-border"></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="<c:url value='/order/store2'/>"
	    style="font-weight: bold; font-size:20px; font-size:20px;">가게 이름으로 검색하기</a>
	  </li>
	 </ul>
 <div class="search-container">
  		

            <div class="row height d-flex justify-content-center align-items-center">

              <div class="col-md-6" style="
              flex:0 0 70%;
              max-width: 80%;">

                <form onsubmit="searchPlaces(); return false;" style="
           			margin-bottom:50px;
           			text-align: center;
           			">
                    <input type="text" class="form-control input-text" value="" id="keyword" size="10px;" aria-describedby="basic-addon2" style="width:100%;">  <button class="btn btn-outline-warning btn-lg" type="submit" style="margin-top: 20px;">검색하기</button>
                   
                </form>
                
              </div>
              
            </div>
            
          </div>
    <div class="row">
            <div class="col-lg-12" style="
            margin-left: 15%;
            max-width: 75%;">
                <ul class="nav custom-tab" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active show" id="home-taThursday" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">9월</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">10월</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">11월</a>
                    </li>
                    <li class="nav-item d-none d-lg-block">
                        <a class="nav-link" id="sunday-tab" data-toggle="tab" href="#sunday" role="tab" aria-controls="sunday" aria-selected="false">12월</a>
                    </li>
                    <li class="nav-item mr-0 d-none d-lg-block">
                        <a class="nav-link" id="monday-tab" data-toggle="tab" href="#monday" role="tab" aria-controls="monday" aria-selected="false">1월</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade active show" id="home" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="text-center" scope="col">번호</th>
                                        <th scope="col">매장 사진</th>
                                        <th scope="col">주소</th>
                                        <th scope="col">브랜드</th>
                                        <th class="text-center" scope="col">링크</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>11월</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="<c:url value='/resources/images/starbucks.png'/>">
                                            </div>
                                        </td>
                           <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">스타벅스</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">디즈니 스타벅스 콜라보레이션<br>
                                                        & 오텀 프로모션2</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#"></a>
                                                    </div>
                                                    <div class="time">
                                                        <span>2023년 11월16일(목) - 11월23일(목)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>전국 매장</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">바로가기</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>20</span>
                                                <p>11월</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="<c:url value='/resources/images/twosome.jpg'/>">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">투썸 플레이스</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">적립 두배 이벤트</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>2023년 9월 1일(토) - 10월 30일(월)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>전국 매장</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">바로가기</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box border-bottom-0">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>18</span>
                                                <p>11월</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="<c:url value='/resources/images/megacoffee.png'/>">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">메가커피</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">가을 시즌 출시 기념 이벤트</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>2023년 9월 7일(목) - 10월 31일(화)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>전국 매장</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">바로가기</a>
                                            </div>
                                        </td>
<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Date</th>
                                        <th scope="col">Speakers</th>
                                        <th scope="col">Session</th>
                                        <th scope="col">Venue</th>
                                        <th scope="col">Venue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Toni Duggan</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Harman Kardon</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box border-bottom-0">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Billal Hossain</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Date</th>
                                        <th scope="col">Speakers</th>
                                        <th scope="col">Session</th>
                                        <th scope="col">Venue</th>
                                        <th scope="col">Venue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Harman Kardon</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Billal Hossain</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box border-bottom-0">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Toni Duggan</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="sunday" role="tabpanel" aria-labelledby="sunday-tab">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Date</th>
                                        <th scope="col">Speakers</th>
                                        <th scope="col">Session</th>
                                        <th scope="col">Venue</th>
                                        <th scope="col">Venue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Toni Duggan</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Harman Kardon</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box border-bottom-0">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Billal Hossain</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="monday" role="tabpanel" aria-labelledby="monday-tab">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Date</th>
                                        <th scope="col">Speakers</th>
                                        <th scope="col">Session</th>
                                        <th scope="col">Venue</th>
                                        <th scope="col">Venue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>16</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Harman Kardon</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>18</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Toni Duggan</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="inner-box border-bottom-0">
                                        <th scope="row">
                                            <div class="event-date">
                                                <span>20</span>
                                                <p>Novembar</p>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="event-img">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" />
                                            </div>
                                        </td>
                                        <td>
                                            <div class="event-wrap">
                                                <h3><a href="#">Billal Hossain</a></h3>
                                                <div class="meta">
                                                    <div class="organizers">
                                                        <a href="#">Aslan Lingker</a>
                                                    </div>
                                                    <div class="categories">
                                                        <a href="#">Inspire</a>
                                                    </div>
                                                    <div class="time">
                                                        <span>05:35 AM - 08:00 AM 2h 25'</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="r-no">
                                                <span>Room B3</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="primary-btn">
                                                <a class="btn btn-primary" href="#">Read More</a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
          
</body>
</html>