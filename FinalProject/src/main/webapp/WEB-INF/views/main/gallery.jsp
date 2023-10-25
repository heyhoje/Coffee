<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/gallery.css'/>">
<style type="text/css">

.main{
  width: 90vw;
  margin: 0 auto;
  display: flex;
  gap: 3px;
}

.main_bar {
  position: relative;
  font-size: 1.5rem;
  font-weight: bold;
  color: white;
  text-align: center;
  border-radius: 10px;
  padding: 1rem;
  height: 250px;
  background-color: #00000052;
  flex: 1;
  transition: 0.2s ease-in-out;
}

.main_bar:hover {
  transform: perspective(1500px) rotateY(30deg);
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.6);
  cursor: pointer;
}

.test{
	transition: 0.2s ease-in-out;
}
.test:hover{
	transform: scale(0.9);
	border-radius: 220px;
	cursor: pointer;
}
.image{
overflow: hidden;
}
</style>
</head>
<body>
	<div class="main">
		<div class="main_bar">
			<img class="image" alt="coffee" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6x2oXAPGtZyQbiJr0C-J7ibJYSvDCJqhDJw&usqp=CAU">
			커피
		</div>
		<div class="main_bar">
			<img class="image" alt="coffee" src="https://cafepleno.wisacdn.com/_data/product/202104/27/d138802bc96626c54bb35229db6e64c9.jpg">
			논커피
		</div>
		<div class="main_bar">
			<img class="image" alt="coffee" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6x2oXAPGtZyQbiJr0C-J7ibJYSvDCJqhDJw&usqp=CAU">
			음료
		</div>
		<div class="main_bar">
			<img class="image" alt="coffee" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6x2oXAPGtZyQbiJr0C-J7ibJYSvDCJqhDJw&usqp=CAU">
			푸드
		</div>
		<div class="main_bar">
			<img class="image" alt="coffee" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6x2oXAPGtZyQbiJr0C-J7ibJYSvDCJqhDJw&usqp=CAU">
			카페사진
		</div>
	</div>
	<!-- Gallery -->
	<div class="row">
		<div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(73).webp"
				class="w-100 shadow-1-strong rounded mb-4 test" 
				alt="Boat on Calm Water"
				 />

			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Vertical/mountain1.webp"
				class="w-100 shadow-1-strong rounded mb-4 test"
				alt="Wintry Mountain Landscape" />
		</div>

		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Vertical/mountain2.webp"
				class="w-100 shadow-1-strong rounded mb-4 test"
				alt="Mountains in the Clouds" /> <img
				src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(73).webp"
				class="w-100 shadow-1-strong rounded mb-4 test" alt="Boat on Calm Water" />
		</div>

		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/Nature/4-col/img%20(18).webp"
				class="w-100 shadow-1-strong rounded mb-4 test" alt="Waves at Sea" />

			<img
				src="https://mdbcdn.b-cdn.net/img/Photos/Vertical/mountain3.webp"
				class="w-100 shadow-1-strong rounded mb-4 test"
				alt="Yosemite National Park" />
		</div>
	</div>	
	
</body>
</html>