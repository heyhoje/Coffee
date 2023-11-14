<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="Ko">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Grand Coffee</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="resources/css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="resources/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="resources/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
 
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
     
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
   </head>
   <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
   <body>
      <!--header section start -->
     
      <!--header section end -->
      <!-- banner section start -->
      
         <div class="container" id="bannerbox">
            <div id="main_slider" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <div class="row">
                        <div class="col-sm-12">
                           <div class="banner_taital"><img src="resources/images/main3.jpg" >
                              <h1 class="outstanding_text"></h1>
                              <h1 class="coffee_text"></h1>
                              <p class="there_text"></p>
                             
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="row">
                        <div class="col-sm-12">
                           <div class="banner_taital"><img src="resources/images/main1.jpg" >
                              <h1 class="outstanding_text"></h1>
                              <h1 class="coffee_text"></h1>
                              <p class="there_text"></p>
                      
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="row">
                        <div class="col-sm-12">
                           <div class="banner_taital"><img src="resources/images/main2.jpg" >
                              <h1 class="outstanding_text"> </h1>
                              <h1 class="coffee_text"></h1>
                              <p class="there_text"></p>
                              
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
               <i class="fa fa-angle-left"></i>
               </a>
               <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
               <i class="fa fa-angle-right"></i>
               </a>
            </div>
         </div>
      
      <!-- banner section end -->
      <!-- about section start -->
      <div class="about_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <div class="about_taital_main">
                     <div class="about_taital"  style="font-family: 'BM HANNA Pro', sans-serif;">About Us</div>
                     <p class="about_text"></p>
                     <p class="about_text"></p>
                     <div class="read_bt"><a href="#">Read More</a></div>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="about_img"><img src="resources/images/about-img.png"></div>
               </div>
            </div>
         </div>
      </div>
      <!-- about section end -->
      <!-- gallery section start -->
      <div class="gallery_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <h1 class="gallery_taital"  style="font-family: 'BM HANNA Pro', sans-serif;">Brands</h1>
                  <p class="gallery_text"  style="font-family: 'BM HANNA Pro', sans-serif;">다양한 브랜드 커피를 편리하고 손쉽게 주문해보세요.</p>
               </div>
            </div>
            <div class="">
               <div class="gallery_section_2">
                  <div class="row">
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/starbucks.png" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="text"><a href="<c:url value='/store/menu/1/1'/>"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/twosome.jpg" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="text"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/Hollys.jpg" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="text"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="gallery_section_2">
                  <div class="row">
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/tomntoms.png" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="text"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/megacoffee.png" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="overlay">
                                 <div class="text"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/ediya.jpg" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="overlay">
                                 <div class="text"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="gallery_section_2">
                  <div class="row">
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/compose.jpg" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="text"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/paik.png" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="text"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="container_main">
                           <img src="resources/images/coffeebean.jpg" alt="Avatar" class="image">
                           <div class="overlay">
                              <div class="text"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="seemore_bt"><a href="#">See More</a></div>
         </div>
      </div>
      <!-- gallery section end -->
      <!-- services section start -->
      <div class="services_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <h1 class="services_taital"  style="font-family: 'BM HANNA Pro', sans-serif;">기타서비스</h1>
                  <p class="services_text"  style="font-family: 'BM HANNA Pro', sans-serif;" >주문 서비스 이외에도 다양한 서비스를 이용해보세요.</p>
               </div>
            </div>
            <div class="services_section_2">
               <div class="row">
                  <div class="col-lg-4 col-sm-12 col-md-4">
                     <div class="box_main active">
                        <div class="house_icon">
                           <img src="resources/images/ordericon.png" class="image_1">
                           <img src="resources/images/ordericon.png" class="image_2">
                        </div>
                        <h3 class="decorate_text"  style="font-family: 'BM HANNA Pro', sans-serif;">주문서비스</h3>
                        <p class="tation_text"> </p>
                        <div class="readmore_bt"><a href="#"></a></div>
                     </div>
                  </div>
                  <div class="col-lg-4 col-sm-12 col-md-4">
                     <div class="box_main">
                        <div class="house_icon">
                           <img src="resources/images/reservation.png" class="image_1">
                           <img src="resources/images/reservation.png" class="image_2">
                        </div>
                        <h3 class="decorate_text"  style="font-family: 'BM HANNA Pro', sans-serif;">예약서비스</h3>
                        <p class="tation_text"></p>
                        <div class="readmore_bt"><a href="#"></a></div>
                     </div>
                  </div>
                  <div class="col-lg-4 col-sm-12 col-md-4">
                     <div class="box_main">
                        <div class="house_icon">
                           <img src="resources/images/communication.png" class="image_1">
                           <img src="resources/images/communication.png" class="image_2">
                        </div>
                        <h3 class="decorate_text"  style="font-family: 'BM HANNA Pro', sans-serif;">소셜서비스</h3>
                        <p class="tation_text"></p>
                        <div class="readmore_bt"><a href="#"></a></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <
      <!-- contact section end -->
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-3 col-sm-6">
                  <h3 class="useful_text" style="font-family: 'BM HANNA Pro', sans-serif;">About</h3>
                  <p class="footer_text"></p>
               </div>
               <div class="col-lg-3 col-sm-6">
                  <h3 class="useful_text" style="font-family: 'BM HANNA Pro', sans-serif;">Menu</h3>
                  <div class="footer_menu">
                     <ul>
                        <li><a href="resources/index.html">소개</a></li>
                        <li><a href="<c:url value='/promotion/list'/>">이벤트&프로모션</a></li>
                        <li><a href="<c:url value='/order/store'/>">주문</a></li>
                        <li><a href="<c:url value='/meetingroom/home'/>">미팅룸예약</a></li>
                        <li><a href="<c:url value='/main/gallery'/>">갤러리</a></li>
                        <li><a href="resources/contact.html">채용정보</a></li>
                        <li><a href="<c:url value='/main/review'/>">리뷰게시판</a></li>
                        <li><a href="resources/contact.html">고객센터</a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-lg-3 col-sm-6">
                  <h1 class="useful_text" style="font-family: 'BM HANNA Pro', sans-serif;">제휴 브랜드</h1>
                   <div class="footer_menu">
                     <ul>
                   		<li><a href="resources/index.html">Starbucks</a></li>
                        <li><a href="resources/about.html">A Twosome Place</a></li>
                        <li><a href="resources/gallery.html">Hollys</a></li>
                        <li><a href="resources/services.html">TomnToms</a></li>
                        <li><a href="resources/contact.html">MGC</a></li>
                        <li><a href="resources/contact.html">Ediya Coffee</a></li>
                        <li><a href="resources/contact.html">Compose Coffee</a></li>
                        <li><a href="resources/contact.html">Paik's Coffee</a></li>
                        <li><a href="resources/contact.html">The Coffee Bean</a></li>
                      </ul> 
               		</div>
               	</div>
               <div class="col-lg-3 col-sm-6">
                  <h1 class="useful_text" style="font-family: 'BM HANNA Pro', sans-serif;">Contact Us</h1>
                  <div class="location_text">
                     <ul>
                        <li>
                           <a href="#">
                           <i class="fa fa-map-marker" aria-hidden="true"></i><span class="padding_left_10">Address : Loram Ipusm</span>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                           <i class="fa fa-phone" aria-hidden="true"></i><span class="padding_left_10">Call : +01 1234567890</span>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                           <i class="fa fa-envelope" aria-hidden="true"></i><span class="padding_left_10">Email : demo@gmail.com</span>
                           </a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- footer section end -->
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <p class="copyright_text">2020 All Rights Reserved. Design by <a href="https://html.design">Free html  Templates</a></p>
         </div>
      </div>
      <!-- copyright section end -->
      <!-- Javascript files-->
      <script src="resources/js/jquery.min.js"></script>
      <script src="resources/js/popper.min.js"></script>
      <script src="resources/js/bootstrap.bundle.min.js"></script>
      <script src="resources/js/jquery-3.0.0.min.js"></script>
      <script src="resources/js/plugin.js"></script>
      <!-- sidebar -->
      <script src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="resources/js/custom.js"></script>     
   </body>
</html>