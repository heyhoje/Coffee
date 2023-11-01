<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <link rel="stylesheet" href="<c:url value='/resources/css/Promotionstyle.css'/>">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="storejsp">
	<div class="nav-brandsearch" style="justify-content:center; text-align:center; display:flex; margin-top:30px; margin-bottom:30px; font-size:20px; color:black;">
	  <a class="nav-link" href="#" style="font-family: 'BM HANNA Pro', sans-serif; color:black;  font-weight:bold;">브랜드검색</a>
	  </div>
 <div class="search-container">
            <div class="row height d-flex justify-content-center align-items-center">
              <div class="col-md-6">
                <form onsubmit="searchPlaces(); return false;" id="searchplace" style="
           			">
                    <input type="text" class="form-control input-text" value="" id="keyword" size="10px;" aria-describedby="basic-addon2">  <button class="btn btn-outline-warning btn-lg" type="submit" style="font-family: 'BM HANNA Pro', sans-serif;">검색하기</button>
                </form>
              </div>
            </div>
          </div>

      <table class="table">
	 	<thead>
	        <tr>
		         <th class="text-center" scope="col">번호</th>
		         <th scope="col">이미지</th>
		         <th scope="col">내용</th>
		         <th scope="col">해당매장</th>
		         <th class="text-center" scope="col">링크</th>
	        </tr>
       </thead>
		<tbody>
			<c:forEach items="${promotionList}" var="promotionList">
				<tr class="inner-box">
					<th scope="row">
						<div class="promotion-number">
							<span>${promotionList.ad_num}</span>
						</div>
					</th>
					<td>
						<div class="event-img">
						<img src="${promotionList.ad_image}">
						</div>
					</td>
					<td>
						<div class="event-wrap">
							<h3><a href="#">${promotionList.ad_contents}</a></h3>
							<div class="meta">
								<div class="organizers">
									<a href="#">${promotionList.ad_date}</a>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="r-no">
						<span>${promotionList.ad_st_num}</span>
						</div>
					</td>
					<td>
						<div class="primary-btn">
							<a class="btn btn-primary" href="#">바로가기</a>	
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${pm.prev}">
			<a href="<c:url value='/promotion/list${pm.cri.getUrl(pm.startPage-1) }'/>">이전</a>
		</c:if>
		<c:forEach begin="${pm.startPage }" end="${pm.endPage}" var="i">
			<a href="<c:url value='/promotion/list${pm.cri.getUrl(i) }'/>">${i}</a>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="<c:url value='/promotion/list${pm.cri.getUrl(pm.endPage+1) }'/>">다음</a>
		</c:if>
	</div>
</body>
</html>