<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" >
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Notification</title>

</head>

<style>
    .navbar{
        min-height: 80px;
    }
    .navbar-brand{
        margin:auto;
        font-size: 2.6rem;
    }
    .panel{
        padding-top:20px;
        padding-bottom: 20px;
    }
    h3{
        color:blue;
    }
    .pstyle{
        font-size:2rem;
        font-family: verdana,sans-serif;
    }




</style>
<body>

<script>
	
var urlEndPoint = 'http://localhost:8080/business/order/${st_num}';
console.log(urlEndPoint);
	    
    
    $(document).ready(function(){
		
    	var userID = "";
        var urlEndPoint = 'http://localhost:8080/business/order/${st_num}';
        console.log(urlEndPoint);
        var eventsource = new EventSource(urlEndPoint);
        eventsource.addEventListener("INIT",function(event){
        	console.log(event.data);
           
            console.log(124);
          	
        })
        eventsource.addEventListener("order",function(event){
        	console.log(event.data);
            var MenuData = JSON.parse(event.data);
            addBlock(MenuData.Menu, MenuData.content);
            $('.box').append(`<h1>\${event.data}</h1>`)
          	
        })
	
	})
        function addBlock(Menu, content){
            var a = document.createElement("Menu");
            //메뉴
            var h = document.createElement("content")
            var t = document.createElement(Menu);
            h.appendChild(t);
            //메뉴정보
            var para = document.createElement("P");
            para.innerHTML = content;
            a.appendChild(h);
            a.appendChild(para);
            document.getElementById("pack").appendChild(a);        
    
    }
    $('.form').find('input, textarea').on('keyup blur focus', function (e) {
    	  
    	  var $this = $(this),
    	      label = $this.prev('label');

    	    if (e.type === 'keyup') {
    	      if ($this.val() === '') {
    	          label.removeClass('active highlight');
    	        } else {
    	          label.addClass('active highlight');
    	        }
    	    } else if (e.type === 'blur') {
    	      if( $this.val() === '' ) {
    	        label.removeClass('active highlight'); 
    	      } else {
    	        label.removeClass('highlight');   
    	      }   
    	    } else if (e.type === 'focus') {
    	      
    	      if( $this.val() === '' ) {
    	        label.removeClass('highlight'); 
    	      } 
    	      else if( $this.val() !== '' ) {
    	        label.addClass('highlight');
    	      }
    	    }

    	});

    	$('.tab a').on('click', function (e) {
    	  
    	  e.preventDefault();
    	  
    	  $(this).parent().addClass('active');
    	  $(this).parent().siblings().removeClass('active');
    	  
    	  target = $(this).attr('href');

    	  $('.tab-content > div').not(target).hide();
    	  
    	  $(target).fadeIn(600);
    	  
    	});
</script>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <div class="navbar-brand" style="font-family: 'BM HANNA Pro', sans-serif;">주문목록이 보여집니다.</div>
            </div>
        </div>
        
    </nav>
    <div class = "container pstyle text-center" id="pack" style="font-family: 'BM HANNA Pro', sans-serif;">
        <div class="Panel panel-primary">
            <h1>주문리스트</h1>
            <div class="box"></div>
        </div>


        
       
       	
    </div>
</body>





<!--  <style>
    .navbar{
        min-height: 80px;
    }
    .navbar-brand{
        margin:auto;
        font-size: 2.6rem;
    }
    .panel{
        padding-top:20px;
        padding-bottom: 20px;
    }
    h3{
        color:blue;
    }
    .pstyle{
        font-size:2rem;
        font-family: verdana,sans-serif;
    }


</style>
	  
<script>
	
	
    
    $(document).ready(function(){
		
        var urlEndPoint = 'http://localhost:8080/business/order/1';
        var eventSource = new EventSource(urlEndPoint);
        eventSource.addEventListener("latestNews", function(event){
			var articleData = JSON.parse(event.data);
			addBlock(articleData.menuName, articleData.optionchoice, articleData.quantity);
        })
    })
    function addBlock(menuName, optionchoice, quantity){
    	var a = document.createElement("article");
    	//title
    	var h = document.createElement("H3")
    	var t = document.createTextNode(menuName);
    	h.appendChild(t);
    	//paragraph
    	var para = document.createElement("p");
    	
    	para.innerHTML = optonchoice;
    	a.appendChild(h);
    	a.appendChild(para);
    	document.getElementById("pack").appendChild(a);
    }
        
</script>
<body>	
	<nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <div class="navbar-brand" style="font-family: 'BM HANNA Pro', sans-serif;">주문목록이 보여집니다.</div>
            </div>
        </div>
    </nav>
    <div class = "container pstyle text-center" id="pack" style="font-family: 'BM HANNA Pro', sans-serif;">
        <div class="Panel panel-primary">
            <h1>주문리스트</h1>
            <div class="box"></div>
      	</div>
    	</div>
	</body> 
	 -->
</html>